class Admin::OrdersController < ApplicationController

  def index

   if params[:customer_id]
     @orders = Order.where(customer_id: params[:customer_id]).page(params[:page]).per(10)
   else
     @orders = Order.page(params[:page]).per(10)
   end
  end

  def show
  @order = Order.find(params[:id])
  @order_details = @order.order_details
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
