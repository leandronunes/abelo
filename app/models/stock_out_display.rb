class StockOutDisplay < StockDisplay

  def self.available_fields
    ['date', 'amount', 'price']
  end

  def self.describe(field)
  {
    'date' => I18n.t(:date),
    'amount' => I18n.t(:amount),
    'price' => I18n.t(:sell_price)
  }[field] || field
  end

end
