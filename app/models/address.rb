class Address < ApplicationRecord
  belongs_to :customer

  validates :address, presence: true
  validates :post_code, presence: true, format: {with: /\A\d{7}\z/}
  validates :name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
end
