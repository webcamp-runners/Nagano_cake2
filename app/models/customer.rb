class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true, format: {with: /\A[一-龥ぁ-ん]/}
  validates :first_name, presence: true, format: {with: /\A[一-龥ぁ-ん]/}
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :post_code, presence: true, format: {with: /\A\d{7}\z/}
  validates :address, presence: true
  validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/}

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

  def full_name
    self.last_name + self.first_name
  end
end
