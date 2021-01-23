class Customer::CartItemsController < ApplicationController

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.save
    redirect_to customer_cart_items_path
  end

  def index
    @cart_items = current_customer.cart_items
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
      params.require(:cart_items).permit(:amount)
    end

end
