class ProductDisplay < DisplayConfiguration

  #FIXME remove info column and moves the information of this filed to the field description

  def self.available_fields
    ['image', 'name', 'size', 'color', 'sell_price', 'unit', 'category', 'suppliers', 'amount_in_stock', 'minimum_amount', 'info', 'code']
  end

  def self.all_available?
    false
  end

  def self.describe(field)
    {
      'image' => _('Image'),
      'name' =>  _('Name'),
      'size' => _('Size'),
      'color' => _('Color'),
      'sell_price' => _('Sell Price'),
      'unit' => _('Unit'),
      'category' => _('Category'),
      'suppliers' => _('Suppliers'),
      'amount_in_stock' => _('Amount in Stock') ,
      'minimum_amount' => _('Minimum Amount') ,
      'info' => _('Additional Information'),
      'code' => _('Code'),
    }[field] || field
  end

end
