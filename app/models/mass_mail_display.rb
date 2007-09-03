class MassMailDisplay < DisplayConfiguration

  def self.available_fields
    ['subject', 'body']
  end

  def self.title_subject
    _('Size')
  end

  def self.title_body
    _('Color')
  end

end
