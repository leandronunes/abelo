class Product < ActiveRecord::Base

  belongs_to :organization
  belongs_to :category, :class_name => 'ProductCategory'
  has_many :images
  has_and_belongs_to_many :suppliers
  has_many :stock_entries

  validates_presence_of :description, :sell_price, :unit

  validates_presence_of :organization_id, :message => 'Products must be associated to an organization'

  validates_presence_of :category_id, :message => 'Every product must belong to a category'

  def ammount_in_stock
    self.connection.select_value('select sum(ammount) from stock_entries where product_id = %d' % self.id).to_f
  end

end
