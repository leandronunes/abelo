module ProductsHelper

  def select_unit(object, method)
    select(object, method, [
      [ _('Units'), 'un' ],
      [ _('Kilograms'), 'kg' ],
    ])
  end

  def options_for_product_category(cat, selected_value)
    if cat.leaf?
      content_tag('option', cat.name)
    else
      options = { :label => cat.name, :style => "padding-left: #{cat.level}em;" }
      options.merge!(:selected => 'selected') if (selected_value == cat.id)
      content = cat.children.map { |child| options_for_product_category(child, selected_value) }.join('')
      content_tag("optgroup", content, options)
    end
  end

  def select_category(object, method)
    product = self.instance_variable_get("@#{object}")
    categories = product.organization.top_level_product_categories
    select_tag("#{object}[#{method}]", categories.map { |c| options_for_product_category(c,object.send(method)) }.join('') )
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
