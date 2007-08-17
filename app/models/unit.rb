class Unit < ActiveRecord::Base

  SIZE = {
    'U' => _('Units'),
    'K' => _('Kilograms'),
  }

  def self.options
    options = Array.new
    SIZE.each do |k,v|
      options.push([v,k])
    end
    options
  end

end
