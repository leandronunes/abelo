class StockVirtual < Stock

  attr_accessor :product_in_list, :amount_in_list


  def save
    raise "You cannot have a instance of this class"
  end


  def self.create_virtuals(products, type= 'stock')
    return Array.new if (products.nil?) 
    products.map do |p|
      StockVirtual.new(:product_in_list => p, :amount_in_list => p.amount_in_stock(type) )
    end
  end

  def self.create_virtual_customer(customer)
    return [] unless customer.kind_of?(Customer)
    virtual_customer = customer.products.map do |p|
      StockVirtual.new(:product_in_list => p, :amount_in_list => p.amount_consumed_by_customer(customer) )
    end
    virtual_customer.compact
  end

  def self.create_virtual_supplier(supplier)
    return [] unless supplier.kind_of?(Supplier)
    virtual_customer = supplier.products.map do |p|
      StockVirtual.new(:product_in_list => p, :amount_in_list => p.amount_purchased_of_supplier(supplier) )
    end
    virtual_customer.compact
  end

end
