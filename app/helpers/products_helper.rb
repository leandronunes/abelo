module ProductsHelper

  def select_unit(object, method)
    select(object, method, [
      [ _('Kilograms'), 'kg' ],
      [ _('Units'), 'un' ],
    ])
  end

  def show_image(image)
    link_to(
      content_tag('span', image_tag(url_for_file_column(image, 'picture'))) +
      content_tag('span', image.description),
      url_for_image_column(image, 'picture', :name => 'medium'),
      { :class => 'product_image', :popup => [ 'abelo_image', 'height=240,width=320' ] }
    )
  end

  def select_category(object, method)
    product = self.instance_variable_get("@#{object}")
    categories = product.organization.product_categories
    select(object, method, categories.map { |c| [ c.full_name, c.id ] })
  end

  def select_suppliers(product)
    product.organization.suppliers.map { |s|
      content_tag(
        'div',
        check_box_tag("suppliers[#{s.id}]", 1, product.suppliers.include?(s)) + s.name
      )
    }.join("\n")
  end

end
