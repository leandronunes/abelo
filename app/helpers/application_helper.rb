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

  # Creates a color picker field.
  #
  # Slightly based on http://www.bigbold.com/snippets/posts/show/2084
  def color_select(object, method)
    colors = []
    (0..15).step(3) do |r|
      (0..15).step(3) do |g|
        (0..15).step(3) do |b|
          colors << '#' + r.to_s(16) + g.to_s(16) + b.to_s(16)
        end
      end
    end
    value = self.instance_variable_get("@#{object}").send(method)
    select_tag(
      "#{object}[#{method}]",
      colors.map { |c|
        selected = (c==value) ? 'selected' : ''
        "<option value=\"#{c}\" style=\"background: #{c}\" #{selected}>#{c}</option>" 
      }.join("\n"),
      :style => "background: #{value}", :id => "#{object}_#{method}"
    ) + observe_field("#{object}_#{method}", :function => "element.style.background = value" )
  end

end
