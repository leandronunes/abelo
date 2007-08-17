  def display_collection(collection = Array.new, html_options = {}, &block)
    content = Array.new
    collection.each do |c|
      content.push(
        display_collection_options(c) +
        capture(c, &block)
      )
    end
    item_class = []
    item_class.push(html_options[:item_class]) unless item_class.include?(html_options[:item_class])
    collection_class = ['info_list']
    collection_class.push(html_options[:collection_class]) unless collection_class.include?(html_options[:collection_class])
    concat(
      content_tag(:ul,
        content.map{|c|
          content_tag(:li, c, :class => item_class.join(' ')) +
          tag(:br, :style => 'clear:both;')
        }.join("\n"),
        :class => collection_class.join(' ')
      ), block.binding
    )
  end

  def display_info(object, html_options = {}, &block)
    content = capture(object, &block)
    concat(
      content_tag(:div,
        content +
        display_info_options_on_show(object, html_options[:button_class])
      ),
      block.binding
    )
  end

  def display_field_full(item, field, info = {})
    unless @organization.nil?
      return '' unless @organization.configuration.send("full_#{item.class.to_s.tableize.singularize}").include?(field)
    end
    display_field_info(info)
  end

  def display_field_lite(item, field, info = {})
    unless @organization.nil?
      return '' unless @organization.configuration.send("lite_#{item.class.to_s.tableize.singularize}").include?(field)
    end
    display_field_info(info)
  end


  def display_info_edit(object, html_options = {}, &block)
    content = capture(object, &block)
    concat(
      content_tag(:div,
        content +
        display_info_options_on_edit(object, html_options[:button_class])
      ),
      block.binding
    )
  end


  def display_field_edit(item, field, info = {})
    unless @organization.nil?
      return '' unless @organization.configuration.send("full_#{item.class.to_s.tableize.singularize}").include?(field)
    end
    display_field_info_edit(info)
  end

  private 

  #Display a set of options available generally on list methods
  def display_collection_options(item)
    content_tag(:div,
      [
        button('view_small', _('Show'), :show, :action => 'show', :id => item.id),
        button('edit_small', _('Edit'), :edit, :action => 'edit', :id => item.id),
        button('del_small', _('Destroy'), :destroy, {:action => 'destroy', :id => item.id},
               :method => 'post', :confirm => _('Are you sure?'))
      ].join("\n"),
      :class => 'list_item_button'
    )
  end

  def display_field_info(info)
    content_tag(:div,
      [
       content_tag(:strong, info[:title]),
       content_tag(:span, info[:content])
      ].join("\n"),
      info[:html_options]
    )
  end

  def display_field_info_edit(info)
    content_tag(:div,
      [
       content_tag(:label, info[:title]),
       content_tag(:span, info[:content])
      ].join("\n"),
      info[:html_options]
    )
  end


  def display_info_options_on_show(object, html_options = {})
    content_tag(:div,
      [
        button('back', _('Back'), :back, {:action => 'destroy', :id => object.id}),
        button('edit', _('Edit'), :edit, :action => 'edit', :id => object.id)
      ].join("\n"),
      html_options
    )
  end

  def display_info_options_on_edit(object, html_options = {})
    content_tag(:div,
      [
        button('back', _('Back'), :back, {:action => 'destroy', :id => object.id}),
        button('edit', _('Edit'), :edit, :action => 'edit', :id => object.id)
      ].join("\n"),
      html_options
    )
  end
