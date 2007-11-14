class StockDownDisplay < StockDisplay

  def self.available_fields
    ['date', 'amount', 'product']
  end

  def self.describe(field)
  {
    'date' => _('Date'),
    'amount' => _('Amount'),
    'product' => _('Product')
  }[field] || field
  end

end
