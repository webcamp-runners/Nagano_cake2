class Order < ApplicationRecord
  enum payment_method: {
       クレジットカード: 0,
       銀行振込: 1,
    }

  enum status: {
    入金待ち:   0,
    入金確認:   1,
    製作中:     2,
    発送準備中: 3,
    発送済み:   4,
  }

  has_many :order_details
  belongs_to :customer

  validates :post_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

  def tax_on
    @tax_on_price = self.product.price * 1.10
    @tax_on_price.floor
  end

  def sub_total
     @sub_total = product.price*amount*1.10
     @sub_total.floor
  end

  def full_name
    self.last_name + self.first_name
  end

end
