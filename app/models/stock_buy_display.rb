class StockBuyDisplay < StockDisplay

  def self.available_fields
    super + [ 'supplier', 'validity', 'price']
  end
  
  def self.describe(field)
     field = super(field)
    {
     'supplier' => _('Supplier'),
     'validity' => _('Validity'),
     'price' => _('Buy Price')
    }[field] || field
  end

end
