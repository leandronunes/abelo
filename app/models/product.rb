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
    self.stocks.sum('amount').to_f
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


  def total_cost
    total = 0
    self.stock_ins.each{ |s| total = total + s.price * s.amount}
    total
  end

  def image
    self.images.find(:first)
  end

end
