class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
   @order = Order.new
   @shipping_addresses = Address.where(customer: current_customer)
  end

  def confirm
      @order = Order.new
      @cart_items = current_customer.cart_items
      @order.payment_method = params[:order][:payment_method]
      if params[:order][:address_option]== "0"
        @order.post_code = current_customer.post_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name
      elsif params[:order][:address_option] == "1"
        @order.post_code = @address.post_code
        @order.address = @address.address
        @order.name = @address.name
      elsif params[:order][:address_option] == "2"
        @order.post_code = params[:order][:post_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
      end
  end

  def create
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
      if @order.save
        address = current_customer.addresses.new
        address.name = @order.name
        address.address = @order.address
        address.postcode = @order.postcode
        unless current_customer.addresses.exists?(address: address.address)
          address.save
        end
        @cart_items = current_customer.cart_items.all
        @cart_items.each do |cart_item|
          @order_items = @order.order_items.new
          @order_items.item_id = cart_item.item.id
          #@order_items.tax_included_price = cart_item.item.tax_exclude_price
          @order_items.amount = cart_item.amount
          @order_items.save
        end
        current_customer.cart_items.destroy_all
        redirect_to homes_path
      else
        redirect_to "/"
      end
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
    params.require(:order).permit(:shipping_price, :billing, :name, :address, :postcode, :payment_method, :status)
 end

 def address_params
    params.require(:order).permit(:postal_code, :address, :name)
 end

end
