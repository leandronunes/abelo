class Product < ActiveRecord::Base

  belongs_to :organization
  belongs_to :category, :class_name => 'ProductCategory', :foreign_key => 'category_id'
  has_many :images
  has_and_belongs_to_many :suppliers
  has_many :stock_entries

  validates_presence_of :name, :sell_price, :unit

  validates_presence_of :organization_id, :message => _('Products must be associated to an organization')

  validates_presence_of :category_id, :message => _('Every product must belong to a category')

  acts_as_ferret

  def self.configuration_class
    ProductDisplay
  end


  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    self.find_by_contents(q, options)
  end

  def ammount_in_stock
    self.connection.select_value('select sum(ammount) from stock_entries where product_id = %d' % self.id).to_f
  end

  def total_cost
    self.connection.select_value('select sum(ammount * price) from stock_entries where product_id = %d' % self.id).to_f
  end

  def image
    self.images.find(:first)
  end

end
