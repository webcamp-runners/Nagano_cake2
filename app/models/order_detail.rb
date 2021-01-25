class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  enum making_status: { cannot: 0, waiting: 1, making: 2, done: 3 }
end
