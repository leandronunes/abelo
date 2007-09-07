

  def button(button, title, type, url_options = {}, html_options = {})
    html_options[:class] ||= "button button_#{type}"
    if html_options[:addclass] then
      html_options[:class] += " " + html_options[:addclass]
      html_options[:addclass] = nil
    end
    html_options[:title] ||= title
    if [:save, :search, :reset ].include? type
      design_display_button_submit button, ( (html_options[:class]['with_text'])? title : '' ), html_options
    else
      design_display_button(button, title, url_options, html_options)
    end
  end
  
  def button_remote(button, title, type, url_options = {}, html_options = {})
    local_html_options = html_options.merge({ :class => "button button_#{type}" })
    design_display_button(button, title, url_options, local_html_options, true)
  end

