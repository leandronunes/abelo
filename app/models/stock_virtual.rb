class StockVirtual < Stock

  attr_accessor :product_in_list, :amount_in_list


  def save
    raise "You cannot have a instance of this class"
  end


  def self.create_virtuals(products)
    return Array.new if (products.nil?) 
    products.map do |p|
      StockVirtual.new(:product_in_list => p, :amount_in_list => p.amount_in_stock )
    end
  end

  def self.create_virtual_ins(products)
    return Array.new if (products.nil?) 
    virtual_ins = products.map do |p|
      StockVirtual.new(:product_in_list => p, :amount_in_list => p.amount_in_stock_in )
    end
    virtual_ins.compact
  end

  def self.create_virtual_devolutions(products)
    return Array.new if (products.nil?) 
    virtual_ins = products.map do |p|
      StockVirtual.new(:product_in_list => p, :amount_in_list => p.amount_in_stock_devolution )
    end
    virtual_ins.compact
  end

  def self.create_virtual_outs(products)
    return Array.new if (products.nil?) 
    virtual_outs = products.map do |p|
      StockVirtual.new(:product_in_list => p, :amount_in_list => p.amount_in_stock_out )
    end
    virtual_outs.compact
  end

  def self.create_virtual_downs(products)
    return Array.new if (products.nil?) 
    virtual_downs = products.map do |p|
      StockVirtual.new(:product_in_list => p, :amount_in_list => p.amount_in_stock_down )
    end
    virtual_downs.compact
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
