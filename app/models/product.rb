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

  def self.available_fields
    ['name', 'size', 'color', 'description', 'sell_price', 'unit', 'category_id', 'suppliers']
  end

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    results = self.find_by_contents(q, options)
    return results
  end

  #TODO Remove this it's deprecated use title_"field"
#  def self.describe_field(field)
#    {
#      'id' => 'Id',
#      'name' => _('Name'),
#      'size' => _('Size'),
#      'organization_id' => _('Organization'),
#      'category_id' => _('Category'),
#    }[field.to_s] || field
#  end

  def ammount_in_stock
    self.connection.select_value('select sum(ammount) from stock_entries where product_id = %d' % self.id).to_f
  end

  def total_cost
    self.connection.select_value('select sum(ammount * price) from stock_entries where product_id = %d' % self.id).to_f
  end

  def image
    self.images.find(:first)
  end

  def self.title_name
    _('Name')
  end

#TODO see if it's the better way to do that
  def self.name_on_edit
    "text_field('product', 'name')"
  end

  def self.title_size
    _('Size')
 end

  def self.title_color
    _('Color')
  end


  def self.title_description
    _('Description')
  end

  def self.title_sell_price
    _('Sell Price')
  end

  def self.title_unit
    _('Unit')
  end

  def self.title_category_id
    _('Category')
  end

  def self.title_suppliers
    _('Suppliers')
  end

end
