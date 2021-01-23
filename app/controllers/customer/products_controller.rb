class Customer::ProductsController < ApplicationController

  def index

    @product = Product.all
    @product = Product.new

  end

  def show

  end
  
end
