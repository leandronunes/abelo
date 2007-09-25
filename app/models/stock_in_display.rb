class StockInDisplay < StockDisplay

  def self.available_fields
    ['date', 'amount', 'supplier', 'product', 'validity', 'payment_method', 'price']
  end
  
  def self.describe(field)
  {
   'date' => _('Date'),
   'amount' => _('Amount'), 
   'supplier' => _('Supplier'),
   'product' => _('Product'),
   'validity' => _('Validity'),
   'payment_method' => _('Payment Method'),
   'price' => _('Buy Price')
  }[field] || field
  end

end
