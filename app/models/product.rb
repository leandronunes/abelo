class Product < ActiveRecord::Base

  belongs_to :organization
  has_many :images

  validates_presence_of :description, :sell_price

  validates_presence_of :organization, :message => 'Products must be associated to an organization'

end
