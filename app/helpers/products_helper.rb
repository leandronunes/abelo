module ProductsHelper

  def select_unit(object, method)
    select(object, method, [
      [ _('Units'), 'un' ],
      [ _('Kilograms'), 'kg' ],
    ])
  end

  def select_suppliers(product)
    product.organization.suppliers.map { |s|
      content_tag(
        'div',
        check_box_tag("suppliers[#{s.id}]", 1, product.suppliers.include?(s)) + s.name
      )
    }.join("\n")
  end

  def select_size(object, method)
    select(object, method, [
      [ _('N/A'), '' ],
      [ _('Small'), 'S' ],
      [ _('Medium'), 'M' ],
      [ _('Large'), 'L' ],
      [ _('Extra Large'), 'XL' ],
    ])
  end

end
