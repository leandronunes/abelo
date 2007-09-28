class StockInDisplay < StockDisplay

  def self.available_fields
    ['date', 'amount', 'supplier', 'product', 'validity', 'price']
  end
  
  def self.describe(field)
  {
   'date' => _('Date'),
   'amount' => _('Amount'), 
   'supplier' => _('Supplier'),
   'product' => _('Product'),
   'validity' => _('Validity'),
   'price' => _('Buy Price')
  }[field] || field
  end

end
