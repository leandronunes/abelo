class Product < ActiveRecord::Base

  belongs_to :organization
  belongs_to :category, :class_name => 'ProductCategory', :foreign_key => 'category_id'
  has_many :images
  has_and_belongs_to_many :suppliers
  has_many :stocks
  has_many :stock_ins
  validates_uniqueness_of :code, :scope => :organization_id

  validates_presence_of :name, :sell_price, :unit

  validates_presence_of :organization_id, :message => _('Products must be associated to an organization')

  validates_presence_of :category_id, :message => _('Every product must belong to a category')

  has_many :sale_items

  acts_as_ferret

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    self.find_by_contents(q, options)
  end

  def customers
    self.sale_items.map{|i| i.sale}.uniq.map{|i| i.customer}.uniq
  end

  def amount_in_stock
    self.connection.select_value('select sum(amount) from stocks where product_id = %d' % self.id).to_f
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
