class MassMailDisplay < DisplayConfiguration

  def self.available_fields
    ['subject', 'body']
  end

  def self.describe(field)
    {
      'subject' => I18n.t(:subject),
      'body' =>    I18n.t(:body),
    } [field] || field
  end

end
