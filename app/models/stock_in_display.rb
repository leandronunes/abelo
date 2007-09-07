class StockInDisplay < StockEntryDisplay

  def self.available_fields
    ['date', 'amount', 'price', 'supplier', 'product', 'validity', 'payment_status']
  end
  
  def self.describe(field)
  {
   'date' => _('Date'),
   'amount' => _('Amount'), 
   'price' => _('Price'),
   'supplier' => _('Supplier'),
   'product' => _('Product'),
   'validity' => _('Validity'),
   'payment_status' => _('Payment Status')
  }[field] || field
  end

end
