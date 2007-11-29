class Size < ActiveRecord::Base

  SIZE = {
    'P' => _('Extra Small'),
    'S' => _('Small'),
    'M' => _('Medium'),
    'L' => _('Large'),
    'X' => _('Extra Large')
  }

  def self.find(*args)
    size_objects = Array.new
    
    case args.first
      when :first then SizeObject.new('S', SIZE['S'])
      when :all then 
        SIZE.each do |k,v|
          size_objects.push(SizeObject.new(k, v))
        end
        size_objects
      else SizeObject.new(args.first, SIZE[args.first])
    end
  end

end

class SizeObject

  attr_accessor :name, :id

  def initialize(id, name)
    self.id = id
    self.name = name
  end

end
