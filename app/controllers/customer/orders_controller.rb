class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
   @order = Order.new
   
  end

  def confirm
      @order = Order.new
      @cart_items = current_customer.cart_items
      @order.payment_method = params[:payment_method]
      if params[:address_option] == "0"
        @order.postcode = current_customer.postcode
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name
      elsif params[:address_option] == "1"
        @sta = params[:kaito_address].to_i
        @address = Address.find(@sta)
        @order.postcode = @address.postcode
        @order.address = @address.address
        @order.name = @address.name
      elsif params[:address_option] == "2"
        @order.postcode = params[:postcode]
        @order.address = params[:address]
        @order.name = params[:name]
      end
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

private
 def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_price, :cart_item_id)
 end

  end
end