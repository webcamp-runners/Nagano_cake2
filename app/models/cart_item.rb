class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  
  def tax_on_price
      @product = product.price * 1.10 * amount
      @product.floor
  end
  
  
  
end