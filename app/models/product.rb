class Product < ApplicationRecord
  belongs_to :genre
  has_many :order_details
  has_many :cart_items
  attachment :image
  
   def tax_on
    @tax_on_price = self.price * 1.10
    @tax_on_price.floor
   end
end
