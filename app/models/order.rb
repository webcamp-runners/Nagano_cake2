class Order < ApplicationRecord
  enum payment_method: {
       クレジットカード: 0,
       銀行振込: 1,
    }
  
  has_many :order_details
  belongs_to :customer
  
  validates :post_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  
 
end
