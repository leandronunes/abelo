class ProductDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'size', 'color', 'description', 'sell_price', 'unit', 'category', 'suppliers', 'amount_in_stock', 'minimum_amount', 'image']
  end

  def self.describe(field)
    {
      'name' =>  _('Name'),
      'size' => _('Size'),
      'color' => _('Color'),
      'description' => _('Description'),
      'sell_price' => _('Sell Price'),
      'unit' => _('Unit'),
      'category' => _('Category'),
      'supplier_ids' => _('Suppliers'),
      'amount_in_stock' => _('Amount in Stock') ,
      'minimum_amount' => _('Minimum Amount') ,
      'image' => '',
    }[field] || field
  end

end
