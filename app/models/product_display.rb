class ProductDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'size', 'color', 'description', 'sell_price', 'unit', 'category', 'suppliers', 'minimum_amount']
  end

  def self.title_size
    _('Size')
  end

  def self.title_color
    _('Color')
  end

  def self.title_description
    _('Description')
  end

  def self.title_sell_price
    _('Sell Price')
  end

  def self.title_unit
    _('Unit')
  end
  
  def self.title_suppliers
    _('Suppliers')
  end
  
  def self.title_image
    ''
  end

  def self.title_minimum_amount
    _('Minimum Amount')
  end

end
