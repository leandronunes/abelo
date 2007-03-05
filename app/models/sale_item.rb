class SaleItem < ActiveRecord::Base

  validates_presence_of :sale_id, :product_id, :ammount

  belongs_to :sale
  belongs_to :product
  
end
