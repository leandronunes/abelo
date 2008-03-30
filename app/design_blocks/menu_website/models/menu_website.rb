class MenuWebsite < Design::Block

  def self.description
    _("Website's Menu")
  end

  def maximum_subitems= value
    self.settings[:maximum_subitems] = value.to_i
  end

  def maximum_subitems
    self.settings[:maximum_subitems] || 1
  end

end
