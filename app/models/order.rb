class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer
  
  validates :post_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
end
