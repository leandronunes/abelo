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
      'image' => I18n.t(:image),
      'name' =>  I18n.t(:name),
      'size' => I18n.t(:size),
      'color' => I18n.t(:color),
      'sell_price' => I18n.t(:sell_price),
      'unit_measure' => I18n.t(:unit),
      'category' => I18n.t(:category),
      'suppliers' => I18n.t(:suppliers),
      'amount_in_stock' => I18n.t(:amount_in_stock) ,
      'minimum_amount' => I18n.t(:minimum_amount) ,
      'info' => I18n.t(:additional_information),
      'code' => I18n.t(:code),
    }[field] || field
  end

end
