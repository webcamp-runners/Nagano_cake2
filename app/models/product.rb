class Product < ApplicationRecord
  belongs_to :genre
  has_many :order_details
  has_many :cart_items
  attachment :image
  
  validates :name, :image, :genre_id, presence: true
  validates :introduction, length: {maximum: 200}
  validates :price, numericality: { only_integer: true }
  def tax_on
    @tax_on_price = self.price * 1.10
    @tax_on_price.floor
  end
end
