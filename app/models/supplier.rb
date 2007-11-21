class Supplier < SystemActor

  has_and_belongs_to_many :products
  has_many :stock_ins
  belongs_to :category, :class_name => 'SupplierCategory', :foreign_key => 'category_id' 

  def stock_virtuals
    StockVirtual.create_virtual_supplier(self)
  end

  def amount_purchased_of_product(product)
    self.stock_ins.find(:all, :conditions => {:product_id => product}).sum(&:amount).to_f
  end

end
