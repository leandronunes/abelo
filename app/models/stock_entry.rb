class StockEntry < ActiveRecord::Base

  belongs_to :product
  validates_presence_of :product_id, :purpose, :date

end
