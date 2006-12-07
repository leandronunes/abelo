# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper


  def button(title, type, url_options = {}, html_options = {})
    local_html_options = html_options.merge({ :class => "button button_#{type}" })
    if [ :save ].include? type 
      submit_tag(title, local_html_options)
    else
      link_to(title, url_options, local_html_options)
    end
  end

end
