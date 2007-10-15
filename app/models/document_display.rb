class DocumentDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'is_model', 'body'] 
  end

  def self.describe(field)
    {
      'name' => _('Name'),
      'is_model' => _('Is model'),
      'body' => _('Body'),
    }[field] || field
  end

end
