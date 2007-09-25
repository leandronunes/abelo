class StockInDisplay < StockDisplay

  def self.available_fields
    ['date', 'amount', 'supplier', 'product', 'validity', 'payment_method', 'value']
  end
  
  def self.describe(field)
  {
   'date' => _('Date'),
   'amount' => _('Amount'), 
   'supplier' => _('Supplier'),
   'product' => _('Product'),
   'validity' => _('Validity'),
   'payment_method' => _('Payment Method'),
   'value' => _('Value')
  }[field] || field
  end

end
