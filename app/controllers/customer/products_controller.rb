class Customer::ProductsController < ApplicationController

  def index
    @products = Product.all
    @product = Product.new
  end

  def show
    @products = Product.all
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end
  
end
