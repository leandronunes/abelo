class Product < ActiveRecord::Base

  belongs_to :organization
  belongs_to :category, :class_name => 'ProductCategory'
  has_many :images
  has_and_belongs_to_many :suppliers

  validates_presence_of :description, :sell_price

  validates_presence_of :organization, :message => 'Products must be associated to an organization'

  validates_presence_of :category_id, :message => 'Every product must belong to a category'

end
