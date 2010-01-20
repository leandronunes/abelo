class MassMailDisplay < DisplayConfiguration

  def self.available_fields
    ['subject', 'body']
  end

  def self.describe(field)
    {
      'subject' => t(:subject),
      'body' =>    t(:body),
    } [field] || field
  end

end
