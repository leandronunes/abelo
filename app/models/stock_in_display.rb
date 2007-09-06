class StockInDisplay < StockEntryDisplay

  def self.available_fields
    ['date', 'ammount', 'price', 'supplier_name']
  end
  
  def self.describe(field)
  {
   'date' => _('Date'),
   'ammount' => _('Amount'), 
   'price' => _('Price'),
   'supplier_name' => _('Supplier')
  }[field] || field
  end

end
