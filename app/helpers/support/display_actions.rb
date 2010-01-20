
  ###############################
  # Display Action Methods 
  ###############################

  FIELD_LOCATION_CLASS = 'class'
  FIELD_LOCATION_OBJECT = 'object'

  def display_list_options(object, method, params = {})
    [
      form_tag({:action => 'list'}.merge(params), :class => 'search_itens'),
        display_autocomplete(object, method, params),
        button('search', t(:search), :search),
        button('add', _("Add New"), :new, {:action => 'new'}.merge(params) ),
        button('reset', t(:reset_search), :list, {:action => 'list'}.merge(params)),
      '</form>'
    ].join("\n")
    
  end

  def display_autocomplete(object, method, params = {})
    [
      text_field(object, method, :class => 'filter_field'),
      content_tag(:div,
        auto_complete_field("#{object}_#{method}", :url => {:action => "autocomplete_#{method}"}.merge(params), :indicator => 'auto_list'),
        :class => 'auto_complete', :id => "#{object}_#{method}_auto_complete"
      ),
      content_tag(:div, '', :id => 'auto_list', :style => 'display: none;' )
    ].join("\n")
  end

  def autocomplete_list(collection, method = 'name' )
    return '' if (collection.blank?)
    content_tag(:ul,
      collection.map do |c|
        content_tag(:li, 
          link_to(c.send(method), :action => 'show', :id => c.id),
          :class => 'autocomplete_item'
        )
      end,
      :class => 'autocomplete_list'
    )
  end


  def display_list_by_class(collection = Array.new, params = {}, html_options = {})
    content = Array.new
    collection.each do |c|
      content.push(
        [
          display_collection_options(c, params),
          display_info_by_class(c, html_options, true )
        ]
      )
    end

    display_list_info(content, html_options)
  end

  def display_list_by_object(collection = Array.new, params = {}, html_options = {})
    content = Array.new
    collection.each do |c|
      content.push(
        [
          display_collection_options(c, params),
          display_info_by_object(c, html_options, true )
        ]
      )
    end

    display_list_info(content, html_options)
  end

  def display_list_info(content, html_options, &block)

    item_class = []
    item_class.push(html_options[:item_class]) unless item_class.include?(html_options[:item_class])
    collection_class = ['info_list']
    collection_class.push(html_options[:collection_class]) unless collection_class.include?(html_options[:collection_class])

    list_content = content_tag(:ul,
      content.map{|c|
        [
          content_tag(:li, c.to_s, :class => item_class.join(' ')),
          tag(:br, :style => 'clear:both;')
        ].join("\n")
      },
      :class => collection_class.join(' ')
    )

    block.nil? ? list_content : concat(list_content, block.binding)
  end


  def display_info_by_class(class_name, html_options = {}, type = false)
    inlist = (type == true) ? 'inlist_' : ''
    fields = "#{class_name}Display".constantize.send(inlist + "available_fields")
    display_info(item, fields, FIELD_LOCATION_CLASS, html_options)
  end

  def display_info_by_object(object, html_options = {}, type = false)
    inlist = (type == true) ? 'inlist_' : ''
    fields = @organization.configuration.send(inlist + "#{object.class.to_s}Display".tableize)
    display_info(item, fields, FIELD_LOCATION_OBJECT, html_options)
  end

  def display_info(item, fields, field_location, html_options = {})
    
    html_options[:class] ||= 'field_item'
    local_html_options = html_options.clone


    if field_location == FIELD_LOCATION_OBJECT
      fields.map do |f|
        break_line = f.break_line?

        local_html_options[:class] = (break_line == true) ?
                html_options[:class] + ' break_line' :
            html_options[:class] + ' item_' + f.field if f.methods.include? 'field'

        content_tag(:div,
          display_field_info_by_object(object, f, {}, !type),
          local_html_options
        )

      end.join("\n")
    else

      fields.map do |f|
        break_line = "#{item}Display".constantize.break_lines.include?(f)
        local_html_options[:class] = (break_line == true) ?
            html_options[:class] + ' break_line' :
            html_options[:class] + ' item_' + f.field if f.methods.include? 'field'

       content_tag(:div,
          display_field_info_by_class(object, f, {}, !type),
          local_html_options
        )

      end.join("\n")
    end
  end

  def display_field_info_by_object(object, field, html_options = {}, type = true)
    content = object.send(field.field) 

    title = ''
    if type == false
      begin 
        type = field.display_title?
      rescue
        type = "#{object.class.to_s}Display".constantize.titles.include?(field)
      end
    end

    if type == true
      title = content_tag(:strong, 
        field.class == String ? 
        "#{object.class.to_s}Display".constantize.describe(field) :
         field.describe_field + ": "
      )
    end

    content_tag(:div,
      [
       title,
       begin
         self.send("display_field_type_#{content.class.to_s.tableize.singularize}", content)
       rescue
         content_tag(:span, content.name)
       end
      ].join("\n"),
     html_options
    )
  end
 
  def display_show_by_class(class_name, html_options = {})
    content_tag(:div, display_info_by_class(class_name, html_options))
  end

  def display_show_by_object(object, html_options = {})
    content_tag(:div, display_info_by_object(object, html_options))
  end

  def display_show_info_options(object, params = {},  html_options = {})
    content_tag(:div,
      [
        button('back', t(:back), :back, {:action => 'list'}.merge(params)),
        button('edit', t(:edit), :edit, {:action => 'edit', :id => object.id}.merge(params))
      ].join("\n"),
      html_options
    )
  end


  #DEPRECATED. Use the method 'display_form_info'
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

  alias :display_form_info :display_edit_info

  def display_edit_info_options(object, params = {}, html_options = {})
    content_tag(:div,
      [
        button('back', t(:back), :back, {:action => 'list'}.merge(params)),
        button('save', t(:save), :save),
        button('reset', t(:reset), :reset, {}, {:type => 'reset'} ),
      ].join("\n"),
      html_options
    )
  end

  alias :display_new_info_options :display_edit_info_options 

  # Deprecated use display_field_form function
  def display_field_edit(object, field, info = {})
    return '' if @organization.nil? and !current_user.administrator?
    return '' if !current_user.administrator? and @organization.send("#{object.class.to_s}Display".tableize).detect{|d| d.field == field}.nil?

    info[:html_options] ||= Hash.new
    info[:html_options][:class] = 'info_field ' + info[:html_options][:class].to_s
   
    content_tag(:div,
      [
       content_tag(:label, info[:title]),
       content_tag(:span, info[:content], {:class => 'field'})
      ].join("\n"),
      info[:html_options]
    )
  end

  alias :display_field_form :display_field_edit
 
  #######################################
  # Display Field Methods
  #######################################
  
  # Display a field of tag list type.
  # EX:
  #   When a tag list +['tag1', 'tag2']+ is passed. It returns
  #   <ul>
  #     <li> 'tag1' </li>
  #     <li> 'tag2' </li>
  #   </ul>
  def display_field_type_tag_list(content)
    content_tag(:ul,
      content.names.map do |tag|
        content_tag(:li, tag )
      end
    )
  end

  # Display a field of false type.
  # EX:
  #
  #   When +false+ is passed. It returns +t(:false)+
  #
  def display_field_type_false_class(content=nil)
    t(:false)
  end

  def display_field_type_true_class(content=nil)
    t(:true)
  end

  def display_field_type_nil_class(content=nil)
    nil
  end

  def display_field_type_image(image) 
    show_image image
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
    @displays = content
    render :partial => 'display_array'
  end

  private 

  #Display a set of options available generally on list methods
  def display_collection_options(item, params = {}, html_options = {})
    content_tag(:div,
      [
        button('view_small', t(:show), :show, {:action => 'show', :id => item.id}.merge(params)),
        button('edit_small', t(:edit), :edit, {:action => 'edit', :id => item.id}.merge(params)),
        button('del_small', t(:destroy), :destroy, {:action => 'destroy', :id => item.id}.merge(params),
               :method => 'post', :confirm => t(:are_you_sure?))
      ].join("\n"),
      :class => 'list_item_button'
    )
  end

  #This is very specific we have to study a better way to generate the stock list
  #TODO Attention
  def display_stock_options(item, params ={})
    content_tag(:div,
      [
        button('new_entry', t(:new_entry), :new_entry, {:action => 'new', :id => item.id}.merge(params)),
        button('history', t(:history), :history, {:action => 'history', :id => item.id}.merge(params))
      ].join("\n"),
      :class => 'list_item_button'
    )
  end

  #Used by select_category to generate the category options to be choosed by user
  def options_for_category(cat, selected_value)
    if cat.leaf?
      content_tag('option', cat.name, "value" => cat.id)
    else
      options = { :label => cat.name, :style => "padding-left: #{cat.level}em;" }
      options.merge!(:selected => 'selected') if (selected_value == cat.id)
      content = cat.children.map { |child| options_for_category(child, selected_value) }.join('')
      content_tag("optgroup", content, options)
    end
  end

