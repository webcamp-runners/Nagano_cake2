class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
   @order = Order.new

  end

  def confirm
      @order = Order.new
      @cart_items = current_customer.cart_items
      @order.payment_method = params[:order][:payment_method]
      if params[:order][:address]== "0"
        @order.postcode = current_customer.postcode
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name
        byebug
      elsif params[:order][:address] == "1"

        @order.postcode = @address.postcode
        @order.address = @address.address
        @order.name = @address.name
      elsif params[:order][:address] == "2"
        @order.postcode = params[:postcode]
        @order.address = params[:address]
        @order.name = params[:name]
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

end
