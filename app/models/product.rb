class Product < ActiveRecord::Base

  belongs_to :organization
  belongs_to :category, :class_name => 'ProductCategory', :foreign_key => 'category_id'
  has_many :images
  has_and_belongs_to_many :suppliers
  has_many :stocks
  has_many :stock_ins
  has_many :stock_devolutions
  has_many :stock_outs
  has_many :stock_downs

  before_create  do |product|
    product.code ||=(Product.maximum(:code, :conditions => {:organization_id => product.organization}) || 0).to_i + 1
  end

  validates_uniqueness_of :code, :scope => :organization_id

  validates_presence_of :name, :sell_price, :unit

  validates_presence_of :organization_id, :message => _('Products must be associated to an organization')

  validates_presence_of :category_id, :message => _('Every product must belong to a category')

  has_many :sale_items

  acts_as_ferret :remote => true

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    self.find_by_contents(q, options)
  end

  def customers
    self.sale_items.map{|i| i.sale}.uniq.map{|i| i.customer}.uniq
  end

  def amount_in_stock(type = 'stock')
    self.send(type.pluralize).sum('amount').to_f
  end

  def amount_in_stock_in
    self.stock_ins.sum('amount').to_f
  end

  def amount_in_stock_devolution
    self.stock_devolutions.sum('amount').to_f
  end

  def amount_in_stock_out
    self.stock_outs.sum('amount').to_f
  end

  def amount_in_stock_down
    self.stock_downs.sum('amount').to_f
  end

  def amount_consumed_by_customer(customer)
    customer.amount_consumed_by_product(self)
  end

  def amount_purchased_of_supplier(supplier)
    supplier.amount_purchased_of_product(self)
  end


  def total_cost
    total = 0
    self.stock_ins.each{ |s| total = total + s.price * s.amount}
    total
  end

  def image
    self.images.find(:first)
  end

end
