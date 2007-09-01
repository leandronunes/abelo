# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  ACTIONS = %w[
    'new' => _('New')
    'edit' => _('Edit') 
    'remove' => _('Remove') 
  ]

  require 'support/button'

  require 'support/menu'

  require 'support/actions'

  def show_date(date)
    _('%{year}/%{month}/%{day}') % {:day => '%02d' % date.day, :month => '%02d' % date.month, :year => '%04d' % date.year}
  end

  def show_image(image, size = "50x50")
    link_to(
      content_tag('span', image_tag(url_for_image_column(image, 'picture', :name => 'thumb'), :size => size)) +
      content_tag('span', image.description),
      url_for_image_column(image, 'picture', :name => 'medium'),
      { :class => 'product_image', :popup => [ 'abelo_image', 'height=240,width=320' ] }
    )
  end

  def notice_box(msg)
    return if msg.nil?
    content_tag(
      'div',
       [
         content_tag(
           :div, 
           msg + javascript_tag(visual_effect(:toggle_slide, 'notice', :duration => 3)),
             :id => 'notice' 
         )
      ].join("\n")
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
    link_to org.name, { :organization_nickname => org.nickname, :controller => 'main', :action => 'index' }, html_options
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
                if selected_options.include? c
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
    content_tag('h1', title)
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

  private

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
