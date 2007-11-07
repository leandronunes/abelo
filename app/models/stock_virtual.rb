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
      unless p.stock_ins.empty?
        StockVirtual.new(:product_in_list => p, :amount_in_list => p.amount_in_stock )
      end
    end
    virtual_ins.compact
  end


end
