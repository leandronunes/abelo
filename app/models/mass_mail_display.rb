class MassMailDisplay < DisplayConfiguration

  def self.available_fields
    ['subject', 'body']
  end

  def self.describe(field)
    {
      'title_subject' => _('Subject'),
      'title_body' =>    _('Body'),
    } [field] || field
  end

end
