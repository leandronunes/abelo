class StockDisplay < DisplayConfiguration

  def self.available_fields
    ['date', 'amount', 'product']
  end
  
  def self.describe(field)
    {
      'date' => I18n.t(:date),
      'amount' => I18n.t(:amount),
      'product' => I18n.t(:product)
    }[field] || field
  end

end
