class ProductDisplay < DisplayConfiguration

  def self.available_fields
    ['image', 'name', 'size', 'color', 'description', 'sell_price', 'unit', 'category', 'suppliers', 'amount_in_stock', 'minimum_amount','info']
  end

  def self.describe(field)
    {
      'image' => _('Image'),
      'name' =>  _('Name'),
      'size' => _('Size'),
      'color' => _('Color'),
      'description' => _('Description'),
      'sell_price' => _('Sell Price'),
      'unit' => _('Unit'),
      'category' => _('Category'),
      'suppliers' => _('Suppliers'),
      'amount_in_stock' => _('Amount in Stock') ,
      'minimum_amount' => _('Minimum Amount') ,
      'info' => _('Additional Information'),
    }[field] || field
  end

end
