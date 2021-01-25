class Address < ApplicationRecord
  belongs_to :customer
  
  
  def delivery_info
    self.post_code + " " + self.address + " " + self.name
  end
end


