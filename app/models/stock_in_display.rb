class StockInDisplay < StockDisplay

  def self.available_fields
    super + [ 'supplier', 'validity', 'price']
  end
  
  def self.describe(field)
    super.merge({
     'supplier' => _('Supplier'),
     'validity' => _('Validity'),
     'price' => _('Buy Price')
    })[field] || field
  end

end
