module ProductsHelper

  def display_show_info_options(object, params = {},  html_options = {})
    return '' if object.nil?

    content_tag(:div,
      [
        display_back_button({:action => 'list'}.merge(params)),
        display_edit_button({:action => 'edit', :id => object.id}.merge(params)),
        display_image_button({:action => 'images', :id => object.id}.merge(params))
      ].join("\n"),
      display_html_options(html_options)
    )
  end

end
