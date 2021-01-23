class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
   @order = Order.new
   @shipping_addresses = ShippingAddress.where(customer: current_customer)
  end

  def confirm
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    flash[:notice] = "ご注文が確定しました。"
    redirect_to thanx_customers_orders_path

    if params[:order][:ship] == "1"
      current_customer.shipping_address.create(address_params)


    end

  def complete

  end

  def index
    @orders = current_customer.orders
  end

  def show
   @order = Order.find(params[:id])
   @order_details = @order.order_details
  end


 def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_price, :cart_item_id)
 end

  end
end