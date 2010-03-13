class StockInDisplay < StockDisplay

  def self.available_fields
    super + [ 'supplier', 'validity', 'price']
  end
  
  def self.describe(field)
     field = super(field)
    {
     'supplier' => I18n.t(:supplier),
     'validity' => I18n.t(:validity),
     'price' => I18n.t(:buy_price)
    }[field] || field
  end

end
