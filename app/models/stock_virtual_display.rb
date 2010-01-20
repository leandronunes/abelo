class StockVirtualDisplay < StockDisplay

  def self.available_fields
    ['product_in_list', 'amount_in_list']
  end

  def self.describe(field)
    {
      'product_in_list' => t(:product),
      'amount_in_list' =>  t(:amount),
    }[field] || field
  end

end
