class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :orders
  has_many :cart_items
  has_many :addresses
  
  def cart_total_price
    total = 0
    self.cart_items.each do |cart_item|
      total += cart_item.tax_on_price
    end
    total
  end

 
end
