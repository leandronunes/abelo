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

  def self.create_virtual_outs(products)
    return Array.new if (products.nil?) 
    virtual_outs = products.map do |p|
      StockVirtual.new(:product_in_list => p, :amount_in_list => p.amount_in_stock_out )
    end
    virtual_outs.compact
  end


end
