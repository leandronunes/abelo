
  def display_collection(collection = Array.new, html_options = {})
    content = Array.new
    collection.each do |c|
      content.push(
        [
          display_collection_options(c),
          display_info(c,html_options, 'lite' )
        ]
      )
    end
    item_class = []
    item_class.push(html_options[:item_class]) unless item_class.include?(html_options[:item_class])
    collection_class = ['info_list']
    collection_class.push(html_options[:collection_class]) unless collection_class.include?(html_options[:collection_class])
      content_tag(:ul,
        content.map{|c|
          content_tag(:li, c, :class => item_class.join(' ')) +
          tag(:br, :style => 'clear:both;')
        }.join("\n"),
        :class => collection_class.join(' ')
      )
  end

  def display_info(object, html_options = {}, type = 'full')
    if type == 'full'
      fields = @organization.configuration.send("full_#{object.class.to_s.tableize.singularize}")
    else
      fields =  @organization.configuration.send("lite_#{object.class.to_s.tableize.singularize}")
    end

    fields.map do |f|
      content_tag(:div,
        display_field_info(object, f),
        html_options
      )
    end.join("\n")
  end


  ##################################
  # Specific Block Methods Related
  ##################################

  # Generate a list by a given collection passed as argument.
  # The block passed indicates how each element of the list must be drawed.
  # You can use this method like this:
  #
  #       <% display_collection_by_block @products do |item| %>
  #
  #         <%= display_field_info(item, 'name',{:class => 'line_item'}) %>
  #
  #         <%= display_field_info(item, 'size') %>
  #
  #      <% end %>
  def display_collection_by_block(collection = Array.new, html_options = {}, &block)
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

  # End Specific Block Methods Related

  def display_field_info(object, field, html_options = {})
    content = object.send("#{field}")
    content_tag(:div,
      [
       content_tag(:strong, object.class.send("title_#{field}") + ": "),
       begin
         self.send("display_field_type_#{content.class.to_s.tableize.singularize}", content)
       rescue
         content.name
       end
      ].join("\n"),
     html_options
    )
  end

  def display_field_type_nil_class(content=nil)
    nil
  end

  def display_field_type_string(content)
    content_tag(:span, content)
  end

  def display_field_type_float(content)
    content_tag(:span, content)
  end
  def display_field_type_fixnum(content)
    content_tag(:span, content)
  end

  def display_field_type_array(content)
    content_tag(:ul,
      content.map{ |c|
        content_tag(:li, c.name)
      }.join("\n")
    )
  end

  def display_show_info(object, html_options = {})
    content_tag(:div, display_info(object, html_options))
  end

  def display_show_info_options(object, html_options = {})
    content_tag(:div,
      [
        button('back', _('Back'), :back, {:action => 'destroy', :id => object.id}),
        button('edit', _('Edit'), :edit, :action => 'edit', :id => object.id)
      ].join("\n"),
      html_options
    )
  end

  def display_edit_info(object, html_options = {}, &block)
    content = capture(object, &block)
    concat(
      content_tag(:div,
        content,
        :id => 'info_form'
      ),
      block.binding
    )
  end

  def display_edit_info_options(object, html_options = {})
    content_tag(:div,
      [
        button('back', _('Back'), :back, {:action => 'list'}),
        button('save', _('Save'), :save), 
        button('reset', _('Reset'), :reset) 
      ].join("\n"),
      html_options
    )
  end

  def display_field_edit(item, field, info = {})
    unless @organization.nil?
      return '' unless @organization.configuration.send("full_#{item.class.to_s.tableize.singularize}").include?(field)
    end

    info[:html_options] ||= Hash.new

    info[:html_options][:class] = 'info_field ' +  info[:html_options][:class].to_s if !info[:html_options].empty?

    content_tag(:div,
      [
       content_tag(:label, info[:title]),
       content_tag(:span, info[:content])
      ].join("\n"),
      info[:html_options]
    )
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


