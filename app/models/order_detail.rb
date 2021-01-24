class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product
  
  enum making_status: { cannnot: 0, waiting: 1, making: 2, done: 3 }
  # enum making_status: { "製作不可" => 0 "製作待ち" => 1 "製作中" => 3 "製作完了" => 4 }
end
