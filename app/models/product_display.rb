class ProductDisplay < DisplayConfiguration

  #FIXME remove info column and moves the information of this filed to the field description

  def self.available_fields
    ['image', 'name', 'size', 'color', 'sell_price', 'unit_measure', 'category', 'suppliers', 'amount_in_stock', 'minimum_amount', 'info', 'code']
  end

  def self.all_available?
    false
  end

  def self.describe(field)
    {
      'image' => t(:image),
      'name' =>  t(:name),
      'size' => t(:size),
      'color' => t(:color),
      'sell_price' => t(:sell_price),
      'unit_measure' => t(:unit),
      'category' => t(:category),
      'suppliers' => t(:suppliers),
      'amount_in_stock' => t(:amount_in_stock) ,
      'minimum_amount' => t(:minimum_amount) ,
      'info' => t(:additional_information),
      'code' => t(:code),
    }[field] || field
  end

end
