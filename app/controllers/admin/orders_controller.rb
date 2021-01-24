class Admin::OrdersController < ApplicationController

  def index
  @orders = Order.all
  @orders = Order.page(params[:page]).per(10)
  @order_detail = OrderDetail.find(params[:id])
  end

  def show
  @order = Order.find(params[:id])
	@order.order_details = @order_details
  end

  def update
  @order = Order.find(params[:id])
  if @order.update(order_params)
     flash[:success] = "注文ステータスを変更しました"
     redirect_to admin_order_path(@order)
  else
	   render ""
  end
  end

  private
  def order_params
    params.require(:orders).permit(:customer_id, :total_payment, :shipping_cost, :name, :address, :post_code, :status, :payment_method)
  end
end
