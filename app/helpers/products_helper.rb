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

end
