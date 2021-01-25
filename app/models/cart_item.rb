class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  def tax_on
    @tax_on_price = self.product.price * 1.10
    @tax_on_price.floor
  end

  def sub_total
     @sub_total = product.price*amount*1.10
     @sub_total.floor
  end

  # 請求額の計算
  def billing
    total_price(current_cart) + 800
  end


end