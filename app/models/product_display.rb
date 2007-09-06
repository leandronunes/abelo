class ProductDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'size', 'color', 'description', 'sell_price', 'unit', 'category', 'suppliers', 'ammount_in_stock', 'minimum_amount']
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
      'suppliers' => _('Suppliers'),
      'minimum_amount' => _('Minimum Amount') ,
    }[field] || field
  end

end
