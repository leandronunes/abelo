class StockOutDisplay < StockEntryDisplay

  def self.available_fields
    ['date', 'ammount', 'price']
  end

end
