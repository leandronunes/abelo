module StoreHelper

  def image_link(image, link = { } )
    link_to(
      content_tag('span',image_tag(url_for_image_column(image, 'picture', :name => 'thumb'))),
      link)
  end

  def category_hierarchy(category)
    result = link_to(category.name, :action => 'show_category', :id => category)
    c = category.parent
    while c
      result = link_to(c.name, { :action => 'show_category', :id => c }) + '&rarr;' + result
      c = c.parent
    end
    result
  end

end
