class StockOutDisplay < StockDisplay

  def self.available_fields
    ['date', 'amount', 'price']
  end

  def self.describre(field)
  {
    'date' => _('Date'),
    'amount' => _('Amount'),
    'price' => _('Price')
  }[field] || field
  end

end
