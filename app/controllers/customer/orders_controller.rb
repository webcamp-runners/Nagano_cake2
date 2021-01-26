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
        ship = Address.find(params[:order][:address_shipping])
        @order.post_code = ship.post_code
        @order.address = ship.address
        @order.name = ship.name
      elsif params[:order][:address_option] == "2"
        @order.post_code = params[:order][:post_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
      end
  end

  def create
      @order = current_customer.orders.new(order_params)
      @order.save
       redirect_to complete_orders_path
      # カート商品の情報を注文商品に移動
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
      OrderDetail.create(
        product_id: cart_item.product.id,
        order_id: @order.id,
        amount: cart_item.amount,
        price: cart_item.product.tax_on,
        making_status: 0,
      )
     end
     # 注文完了後、カート商品を空にする
     @cart_items.destroy_all
  end



  def complete
    cart_items = current_customer.cart_items.all
    cart_items.destroy_all
  end

  def index
    @orders = current_customer.orders
    @order = Order.all
  end

  def show
   @order = Order.find(params[:id])
   @order_details = @order.order_details
  end

private

 def order_params
    params.require(:order).permit(:post_code, :address, :name, :payment_method, :total_payment, :shipping_cost, :status, :customer_id)
 end

 def address_params
    params.require(:address).permit(:post_code, :address, :name)
 end

end
