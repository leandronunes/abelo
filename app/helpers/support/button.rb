

  def button(button, title, type, url_options = {}, html_options = {})
    html_options[:class] ||= "button button_#{type}"
    html_options[:title] ||= title
    if [:save, :search ].include? type
      design_display_icon_submit button, '', html_options
    else
      design_display_icon(button, title, url_options, html_options)
    end
  end
  
  def button_remote(button, title, type, url_options = {}, html_options = {})
    local_html_options = html_options.merge({ :class => "button button_#{type}" })
    design_display_icon(button, title, url_options, local_html_options, true)
  end

