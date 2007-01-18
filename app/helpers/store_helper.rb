module StoreHelper

  def image_link(image, link = { } )
    link_to(
      content_tag('span',image_tag(url_for_image_column(image, 'picture', :name => 'thumb'))),
      link)
  end
end
