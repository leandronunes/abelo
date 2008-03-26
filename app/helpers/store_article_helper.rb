module StoreArticleHelper

  def image_link(image, link = { } )
    link_to_remote(
      content_tag('span',image_tag(url_for_image_column(image, 'picture', :name => 'thumb'))),
      link) if image
  end

  def category_hierarchy(category, separator = ' &rarr; ')
    c = category
    result = ''
    while !c.nil?
      result = separator + link_to_remote(c.name, :url => hash_for_article_page_url(params.merge({ :action => 'category', :category_id => c })), :failure => "$('store_content').innerHTML=request.responseText") + result
      c = c.parent
    end

    link_to_remote(_('Start'), :url => article_page_url(params.merge({:action => 'index' })), :failure => "$('store_content').innerHTML=request.responseText" ) + result
  end

  def product_title(title)
    content_tag(:b, title)
  end

  def randon(array)
    array.at(rand(array.size))
  end


end
