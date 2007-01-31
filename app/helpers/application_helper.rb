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
  # Color HEX/names from http://www.w3schools.com/html/html_colornames.asp
  #
  # TODO: chose a smaller ser of colors
  def color_select(object, method)
    colors = [
      [ nil,  _('N/A') ],
      [ '#F0F8FF',  _('Alice Blue') ],
      [ '#FAEBD7',  _('Antique White') ],
      [ '#00FFFF',  _('Aqua') ],
      [ '#7FFFD4',  _('Aquamarine') ],
      [ '#F0FFFF',  _('Azure') ],
      [ '#F5F5DC',  _('Beige') ],
      [ '#FFE4C4',  _('Bisque') ],
      [ '#000000',  _('Black') ],
      [ '#FFEBCD',  _('Blanched Almond') ],
      [ '#0000FF',  _('Blue') ],
      [ '#8A2BE2',  _('Blue Violet') ],
      [ '#A52A2A',  _('Brown') ],
      [ '#DEB887',  _('Burly Wood') ],
      [ '#5F9EA0',  _('Cadet Blue') ],
      [ '#7FFF00',  _('Chartreuse') ],
      [ '#D2691E',  _('Chocolate') ],
      [ '#FF7F50',  _('Coral') ],
      [ '#6495ED',  _('Cornflower Blue') ],
      [ '#FFF8DC',  _('Cornsilk') ],
      [ '#DC143C',  _('Crimson') ],
      [ '#00FFFF',  _('Cyan') ],
      [ '#00008B',  _('Dark Blue') ],
      [ '#008B8B',  _('Dark Cyan') ],
      [ '#B8860B',  _('Dark Golden Rod') ],
      [ '#A9A9A9',  _('Dark Gray') ],
      [ '#A9A9A9',  _('Dark Grey') ],
      [ '#006400',  _('Dark Green') ],
      [ '#BDB76B',  _('Dark Khaki') ],
      [ '#8B008B',  _('Dark Magenta') ],
      [ '#556B2F',  _('Dark Olive Green') ],
      [ '#FF8C00',  _('Darkorange') ],
      [ '#9932CC',  _('Dark Orchid') ],
      [ '#8B0000',  _('Dark Red') ],
      [ '#E9967A',  _('Dark Salmon') ],
      [ '#8FBC8F',  _('Dark Sea Green') ],
      [ '#483D8B',  _('Dark Slate Blue') ],
      [ '#2F4F4F',  _('Dark Slate Gray') ],
      [ '#2F4F4F',  _('Dark Slate Grey') ],
      [ '#00CED1',  _('Dark Turquoise') ],
      [ '#9400D3',  _('Dark Violet') ],
      [ '#FF1493',  _('Deep Pink') ],
      [ '#00BFFF',  _('Deep Sky Blue') ],
      [ '#696969',  _('Dim Gray') ],
      [ '#696969',  _('Dim Grey') ],
      [ '#1E90FF',  _('Dodger Blue') ],
      [ '#B22222',  _('Fire Brick') ],
      [ '#FFFAF0',  _('Floral White') ],
      [ '#228B22',  _('Forest Green') ],
      [ '#FF00FF',  _('Fuchsia') ],
      [ '#DCDCDC',  _('Gainsboro') ],
      [ '#F8F8FF',  _('Ghost White') ],
      [ '#FFD700',  _('Gold') ],
      [ '#DAA520',  _('Golden Rod') ],
      [ '#808080',  _('Gray') ],
      [ '#808080',  _('Grey') ],
      [ '#008000',  _('Green') ],
      [ '#ADFF2F',  _('Green Yellow') ],
      [ '#F0FFF0',  _('Honey Dew') ],
      [ '#FF69B4',  _('Hot Pink') ],
      [ '#CD5C5C',  _('Indian Red') ],
      [ '#4B0082',  _('Indigo') ],
      [ '#FFFFF0',  _('Ivory') ],
      [ '#F0E68C',  _('Khaki') ],
      [ '#E6E6FA',  _('Lavender') ],
      [ '#FFF0F5',  _('Lavender Blush') ],
      [ '#7CFC00',  _('Lawn Green') ],
      [ '#FFFACD',  _('Lemon Chiffon') ],
      [ '#ADD8E6',  _('Light Blue') ],
      [ '#F08080',  _('Light Coral') ],
      [ '#E0FFFF',  _('Light Cyan') ],
      [ '#FAFAD2',  _('Light Golden Rod Yellow') ],
      [ '#D3D3D3',  _('Light Gray') ],
      [ '#D3D3D3',  _('Light Grey') ],
      [ '#90EE90',  _('Light Green') ],
      [ '#FFB6C1',  _('Light Pink') ],
      [ '#FFA07A',  _('Light Salmon') ],
      [ '#20B2AA',  _('Light Sea Green') ],
      [ '#87CEFA',  _('Light Sky Blue') ],
      [ '#778899',  _('Light Slate Gray') ],
      [ '#778899',  _('Light Slate Grey') ],
      [ '#B0C4DE',  _('Light Steel Blue') ],
      [ '#FFFFE0',  _('Light Yellow') ],
      [ '#00FF00',  _('Lime') ],
      [ '#32CD32',  _('Lime Green') ],
      [ '#FAF0E6',  _('Linen') ],
      [ '#FF00FF',  _('Magenta') ],
      [ '#800000',  _('Maroon') ],
      [ '#66CDAA',  _('Medium Aqua Marine') ],
      [ '#0000CD',  _('Medium Blue') ],
      [ '#BA55D3',  _('Medium Orchid') ],
      [ '#9370D8',  _('Medium Purple') ],
      [ '#3CB371',  _('Medium Sea Green') ],
      [ '#7B68EE',  _('Medium Slate Blue') ],
      [ '#00FA9A',  _('Medium Spring Green') ],
      [ '#48D1CC',  _('Medium Turquoise') ],
      [ '#C71585',  _('Medium Violet Red') ],
      [ '#191970',  _('Midnight Blue') ],
      [ '#F5FFFA',  _('Mint Cream') ],
      [ '#FFE4E1',  _('Misty Rose') ],
      [ '#FFE4B5',  _('Moccasin') ],
      [ '#FFDEAD',  _('Navajo White') ],
      [ '#000080',  _('Navy') ],
      [ '#FDF5E6',  _('Old Lace') ],
      [ '#808000',  _('Olive') ],
      [ '#6B8E23',  _('Olive Drab') ],
      [ '#FFA500',  _('Orange') ],
      [ '#FF4500',  _('Orange Red') ],
      [ '#DA70D6',  _('Orchid') ],
      [ '#EEE8AA',  _('Pale Golden Rod') ],
      [ '#98FB98',  _('Pale Green') ],
      [ '#AFEEEE',  _('Pale Turquoise') ],
      [ '#D87093',  _('Pale Violet Red') ],
      [ '#FFEFD5',  _('Papaya Whip') ],
      [ '#FFDAB9',  _('Peach Puff') ],
      [ '#CD853F',  _('Peru') ],
      [ '#FFC0CB',  _('Pink') ],
      [ '#DDA0DD',  _('Plum') ],
      [ '#B0E0E6',  _('Powder Blue') ],
      [ '#800080',  _('Purple') ],
      [ '#FF0000',  _('Red') ],
      [ '#BC8F8F',  _('Rosy Brown') ],
      [ '#4169E1',  _('Royal Blue') ],
      [ '#8B4513',  _('Saddle Brown') ],
      [ '#FA8072',  _('Salmon') ],
      [ '#F4A460',  _('Sandy Brown') ],
      [ '#2E8B57',  _('Sea Green') ],
      [ '#FFF5EE',  _('Sea Shell') ],
      [ '#A0522D',  _('Sienna') ],
      [ '#C0C0C0',  _('Silver') ],
      [ '#87CEEB',  _('Sky Blue') ],
      [ '#6A5ACD',  _('Slate Blue') ],
      [ '#708090',  _('Slate Gray') ],
      [ '#708090',  _('Slate Grey') ],
      [ '#FFFAFA',  _('Snow') ],
      [ '#00FF7F',  _('Spring Green') ],
      [ '#4682B4',  _('Steel Blue') ],
      [ '#D2B48C',  _('Tan') ],
      [ '#008080',  _('Teal') ],
      [ '#D8BFD8',  _('Thistle') ],
      [ '#FF6347',  _('Tomato') ],
      [ '#40E0D0',  _('Turquoise') ],
      [ '#EE82EE',  _('Violet') ],
      [ '#F5DEB3',  _('Wheat') ],
      [ '#FFFFFF',  _('White') ],
      [ '#F5F5F5',  _('White Smoke') ],
      [ '#FFFF00',  _('Yellow') ],
      [ '#9ACD32',  _('Yellow Green') ],
    ]

    value = self.instance_variable_get("@#{object}").send(method)
    select_tag(
      "#{object}[#{method}]",
      colors.map { |c|
        code, name = c
        selected = (code==value) ? 'selected' : ''
        "<option value=\"#{code}\" style=\"background: #{code}\" #{selected}>#{name}</option>" 
      }.join("\n"),
      :style => "background: #{value}", :id => "#{object}_#{method}"
    ) + observe_field("#{object}_#{method}", :function => "element.style.background = value" )
  end

  def show_date(date)
    _('%{year}/%{month}/%{day}') % {:day => '%02d' % date.day, :month => '%02d' % date.month, :year => '%04d' % date.year}
  end

  def show_image(image)
    link_to(
      content_tag('span', image_tag(url_for_image_column(image, 'picture', :name => 'thumb'))) +
      content_tag('span', image.description),
      url_for_image_column(image, 'picture', :name => 'medium'),
      { :class => 'product_image', :popup => [ 'abelo_image', 'height=240,width=320' ] }
    )
  end

  def user_bar
    if self.current_user
      content_tag(
        'div',
        link_to(_('Logout'), :controller => 'users', :action => 'logout') +
        '&nbsp;' +
        link_to(_('Start'), :controller => 'users', :action => 'index'),
        :class => 'user_bar') if self.current_user
    else
      ''
    end
  end

  def link_to_organization(org, html_options = {})
    link_to org.name, { :organization_nickname => org.nickname, :controller => 'main', :action => 'index' }, html_options
  end

end
