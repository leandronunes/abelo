class StockDisplay < DisplayConfiguration

  def self.available_fields
    ['date', 'amount', 'product']
  end
  
  def self.describe(field)
    {
      'date' => t(:date),
      'amount' => t(:amount),
      'product' => t(:product)
    }[field] || field
  end

end
