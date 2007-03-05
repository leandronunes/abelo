class Sale < ActiveRecord::Base

  validates_presence_of :date, :organization_id

  belongs_to :organization
  belongs_to :customer
  has_many :payments
  has_many :items, :class_name => 'SaleItem'

end
