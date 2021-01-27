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
  @customer = @order.customer
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order)
    flash[:success] = "注文ステータスを変更しました"
    @order_details = @order.order_details
    if @order.status == "入金確認"
      @order_details.update_all(making_status: 1 )
      redirect_to admin_order_path(@order)
    end
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :total_payment, :shipping_cost, :name, :address, :post_code, :status, :payment_method)
  end
end