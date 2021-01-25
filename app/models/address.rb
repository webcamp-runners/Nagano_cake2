class Address < ApplicationRecord
  belongs_to :customer

  
  
  def delivery_info
    self.post_code + " " + self.address + " " + self.name
  end


  validates :address, presence: true
  validates :post_code, presence: true, format: {with: /\A\d{7}\z/}
  validates :name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
end


