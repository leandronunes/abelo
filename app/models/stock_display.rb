class StockDisplay < DisplayConfiguration

  def self.available_fields
    ['product_in_list', 'amount_in_list']
  end

  def self.describe(field)
    {
      'product_in_list' => _('Product'),
      'amount_in_list' =>  _('Amount'),
    }[field] || field
  end



end
