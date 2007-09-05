class MassMailDisplay < DisplayConfiguration

  def self.available_fields
    ['subject', 'body']
  end

  def self.title_subject
    _('Subject')
  end

  def self.title_body
    _('Body')
  end

end
