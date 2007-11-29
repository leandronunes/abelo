class Unit < ActiveRecord::Base

  UNIT = {
    'L' => _('Liter'),
    'U' => _('Unit'),
    'K' => _('Kilogram'),
  }

  def self.find(*args)
    size_objects = Array.new

    case args.first
      when :first then UnitObject.new('U', UNIT['U'])
      when :all then 
        UNIT.each do |k,v|
          size_objects.push(UnitObject.new(k, v))
        end
        size_objects
      else UnitObject.new(args.first, UNIT[args.first])
    end
  end


end

class UnitObject

  attr_accessor :name, :id

  def initialize(id, name)
    self.id = id
    self.name = name
  end

end

