class Customer::HomesController < ApplicationController
  def top
   @products = Product.all.where(is_active: true)
  end

  def about
    
  end
end
