class StockOutDisplay < StockDisplay

  def self.available_fields
    ['date', 'amount', 'price']
  end

  def self.describe(field)
  {
    'date' => t(:date),
    'amount' => t(:amount),
    'price' => t(:sell_price)
  }[field] || field
  end

end
