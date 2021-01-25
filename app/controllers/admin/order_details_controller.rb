class Admin::OrderDetailsController < ApplicationController
  def update
      byebug
    #   @order = Order.find(params[:id])
  @order_detail = OrderDetail.find(params[:id])
	  if @order_detail.update(order_detail_params)
	  	flash[:success] = "制作ステータスを変更しました"
	    redirect_to admin_order_path(@order_detail.order)
	  else
      render "show"
	  end
  end

  def order_detail_params
    params.require(:order_details).permit(:order_id, :making_status)
  end
end
