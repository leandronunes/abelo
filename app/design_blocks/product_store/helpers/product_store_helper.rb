module ProductStoreHelper

  def image_link(image, link = { } )
    design_link_to_remote(
      content_tag('span',image_tag(url_for_image_column(image, 'picture', :name => 'thumb'))),
      link) if image
  end

  def category_hierarchy(category, separator = ' &rarr; ')
    c = category
    result = ''
    while !c.nil?
      result = separator + design_link_to_remote(c.name, :url => { :action => 'category', :category_id => c }) + result
      c = c.parent
    end

    design_link_to_remote(_('Start'), :url => { :action => '' }) + result
  end

  def product_title(title)
    content_tag(:b, title)
  end

  def randon(array)
    array.at(rand(array.size))
  end


end
