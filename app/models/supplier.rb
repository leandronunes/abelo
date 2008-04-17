class Supplier < SystemActor

  has_and_belongs_to_many :products
  has_many :stock_ins
  has_many :invoices
  belongs_to :category, :class_name => 'SupplierCategory', :foreign_key => 'category_id' 

  after_create do |supplier|
    supplier.organization.update_tracker('supplier_points', supplier.organization.suppliers.count)
  end

  after_destroy do |supplier|
    supplier.organization.update_tracker('supplier_points', supplier.organization.suppliers.count) unless supplier.organization.nil?
  end

  def stock_virtuals
    StockVirtual.create_virtual_supplier(self)
  end

  def amount_purchased_of_product(product)
    self.stock_ins.find(:all, :conditions => {:product_id => product}).sum(&:amount).to_f
  end

  def ledger_owner
    Invoice
  end

  def ledger_owner_ids
    self.invoices.to_a
  end

end
