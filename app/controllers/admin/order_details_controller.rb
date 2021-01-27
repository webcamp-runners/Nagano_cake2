class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
	  @order_detail.update(order_detail_params)
	  flash[:success] = "制作ステータスを変更しました"
  if @order_detail.making_status == "making"
      @order.update(status: 2)
  elsif @order.order_details.count == @order.order_details.where(making_status: "done").count
    @order.update(status: 3)
  end
  redirect_to admin_order_path(@order_detail.order)
  end

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :making_status)
  end
end
