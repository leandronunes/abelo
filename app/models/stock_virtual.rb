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

end
