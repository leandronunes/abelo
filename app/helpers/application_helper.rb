# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  ACTIONS = %w[
    'new' => _('New')
    'edit' => _('Edit') 
    'remove' => _('Remove') 
  ]

  require 'support/button'

  require 'support/menu'

  require 'support/number_to_currency'

  def show_date(date)
    _('%{year}/%{month}/%{day}') % {:day => '%02d' % date.day, :month => '%02d' % date.month, :year => '%04d' % date.year}
  end  

  def date_select_abelo(object_name, method, options ={})
    date_select(object_name, method, {:include_blank => true, :use_month_numbers => true, :order => [:day, :month, :year]}.merge(options))
  end

  def select_month_abelo(date = Date.today, options ={})
    select_month(date,{:include_blank => true, :use_month_numbers => true}.merge(options))
  end

  def show_image(image, size = "50x50")
    link_to(
      content_tag('span', image_tag(url_for_image_column(image, 'picture', :name => 'thumb'), :size => size)),
      url_for_image_column(image, 'picture', :name => 'medium'),
      { :class => 'product_image', :popup => [ 'abelo_image', 'height=240,width=320' ] }
    )
  end

  def show_image_edit(image, html_options = {})
    content_tag('div',
      [
      show_image(image) +
      button('del_small', _('Destroy'), :destroy, {:action => 'remove_image', :image_id => image.id, :product_id => @product }, { :confirm => _('Are you sure?') })
      ],
      html_options
    )
  end

  def display_list_options(object, method, params = {})
    [
      form_tag({:action => 'list'}.merge(params), :class => 'search_itens'),
        text_field(object, method, :class => 'filter_field'),
        button('search', _('Search'), :search),
        button('add', _("Add New"), :new, {:action => 'new'}.merge(params) ),
        button('reset', _('Reset search'), :list, {:action => 'list'}.merge(params)),
      '</form>',
      display_list_autocomplete_options(object, method, params)
    ].join("\n")
    
  end

  def display_list_autocomplete_options(object, method, params = {})
    [
      content_tag(:div,
        auto_complete_field("#{object}_#{method}", :url => {:action => "autocomplete_#{method}"}.merge(params), :indicator => 'auto_list'),
        :class => 'auto_complete', :id => "#{object}_#{method}_auto_complete"
      ),
      content_tag(:div, '', :id => 'auto_list', :style => 'display: none;' )
    ].join("\n")
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
        javascript_tag( visual_effect( :toggle_slide, 'notice', :duration => 10 ) )
      ],
      :id => 'wrapper_notice'
    )
  end

  def display_navigation_bar
    content_tag(
      'div',
      [
        content_tag(
        'div',
        [
          #alterar para usar as funções do rails
          content_tag('a',[] ,:class => 'hide', :accesskey => 'z',:onclick => "$('warp').style.marginTop='-77px';"),
          content_tag('a',[] ,:class => 'show', :accesskey => 'x',:onClick => "$('warp').style.marginTop='0px';"),
        ],
        :class => 'control_header'),
        link_to(@organization.name, :controller => 'main'),
        if controller.controller_name != 'main'
        "&rarr " + link_to(controller.describe(@item), :controller => params[:controller])
        end
      ],
      :class => 'navigation_bar'
    ) if @organization
  end

  def link_to_organization(org, html_options = {})
    link_to org.name, { :organization_nickname => org.identifier, :controller => 'main', :action => 'index' }, html_options
  end

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
                if selected_options.include?(c === String ? c : c.id)
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

  def rich_text_editor(object, method, options = {})
    fckeditor_textarea(object, method, options.merge({:toolbarSet => 'Simple', :height => '300px'}))
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

  def limit_string(s,tam=50)
    (!s.nil? && !s.empty? && s.size > tam) ? s.first(tam)+"..." : s
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
    content_tag('h2', subtitle)
  end

  def footer
    _("Copyrigth © 2007 %s. This software is under %s") % [link_to(_('Colivre'), 'http://www.colivre.coop.br', :alt => 'Cooperativa de Tecnologias Livres'), link_to(_('GPL'), 'http://www.gnu.org/licenses/licenses.html#GPL')]
  end

  def select_item(object, method, collection=[], text_method=:name, value_method=:id )
    text_method = text_method.to_s
    value_method = value_method.to_s
    select(object, method, collection.map{|c| [c.send(text_method), c.send(value_method)]}, :include_blank => true) 
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

#TODO remove this
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
    configuration_class = eval(object.class.to_s + 'Display')
    content_tag(:div,
      [
       unless configuration_class.describe(display_field.field).empty?
       content_tag(:strong, configuration_class.describe(display_field.field) + ": ")
       end,
       begin
         self.send("display_field_type_#{content.class.to_s.tableize.singularize}", content)
       rescue
         configuration_class.describe(content.name)
       end
      ].join("\n"),
     html_options
    )
  end

  def display_field_type_tag_list(content)
    content_tag(:ul,
      content.names.map do |tag|
        content_tag(:li, tag )
      end
    )
  end

  def display_field_type_false_class(content=nil)
    _('False')
  end

  def display_field_type_true_class(content=nil)
    _('True')
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

  alias :display_new_info_options :display_edit_info_options 

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
  def display_collection_options(item, params = {}, html_options = {})
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

end 
