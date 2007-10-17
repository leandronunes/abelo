class MassMailDisplay < DisplayConfiguration

  def self.available_fields
    ['subject', 'body']
  end

  def self.describe(field)
    {
      'subject' => _('Subject'),
      'body' =>    _('Body'),
    } [field] || field
  end

end
