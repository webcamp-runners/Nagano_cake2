class Admin::OrderDetailsController < ApplicationController
  def update
  @order_detail = OrderDetail.find(params[:id])
  @order = @order_detail.order
	  if @order_detail.update(order_detail_params)
	  	flash[:success] = "制作ステータスを変更しました"
	    redirect_to admin_order_path(@order_detail.order)
	  else
      render "show"
	  end
  end

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :making_status)
  end
end
