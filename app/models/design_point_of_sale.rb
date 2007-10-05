class DesignPointOfSale

  attr_accessor :settings

  def design_data
    self.settings ||= {}
  end

  def design_data= data
    self.settings = data
  end

  def icon_theme # :nodoc:
    self.settings[:icon_theme] || 'default'
  end

end
