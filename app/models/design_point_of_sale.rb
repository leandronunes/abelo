class DesignPointOfSale

  attr_accessor :settings

#  def self.design_root
#    File.join('designs', 'point_of_sale')
#  end

  def design_data
    self.settings ||= {}
  end

  def design_data= data
    self.settings = data
  end

  def template 
    self.design_data[:template] || 'default'
  end

  def template=(value) 
    self.design_data[:template] = value
  end

  def theme 
    self.design_data[:theme] || 'default'
  end

  def theme=(value) 
    self.design_data[:theme] = value
  end

  def icon_theme 
    self.design_data[:icon_theme] || 'default'
  end

  def icon_theme=(value) 
    self.design_data[:icon_theme] = value
  end

end
