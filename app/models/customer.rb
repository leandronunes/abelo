class Customer < SystemActor

  belongs_to :category, :class_name => 'CustomerCategory', :foreign_key => 'category_id'
  has_many :sales
# TODO see a way to make this association
#  has_many :ledgers, :through => Sale

  after_create do |customer|
    customer.organization.update_tracker('customer_points', customer.organization.customers.count)
 end

  after_destroy do |customer|
    customer.organization.update_tracker('customer_points', customer.organization.customers.count) unless customer.organization.nil?
 end

  def products
    Sale.products_by_customer(self)  
  end

  def ledgers(options = {})
    Ledger.find(:all, :conditions => {:owner_type => 'Sale', :owner_id => self.ledger_owner_ids}.merge(options))
  end

  # Return the organization ledgers by tags and bank accounts passed as arguments
  def ledger_owner
    Sale
  end

  def ledger_owner_ids
    self.sales.to_a
  end

  def amount_consumed_by_product(product)
    self.sales.collect{|s| s.amount_consumed_by_product(product)}.sum
  end

  def stock_virtuals
    StockVirtual.create_virtual_customer(self)
  end 
  
end
