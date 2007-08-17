class Size < ActiveRecord::Base

  SIZE = {
    'S' => _('Small'),
    'M' => _('Medium'),
    'L' => _('Large'),
    'X' => _('Extra Large')
  }

  def self.options
    options = Array.new
    SIZE.each do |k,v|
      options.push([v,k])
    end
    options
  end

end
