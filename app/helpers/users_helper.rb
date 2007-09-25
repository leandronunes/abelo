module UsersHelper

  def display_show_info(object, html_options = {})
    content_tag(:div, display_info(object, html_options)) 
  end

#  def display_info
#  end
end
