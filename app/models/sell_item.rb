class SellItem < ActiveRecord::Base

  validates_presence_of :sell_id, :product_id, :ammount

  belongs_to :sell
  belongs_to :product
  
end
