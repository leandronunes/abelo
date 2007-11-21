class Customer < SystemActor

  belongs_to :category, :class_name => 'CustomerCategory', :foreign_key => 'category_id'
  has_many :sales

  def products
    Sale.products_by_customer(self)  
  end

  def amount_consumed_by_product(product)
    self.sales.collect{|s| s.amount_consumed_by_product(product)}.sum
  end

  def stock_virtuals
    StockVirtual.create_virtual_customer(self)
  end 
  
end
