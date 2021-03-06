# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  #TODO Make the test to these helpers. See in noosfero how it's implemented like unitary test
   
  require 'support/button'

  require 'support/menu'

  require 'support/number_to_currency'


  def type_of_ledger(type)
    if type.to_s == 'I'
      Payment.describe('I')
    elsif type.to_s == 'E'
      Payment.describe('E')
    end
  end

  def show_date(date)
    "%s %s %s" % [date.day, date.month, date.year]
#    "%{year}/%{month}/%{day}" % {:day => '%02d' % date.day, :month => '%02d' % date.month, :year => '%04d' % date.year}
  end  

  def date_select_abelo(object_name, method, options ={})
    date_select(object_name, method, {:include_blank => true, :use_month_numbers => true, :order => [:day, :month, :year]}.merge(options))
  end

  def partial_for_class(klass)
    name = klass.name.underscore
    if File.exists?(File.join(RAILS_ROOT, 'app', 'views', params[:controller], "_#{name}.rhtml"))
      name
    else
      partial_for_class(klass.superclass)
    end
  end

  def select_month_abelo(date = Date.today, options ={})
    select_month(date,{:include_blank => true, :use_month_numbers => true}.merge(options))
  end

  def show_image(image, size = "50x50")
    link_to(
      content_tag('span', image_tag(url_for_file_column(image, 'picture', :name => 'thumb'), :size => size)),
      url_for_file_column(image, 'picture', :name => 'medium'),
      { :class => 'product_image', :popup => [ 'abelo_image', 'height=240,width=320' ] }
    )
  end

  def show_image_edit(image, html_options = {})
    content_tag('div',
      [
      show_image(image) +
      button('del_small', t(:destroy), :destroy, {:action => 'remove_image', :image_id => image.id, :product_id => @product }, { :confirm => t(:are_you_sure) })

      ],
      html_options
    )
  end

  def display_list_options(object, method, params = {})
    [
      form_tag({:action => 'list'}.merge(params), :class => 'search_itens'),
        display_autocomplete(object, method, params),
        button('search', t(:search), :search),
        button('add', t(:add_new), :new, params.merge({:action => 'new', :id => nil})),
        button('reset', t(:reset_search), :list, params.merge({:action => 'list'})),
      '</form>'
    ].join("\n")
    
  end

  def display_autocomplete(object, method, params = {})
    [
      text_field(object, method, :class => 'filter_field'),
      content_tag(:div,
        auto_complete_field("#{object}_#{method}", :url => {:action => "autocomplete_#{object}_#{method}"}.merge(params), :indicator => 'auto_list'),
        :class => 'auto_complete', :id => "#{object}_#{method}_auto_complete"
      ),
      content_tag(:div, '', :id => 'auto_list', :style => 'display: none;' )
    ].join("\n")
  end

  #FIXME make this test
  def hide(id)
    "Element.hide(#{id.inspect});"
  end

  #FIXME make this test
  def show(id)
    "Element.show(#{id.inspect});"
  end

  #FIXME make this test
  def toggle_panel(hide_label, show_label, id)
    hide_button_id = id + "-hide"
    show_button_id = id + "-show"

    result = ""
    result << button_to_function('open', show_label, show(id) + show(hide_button_id) + hide(show_button_id), :id => show_button_id, :class => 'show-button with-text', :style => 'display: none;' )

    result < " "
    result << button_to_function('close', hide_label, hide(id) + hide(hide_button_id) + show(show_button_id), :id => hide_button_id, :class => 'hide-button with-text')
    result
  end

  def button_to_function(type, label, js_code, html_options = {})
    html_options[:class] = "" unless html_options[:class]
    html_options[:class] << " button #{type}"
    link_to_function(label, js_code, html_options)
  end

  def notice_box( msg )
    return if msg.nil?
    content_tag(
      :div,
      [
        content_tag(
          :div, 
          content_tag( :div, msg ),
          :id => 'notice'
        ),
        javascript_tag( visual_effect( :toggle_slide, 'notice', :duration => 8 ) )
      ],
      :id => 'wrapper_notice'
    )
  end

  def display_navigation_bar
    return '' if @location.nil?
    content_tag(:div,
      [
        content_tag(:div,
          [
            #alterar para usar as funções do rails
            content_tag('a',[] ,:class => 'hide', :accesskey => 'z',:onclick => "$('warp').style.marginTop='-77px';"),
            content_tag('a',[] ,:class => 'show', :accesskey => 'x',:onClick => "$('warp').style.marginTop='0px';"),
          ],
          :class => 'control_header'
        ),
        (@organization.nil? or current_user.administrator) ? 
              link_to(t(:abelo), :controller => 'organizations') : 
              (can(:controller => 'organization') ? 
                 link_to_organization(@organization) : 
                 link_to(@organization.name, :controller => 'public') 
              ),
        if controller.controller_name != 'organization'
        "&rarr " + link_to(controller.describe(@location), :controller => @location)
        end
      ],
      :class => 'navigation_bar'
    ) 
  end

  def link_to_organization(org, html_options = {})
    location = [
      {:organization_nickname => org.identifier, :controller => 'organization'},
      {:organization_nickname => org.identifier, :controller => 'ledgers'},
      {:organization_nickname => org.identifier, :controller => 'point_of_sale'}
    ]
    link_location = location.detect{|l| can(l)}
    link_to(org.name, link_location,  html_options )
  end

  def select_payments(object, method)
    collection =  Payment::PAYMENT_METHODS.keys
    selected_options = controller.instance_variable_get("@#{object}").send(method)
    content_tag(:ul, 
      [
        collection.map do |c|
          content_tag(:li,
            if !selected_options.nil? and selected_options.include?(c)
              content_tag('input', 
                       Payment.describe_payment(c) , 
                       :name => "#{object}[#{method}][]", 
                       :type => 'checkbox', :value => c, 
                       :checked => 'checked' 
              )
            else
              content_tag('input', 
                       Payment.describe_payment(c) , 
                       :name => "#{object}[#{method}][]", 
                       :type => 'checkbox', :value => c
              )
            end
          )  
        end
      ].join("\n")
    )
  end
  
  def select_payment(object, method)
    collection =  Payment::PAYMENT_METHODS.keys
    select('ledger', 'payment_method',  collection.map{|p|[ Payment.describe_payment(p), p]}, :include_blank => true)
  end
  

  #TODO see if it's usefull
  def multiple_select(object, method, collection=[], title="", text_method=:name, value_method=:id)
    value_method = value_method.to_s
    text_method = text_method.to_s
    selected_options = controller.instance_variable_get("@#{object}").send(method)
    content_tag('p', 
      [
        content_tag('label', title),
        content_tag(:ul, 
          [
            collection.map do |c|
              content_tag(:li,
                if selected_options.include?((c.class == String) ? c : c.id)
                  content_tag('input', 
                           c.send(text_method) , 
                           :name => "#{object}[#{method}][]", 
                           :type => 'checkbox', :value => c.send(value_method) , 
                           :checked => 'checked' 
                  )
                else
                  content_tag('input', 
                           c.send(text_method) , 
                           :name => "#{object}[#{method}][]", 
                           :type => 'checkbox', :value => c.send(value_method)
                  )
                end
              )  
            end
          ].join("\n")
        )
      ].join("\n")
    )
  end
  
  # Display a set of display configurations to be choosed by user
  def select_display_configuration(object, display_class, collection=[])
    chars = ('a'..'z').to_a
    rand_id = Array.new(10, '').collect{chars[rand(chars.size)]}.join
    selected_options = controller.instance_variable_get("@#{object}").send(display_class.tableize)
    content_tag('div', 
      content_tag(:ul, 
        [
          collection.map do |c|
            selected_display_obj = selected_options.detect{|d| d.field == c}
            content_tag(:li,
              set_of_display_configuration(object, display_class, c,selected_display_obj)
            )  
          end
        ].join("\n"),
      :id => rand_id) + toggle_checkboxes(rand_id)
    )
  end


  # Used by select_display_configuration to generate the checkbox options
  # to be choosed by user.
  # 
  def set_of_display_configuration(object, display_class, item, display_obj)
      checkbox_fields = []
      value = display_obj.nil? ? {} : {:checked => 'checked'}

      checkbox_fields << hidden_field_tag("#{object}[#{"Set#{display_class}".tableize}][#{item}][none]")

      checkbox_fields << content_tag('input', 
        display_class.constantize.describe(item), 
        {
          :name => "#{object}[#{"Set#{display_class}".tableize}][#{item}][field]", 
          :type => 'checkbox', :value => item
        }.merge(value)
      )

      value = (!display_obj.nil? and display_obj.break_line?) ? {:checked => 'checked'} : {}
      checkbox_fields << content_tag('input', 
        t(:break_line), 
        {
          :name => "#{object}[#{"Set#{display_class}".tableize}][#{item}][break_line]", 
          :type => 'checkbox', :value => true
        }.merge(value)
       )

      value = (!display_obj.nil?  and display_obj.display_in_list?) ? {:checked => 'checked'} : {}
      checkbox_fields << content_tag('input', 
        t(:display_in_list?), 
        {
          :name => "#{object}[#{"Set#{display_class}".tableize}][#{item}][display_in_list]", 
          :type => 'checkbox', :value => true
        }.merge(value)
       )


      value = (!display_obj.nil?  and display_obj.display_title?) ? {:checked => 'checked'} : {}
      checkbox_fields << content_tag('input', 
        t(:display_title?), 
        {
          :name => "#{object}[#{"Set#{display_class}".tableize}][#{item}][display_title]", 
          :type => 'checkbox', :value => true
        }.merge(value)
       )


      checkbox_fields
  end


  def select_organization_display_configuration(object, display_class, collection=[])
    instance_object = controller.instance_variable_get("@#{object}")
    block_id = "#{display_class}_" + "#{instance_object.id}"
    content_tag('div', 
      [
      content_tag(:ul, 
        [
          collection.map do |c|
            content_tag(:li, 
              c.class.describe(c.field) +
              set_of_organization_display_configuration(object, display_class, c).join("\n"),
              :id => "item_#{c.id}"
            )  
          end
        ].join("\n"),
        :id => block_id
      ),
      sortable_element(block_id,
              :url => {:action => 'set_fields_order', :configuration_id => instance_object.id, :display_class => display_class },
              :complete => visual_effect(:highlight, block_id),
              :failure => "$('#{block_id}').innerHTML= request.responseText"
            )

      ].join("\n")
    )
  end

  # Used by select_display_configuration to generate the checkbox options
  # to be choosed by user.
  # 
  def set_of_organization_display_configuration(object, display_class, display_obj)
      checkbox_fields = []

      checkbox_fields << hidden_field_tag("#{object}[#{"SetLite#{display_class}".tableize}][#{display_obj.field}][none]")

      value = (!display_obj.nil? and display_obj.break_line?) ? {:checked => 'checked'} : {}
      checkbox_fields << content_tag('input', 
        t(:break_line), 
        {
          :name => "#{object}[#{"Set#{display_class}".tableize}][#{display_obj.field}][break_line]", 
          :type => 'checkbox', :value => true
        }.merge(value)
       )

      value = (!display_obj.nil?  and display_obj.display_in_list?) ? {:checked => 'checked'} : {}
      checkbox_fields << content_tag('input', 
        t(:display_in_list?), 
        {
          :name => "#{object}[#{"Set#{display_class}".tableize}][#{display_obj.field}][display_in_list]", 
          :type => 'checkbox', :value => true
        }.merge(value)
       )


      value = (!display_obj.nil?  and display_obj.display_title?) ? {:checked => 'checked'} : {}
      checkbox_fields << content_tag('input', 
        t(:display_title?), 
        {
          :name => "#{object}[#{"Set#{display_class}".tableize}][#{display_obj.field}][display_title]", 
          :type => 'checkbox', :value => true
        }.merge(value)
       )

      checkbox_fields
  end


  def rich_text_editor(object, method, options = {})
    fckeditor_textarea(object, method, options.merge({:toolbarSet => 'Simple', :height => '250px', :width => '550px' }))
  end

  def rich_text_editor_default(object, method, options = {})
    fckeditor_textarea(object, method, options.merge({:toolbarSet => 'Default', :height => '550px', :width => '700px' }))
  end

  def select_categories(object, category_type)
    @organization.send("#{category_type}_categories").map { |c|
      content_tag('div',
        check_box_tag("categories[#{c.id}]", 1, object.send("#{category_type}_categories").include?(c)) + c.name
      )
    }.join('')
  end

  def select_category(object, category_type)
    instance_object = self.instance_variable_get("@#{object}")
    categories = instance_object.organization.send("top_level_#{category_type}_categories")
    select_tag("#{object}[category_id]", categories.map { |c| options_for_category(c,instance_object.send('category_id')) }.join(' ') )
  end

  def select_parent_category(object, category_type)
    instance_object = self.instance_variable_get("@#{object}")
    categories = instance_object.organization.send("top_level_#{category_type}_categories")
    select_tag("#{object}[parent_id]", "<option value=""></option>" + categories.map { |c| options_for_category(c,c.id) }.join(' '), { :include_blank => true }) 
  end

#  <p><input type="radio" id="mass_mail_dest_1" name="mass_mail[dest]" value="all_customers" />
#  <label for='mass_mail_dest_1'><%= t(:all_customers) %></label></p>
#select_recipients('mass_mail', 'recipients', 'customers', @options_for_recipients),

  def select_recipients(object, method, collection=[], title="", text_method=:name, value_method=:id )
    value_method = value_method.to_s
    text_method = text_method.to_s
    content_tag('p', 
      [
            collection.map do |c|
              content_tag('p',
              [
                  content_tag('input', 
                           c, 
                           :name => "#{object}[#{method}]", 
                           :type => 'radio', :value => c , 
                           :checked => 'checked' 
                 ) 
              ].join("\n")
            )
            end
      ].join("\n")
    )
  end

  def limit_string(s,tam=50)
    (!s.blank? && s.size > tam) ? s.first(tam)+"..." : s
  end

  def show_item_bar(element_id,title)
    content_tag(
      'div',
      link_to_remote(title, {}, :class => "show_itembar", :style => "border-botttom: none;", :onclick => visual_effect(:toggle_slide, element_id) )
     )      
  end

  def hide_item_bar(element_id)
    content_tag(
      'p',
      link_to_remote(content_tag('span', 'Hide'), {},:class => 'hide_itembar',:onclick => visual_effect(:toggle_slide, element_id))
    )
  end

  def title(title)
    content_tag('h1', title, :class => 'main_title')
  end

  def subtitle(subtitle)
    content_tag('h2', content_tag(:p, subtitle), :class => 'subtitle')
  end

  def footer
    t("abelo_footer", :version => Abelo::VERSION, :link_to_colivre => link_to('Colivre', 'http://www.colivre.coop.br', :alt => 'Cooperativa de Tecnologias Livres'), :link_to_gnu =>link_to('GPLv3', 'http://www.gnu.org/licenses/gpl-3.0.html'))
  end

  def select_item(object, method, collection=[], text_method=:name, value_method=:id )
    collection ||= []
    text_method = text_method.to_s
    value_method = value_method.to_s
    select(object, method, collection.map{|c| [c.send(text_method), c.send(value_method)]}, :include_blank => true) 
  end

  def select_status(object, method, options = {}, html_options = {})
    collection = [
      [t(:pending), Status::STATUS_PENDING],
      [t(:cancelled), Status::STATUS_CANCELLED],
      [t(:done), Status::STATUS_DONE],
    ]
    select(object, method,collection, options, html_options)   
  end

  def select_color(object, method, collection=[], text_method=:name, value_method=:id)
    text_method = text_method.to_s
    value_method = value_method.to_s
    select_tag("#{object}[#{method}]", 
      options_for_select_color( collection.map{|c| [c.send(text_method), c.send(value_method), "style='background-color: #{c.send(value_method)};'"]}, 
        instance_variable_get("@#{object}").send(method)
       ), 
       :id => "#{object}_#{method}", 
       :style => "background-color: #{instance_variable_get('@'+object).send(method)};"
     )
  end


  def options_for_select_color(container, selected = nil)
    container = container.to_a if Hash === container

    options_for_select_color = container.inject([]) do |options, element|
      if !element.is_a?(String) and element.respond_to?(:first) and element.respond_to?(:last)
        is_selected = ( (selected.respond_to?(:include?) && !selected.is_a?(String) ? selected.include?(element[1]) : element[1] == selected) )
        if is_selected
          options << "<option value=\"#{html_escape(element[1].to_s)}\" selected=\"selected\" #{element[2].to_s} >#{html_escape(element[0].to_s)}</option>"
        else
          options << "<option value=\"#{html_escape(element[1].to_s)}\" #{element[2].to_s} >#{html_escape(element[0].to_s)}</option>"
        end
      else
        is_selected = ( (selected.respond_to?(:include?) && !selected.is_a?(String) ? selected.include?(element) : element == selected) )
        options << ((is_selected) ? "<option value=\"#{html_escape(element.to_s)}\" selected=\"selected\">#{html_escape(element.to_s)}</option>" : "<option value=\"#{html_escape(element.to_s)}\">#{html_escape(element.to_s)}</option>")
      end
    end

    options_for_select_color.join("\n")
  end


  def autocomplete_list(collection, method = 'name' )
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

  ###############################
  # Display Methods 
  ###############################

  def display_collection(collection = Array.new, params = {}, html_options = {})
    content = Array.new
    collection.each do |c|
      content.push(
        [
          display_collection_options(c, params),
          display_info(c, html_options, true )
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

  def display_info(object, html_options = {}, type = false)
    inlist = (type == true) ? 'inlist_' : ''
    fields = object.display_class.send(inlist + "available_fields") if object.display_class.all_available?
    fields ||= @organization.configuration.send(inlist + "#{object.display_class}".tableize) unless object.nil?
    fields ||= []

    html_options[:class] ||= 'field_item'
    local_html_options = html_options.clone

    fields.map do |f|
      break_line = false
      begin
        break_line = true if f.break_line?
      rescue
        break_line = true if object.display_class.break_lines.include?(f)
      end

      local_html_options[:class] = (break_line == true) ?
            html_options[:class] + ' break_line' :
            html_options[:class] + ' item_' + f.field if f.methods.include? 'field'

      content_tag(:div,
        display_field_info(object, f, {}, !type),
        local_html_options
      )

    end.join("\n")
  end

  def display_field_info(object, field, html_options = {}, type = true)
    content = field.class == String ? object.send(field) : object.send(field.field) 

    title = ''
    if type == false
      begin 
        type = field.display_title?
      rescue
        type = object.display_class.titles.include?(field)
      end
    end

    if type == true
      title = content_tag(:strong, 
        field.class == String ? 
        object.display_class.describe(field) :
         field.describe_field + ": "
      )
    end

    content_tag(:div,
      [
       title,
       begin
         display_content = object.describe_field(field, content) if object.respond_to?(:describe_field)
         display_content ||= self.send("display_field_type_#{content.class.to_s.tableize.singularize}", content)
       rescue
         content_tag(:span, content.name)
       end
      ].join("\n"),
     html_options
    )
  end
 
  def display_show_info(object, html_options = {})
    content_tag(:div, display_info(object, html_options))
  end

  def display_show_info_options(object, params = {},  html_options = {})
    return '' if object.nil?

    content_tag(:div,
      [
        display_back_button({:action => 'list'}.merge(params)),
        display_edit_button({:action => 'edit', :id => object.id}.merge(params))
      ].join("\n"),
      display_html_options(html_options)
    )
  end

  def display_html_options(html_options = {})
    html_options[:class] = html_options[:class].nil? ? 'display_info_options' : 'display_info_options ' + html_options[:class]
    html_options 
  end

  def display_edit_button(location)
    button('edit', t(:edit), :edit, location)
  end

  def display_back_button(location)
    button('back', t(:back), :back, location)
  end

  def display_image_button(location)
    button('image', t(:save), :image, location)
  end

  def display_save_button
    button('save', t(:save), :save)
  end

  def display_reset_button
    button('reset', t(:reset), :reset, {}, {:type => 'reset'} )
  end

  def display_form_info(object, html_options = {}, &block)
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

  #DEPRECATED. Use the method 'display_form_info'
  alias :display_edit_info :display_form_info

  def display_edit_info_options(object, params = {}, html_options = {})
    content_tag(:div,
      [
        display_back_button({:action => 'list'}.merge(params)),
        display_save_button,
        display_reset_button,
      ].join("\n"),
      display_html_options(html_options)
    )
  end

  alias :display_new_info_options :display_edit_info_options 

  def display_field_form(object, field, info = {})
    return '' if @organization.nil? and !object.display_class.all_available?
    return '' if !object.display_class.all_available? and @organization.send("#{object.display_class}".tableize).detect{|d| d.field == field}.nil?

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

  # Deprecated use display_field_form function
  alias :display_field_edit :display_field_form
 
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

  def display_field_type_time(content=nil)
    show_date(content)
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

  def display_field_type_hash(content)
    @displays = content
    render :partial => 'display_hash'
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

#Display link of tags in list getting tag_list like argument
  def display_tag_list(collection)

    #Create a list of tags without duplicates
    tags = Array.new 
    collection.map do |item|
      content = item.tag_list
      content.names.map do |t|
        tags.push(t) unless tags.include?(t)
      end
    end
  
    content_tag(:div,
    [
      content_tag(:ul,
        [
        content_tag(:label, t(:tags)),
        tags.map do |t|
            content_tag(:li, link_to_remote(t, :url => {:action => 'find_by_tag', :tag => t, :collection => collection.collect {|item| item.id }.join(',')}, :update => 'content_list') )
        end
        ].join("\n"),
        :class => 'tag_list'
      )
    ].join("\n")
    )
  end

  def beta_info
    '<div id="beta_info" title="BETA">' +
    '<span>BETA</span>' +
    '</div>'
  end

  def parse_date(date, show_time = true)
    "%s %s %s" % [date.day, date.month, date.year]
#    show_time == true ? date.strftime(t(:%d/%m/%y:_%t'))_:_date.strftime(_('%d/%m/%y))
  end

  #########################################
  # Helpers for cms
  #########################################
 
  include LightboxHelper
  
  # returns the current environment beign viewed.
  #
  # Make sure that you use this helper method only in contexts where there
  # should be a current environment (i.e. while viewing some environment's pages, or the
  # environment info, etc), because if there is no profile an exception is thrown.
  # FIXME See if it's usefull and make this test
  def environment
    @controller.send(:environment) || raise("There is no current environment")
  end

  #FIXME make this test
  def button_bar(options = {}, &block)
    concat(content_tag('div', capture(&block) + tag('br', :style => 'clear: left;'), { :class => 'button-bar' }.merge(options)), block.binding)
  end

  #FIXME make this test    
  def file_manager_button(title, icon, url)
    content_tag('div', link_to(image_tag(icon, :alt => title, :title => title) + content_tag('div', title), url), :class => 'file-manager-button')
  end 

  # Toggle all checkboxes inside element#element_id
  def toggle_checkboxes(element_id)
    js_stuff = "<script type=\"text/javascript\">
      function toggleCheckboxes(container) {
        if ($(container).hasClassName('checkboxes-checked')) {
          $(container).addClassName('checkboxes-unchecked');
          $(container).removeClassName('checkboxes-checked');
          $$('#' + container + ' input[type=checkbox]').each( function(c) { c.checked = false; } );
        } else {
          $(container).addClassName('checkboxes-checked');
          $(container).removeClassName('checkboxes-unchecked');
          $$('#' + container + ' input[type=checkbox]').each( function(c) { c.checked = true; } );
        }
      }
    </script>"
    content_tag(:script, js_stuff, :type => 'text/javascript') +
    content_tag(:a, t(:label_toggle_checkboxes), :href => "#", :onclick => "toggleCheckboxes('#{element_id}'); return false")
  end

end
