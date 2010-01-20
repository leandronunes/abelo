class StockInDisplay < StockDisplay

  def self.available_fields
    super + [ 'supplier', 'validity', 'price']
  end
  
  def self.describe(field)
     field = super(field)
    {
     'supplier' => t(:supplier),
     'validity' => t(:validity),
     'price' => t(:buy_price)
    }[field] || field
  end

end
