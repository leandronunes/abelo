
  def display_collection(collection = Array.new, params = {}, html_options = {})
    content = Array.new
    collection.each do |c|
      content.push(
        [
          display_collection_options(c, params),
          display_info(c,html_options, 'in_list' )
        ]
      )
    end
    item_class = []
    item_class.push(html_options[:item_class]) unless item_class.include?(html_options[:item_class])
    collection_class = ['info_list']
    collection_class.push(html_options[:collection_class]) unless collection_class.include?(html_options[:collection_class])
      content_tag(:ul,
        content.map{|c|
          content_tag(:li, c.to_s + tag(:br, :style => 'clear:both;'), :class => item_class.join(' '))
        },
        :class => collection_class.join(' ')
      )
  end

  def display_info(object, html_options = {}, type = '')
    type = '_' + type unless type.blank?
    fields = @organization.configuration.send("#{object.class.to_s.tableize.singularize}_display#{type}")

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

  def display_field_info(object, display_field, html_options = {})
    content = object.send("#{display_field.field}")
    content_tag(:div,
      [
       content_tag(:strong, object.class.configuration_class.send("title_#{display_field.field}") + ": "),
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

  def display_field_type_image(image, size = "50x50") 
    link_to(
      image_tag(url_for_image_column(image, 'picture', :name => 'thumb'), :size => size, :class => 'product_image', :popup => [ 'abelo_image', 'height=240,width=320' ] ),
      url_for_image_column(image, 'picture', :name => 'medium')
      )
  end

  def display_field_type_string(content)
    content_tag(:span, content)
  end

  def display_field_type_date(content)
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

  def display_show_info_options(object, params = {},  html_options = {})
    content_tag(:div,
      [
        button('back', _('Back'), :back, {:action => 'list'}.merge(params)),
        button('edit', _('Edit'), :edit, {:action => 'edit', :id => object.id}.merge(params))
      ].join("\n"),
      html_options
    )
  end


  def display_edit_info(object, html_options = {}, &block)
    content = capture(object, &block)
    concat(
      content_tag(:div,
        [
          content,
         tag(:br, :style => 'clear: left;')
        ].join("\n"),
        :id => 'info_form'
      ),
      block.binding
    )
  end

  def display_edit_info_options(object, params = {}, html_options = {})
    content_tag(:div,
      [
        button('back', _('Back'), :back, {:action => 'list'}.merge(params)),
        button('save', _('Save'), :save),
        button('reset', _('Reset'), :reset, {}, {:type => 'reset'} ),
      ].join("\n"),
      html_options
    )
  end

  def display_field_edit(object, field, info = {})
    unless @organization.nil?
      return '' unless @organization.configuration.send("#{object.class.to_s.tableize.singularize}_display_fields").include?(field)
    end

    info[:html_options] ||= Hash.new

    if info[:html_options].blank?
      info[:html_options][:class] = 'info_field'
      info[:html_options][:style] = 'float: left;'
    else
      info[:html_options][:class] = 'info_field ' +  info[:html_options][:class].to_s
      info[:html_options][:style] = 'float: left; ' +  info[:html_options][:style].to_s
    end
   
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
  def display_collection_options(item, params = {})
    content_tag(:div,
      [
        button('view_small', _('Show'), :show, {:action => 'show', :id => item.id}.merge(params)),
        button('edit_small', _('Edit'), :edit, {:action => 'edit', :id => item.id}.merge(params)),
        button('del_small', _('Destroy'), :destroy, {:action => 'destroy', :id => item.id}.merge(params),
               :method => 'post', :confirm => _('Are you sure?'))
      ].join("\n"),
      :class => 'list_item_button'
    )
  end

  #This is very specific we have to study a better way to generate the stock list
  #TODO Attention
  def display_stock_options(item, params ={})
    content_tag(:div,
      [
        button('new_entry', _('New entry'), :new_entry, {:action => 'new', :id => item.id}.merge(params)),
        button('history', _('History'), :history, {:action => 'history', :id => item.id}.merge(params))
      ].join("\n"),
      :class => 'list_item_button'
    )
  end

