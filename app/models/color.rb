class Color < ActiveRecord::Base

  COLOR = {
#     nil =>  I18n.t(:n/a),
#    '#F0F8FF' =>  I18n.t(:alice_blue),
#    '#FAEBD7' =>  I18n.t(:antique_white),
#    '#00FFFF' =>  I18n.t(:aqua),
#    '#7FFFD4' =>  I18n.t(:aquamarine),
#    '#F0FFFF' =>  I18n.t(:azure),
#    '#F5F5DC' =>  I18n.t(:beige),
#    '#FFE4C4' =>  I18n.t(:bisque),
#    '#000000' =>  I18n.t(:black),
#    '#FFEBCD' =>  I18n.t(:blanched_almond),
#    '#0000FF' =>  I18n.t(:blue),
#    '#8A2BE2' =>  I18n.t(:blue_violet),
#    '#A52A2A' =>  I18n.t(:brown),
#    '#DEB887' =>  I18n.t(:burly_wood),
#    '#5F9EA0' =>  I18n.t(:cadet_blue),
#    '#7FFF00' =>  I18n.t(:chartreuse),
#    '#D2691E' =>  I18n.t(:chocolate),
#    '#FF7F50' =>  I18n.t(:coral),
#    '#6495ED' =>  I18n.t(:cornflower_blue),
#    '#FFF8DC' =>  I18n.t(:cornsilk),
#    '#DC143C' =>  I18n.t(:crimson),
#    '#00FFFF' =>  I18n.t(:cyan),
#    '#00008B' =>  I18n.t(:dark_blue),
#    '#008B8B' =>  I18n.t(:dark_cyan),
#    '#B8860B' =>  I18n.t(:dark_golden_rod),
#    '#A9A9A9' =>  I18n.t(:dark_gray),
#    '#A9A9A9' =>  I18n.t(:dark_grey),
#    '#006400' =>  I18n.t(:dark_green),
#    '#BDB76B' =>  I18n.t(:dark_khaki),
#    '#8B008B' =>  I18n.t(:dark_magenta),
#    '#556B2F' =>  I18n.t(:dark_olive_green),
#    '#FF8C00' =>  I18n.t(:darkorange),
#    '#9932CC' =>  I18n.t(:dark_orchid),
#    '#8B0000' =>  I18n.t(:dark_red),
#    '#E9967A' =>  I18n.t(:dark_salmon),
#    '#8FBC8F' =>  I18n.t(:dark_sea_green),
#    '#483D8B' =>  I18n.t(:dark_slate_blue),
#    '#2F4F4F' =>  I18n.t(:dark_slate_gray),
#    '#2F4F4F' =>  I18n.t(:dark_slate_grey),
#    '#00CED1' =>  I18n.t(:dark_turquoise),
#    '#9400D3' =>  I18n.t(:dark_violet),
#    '#FF1493' =>  I18n.t(:deep_pink),
#    '#00BFFF' =>  I18n.t(:deep_sky_blue),
#    '#696969' =>  I18n.t(:dim_gray),
#    '#696969' =>  I18n.t(:dim_grey),
#    '#1E90FF' =>  I18n.t(:dodger_blue),
#    '#B22222' =>  I18n.t(:fire_brick),
#    '#FFFAF0' =>  I18n.t(:floral_white),
#    '#228B22' =>  I18n.t(:forest_green),
#    '#FF00FF' =>  I18n.t(:fuchsia),
#    '#DCDCDC' =>  I18n.t(:gainsboro),
#    '#F8F8FF' =>  I18n.t(:ghost_white),
#    '#FFD700' =>  I18n.t(:gold),
#    '#DAA520' =>  I18n.t(:golden_rod),
#    '#808080' =>  I18n.t(:gray),
#    '#808080' =>  I18n.t(:grey),
#    '#008000' =>  I18n.t(:green),
#    '#ADFF2F' =>  I18n.t(:green_yellow),
#    '#F0FFF0' =>  I18n.t(:honey_dew),
#    '#FF69B4' =>  I18n.t(:hot_pink),
#    '#CD5C5C' =>  I18n.t(:indian_red),
#    '#4B0082' =>  I18n.t(:indigo),
#    '#FFFFF0' =>  I18n.t(:ivory),
#    '#F0E68C' =>  I18n.t(:khaki),
#    '#E6E6FA' =>  I18n.t(:lavender),
#    '#FFF0F5' =>  I18n.t(:lavender_blush),
#    '#7CFC00' =>  I18n.t(:lawn_green),
#    '#FFFACD' =>  I18n.t(:lemon_chiffon),
#    '#ADD8E6' =>  I18n.t(:light_blue),
#    '#F08080' =>  I18n.t(:light_coral),
#    '#E0FFFF' =>  I18n.t(:light_cyan),
#    '#FAFAD2' =>  I18n.t(:light_golden_rod_yellow),
#    '#D3D3D3' =>  I18n.t(:light_gray),
#    '#D3D3D3' =>  I18n.t(:light_grey),
#    '#90EE90' =>  I18n.t(:light_green),
#    '#FFB6C1' =>  I18n.t(:light_pink),
#    '#FFA07A' =>  I18n.t(:light_salmon),
#    '#20B2AA' =>  I18n.t(:light_sea_green),
#    '#87CEFA' =>  I18n.t(:light_sky_blue),
#    '#778899' =>  I18n.t(:light_slate_gray),
#    '#778899' =>  I18n.t(:light_slate_grey),
#    '#B0C4DE' =>  I18n.t(:light_steel_blue),
#    '#FFFFE0' =>  I18n.t(:light_yellow),
#    '#00FF00' =>  I18n.t(:lime),
#    '#32CD32' =>  I18n.t(:lime_green),
#    '#FAF0E6' =>  I18n.t(:linen),
#    '#FF00FF' =>  I18n.t(:magenta),
#    '#800000' =>  I18n.t(:maroon),
#    '#66CDAA' =>  I18n.t(:medium_aqua_marine),
#    '#0000CD' =>  I18n.t(:medium_blue),
#    '#BA55D3' =>  I18n.t(:medium_orchid),
#    '#9370D8' =>  I18n.t(:medium_purple),
#    '#3CB371' =>  I18n.t(:medium_sea_green),
#    '#7B68EE' =>  I18n.t(:medium_slate_blue),
#    '#00FA9A' =>  I18n.t(:medium_spring_green),
#    '#48D1CC' =>  I18n.t(:medium_turquoise),
#    '#C71585' =>  I18n.t(:medium_violet_red),
#    '#191970' =>  I18n.t(:midnight_blue),
#    '#F5FFFA' =>  I18n.t(:mint_cream),
#    '#FFE4E1' =>  I18n.t(:misty_rose),
#    '#FFE4B5' =>  I18n.t(:moccasin),
#    '#FFDEAD' =>  I18n.t(:navajo_white),
#    '#000080' =>  I18n.t(:navy),
#    '#FDF5E6' =>  I18n.t(:old_lace),
#    '#808000' =>  I18n.t(:olive),
#    '#6B8E23' =>  I18n.t(:olive_drab),
#    '#FFA500' =>  I18n.t(:orange),
#    '#FF4500' =>  I18n.t(:orange_red),
#    '#DA70D6' =>  I18n.t(:orchid),
#    '#EEE8AA' =>  I18n.t(:pale_golden_rod),
#    '#98FB98' =>  I18n.t(:pale_green),
#    '#AFEEEE' =>  I18n.t(:pale_turquoise),
#    '#D87093' =>  I18n.t(:pale_violet_red),
#    '#FFEFD5' =>  I18n.t(:papaya_whip),
#    '#FFDAB9' =>  I18n.t(:peach_puff),
#    '#CD853F' =>  I18n.t(:peru),
#    '#FFC0CB' =>  I18n.t(:pink),
#    '#DDA0DD' =>  I18n.t(:plum),
#    '#B0E0E6' =>  I18n.t(:powder_blue),
#    '#800080' =>  I18n.t(:purple),
#    '#FF0000' =>  I18n.t(:red),
#    '#BC8F8F' =>  I18n.t(:rosy_brown),
#    '#4169E1' =>  I18n.t(:royal_blue),
#    '#8B4513' =>  I18n.t(:saddle_brown),
#    '#FA8072' =>  I18n.t(:salmon),
#    '#F4A460' =>  I18n.t(:sandy_brown),
#    '#2E8B57' =>  I18n.t(:sea_green),
#    '#FFF5EE' =>  I18n.t(:sea_shell),
#    '#A0522D' =>  I18n.t(:sienna),
#    '#C0C0C0' =>  I18n.t(:silver),
#    '#87CEEB' =>  I18n.t(:sky_blue),
#    '#6A5ACD' =>  I18n.t(:slate_blue),
#    '#708090' =>  I18n.t(:slate_gray),
#    '#708090' =>  I18n.t(:slate_grey),
#    '#FFFAFA' =>  I18n.t(:snow),
#    '#00FF7F' =>  I18n.t(:spring_green),
#    '#4682B4' =>  I18n.t(:steel_blue),
#    '#D2B48C' =>  I18n.t(:tan),
#    '#008080' =>  I18n.t(:teal),
#    '#D8BFD8' =>  I18n.t(:thistle),
#    '#FF6347' =>  I18n.t(:tomato),
#    '#40E0D0' =>  I18n.t(:turquoise),
#    '#EE82EE' =>  I18n.t(:violet),
#    '#F5DEB3' =>  I18n.t(:wheat),
#    '#FFFFFF' =>  I18n.t(:white),
#    '#F5F5F5' =>  I18n.t(:white_smoke),
#    '#FFFF00' =>  I18n.t(:yellow),
#    '#9ACD32' =>  I18n.t(:yellow_green),
  }

  def self.find(*args)
    size_objects = Array.new

    case args.first
      when :first then ColorObject.new('#FFFFFF', COLOR['#FFFFFF'])
      when :all then 
        COLOR.each do |k,v|
          size_objects.push(ColorObject.new(k, v))
        end
        size_objects
      else ColorObject.new(args.first, COLOR[args.first])
    end
  end

end

class ColorObject

  attr_accessor :name, :id

  def initialize(id, name)
    self.id = id
    self.name = name
  end

end

