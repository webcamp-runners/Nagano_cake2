class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  def tax_on_price
      @product = product.price * amount* 1.10
      @product.floor
  end



end