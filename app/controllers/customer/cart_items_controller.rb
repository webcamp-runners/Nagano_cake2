class Customer::CartItemsController < ApplicationController

 before_action :authenticate_customer!


  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.save
    redirect_to cart_items_path
  end

  def index
    @cart_items = current_customer.cart_items
    @order = Order.new
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.delete
    redirect_to cart_items_path

  end

  def destroy_all
    cart_items = CartItem.all
    cart_items.delete_all
    redirect_to cart_items_path
  end

   private
    def cart_item_params
      params.require(:cart_item).permit(:amount, :product_id)
    end
end
