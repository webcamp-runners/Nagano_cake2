class Product < ApplicationRecord
  belongs_to :genre
  has_many :order_details
  has_many :cart_items
  attachment :image
  
  validates :name, :image, :genre_id, presence: true
  validates :introduction, length: {maximum: 200}
  validates :price, numericality: { only_integer: true }
end
