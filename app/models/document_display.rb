class DocumentDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'body', 'departments', 'owner'] 
  end

  def self.describe(field)
    {
      'name' => _('Name'),
      'body' => _('Body'),
      'departments' => _('Departments'),
      'owner' => _('Owner'),
    }[field] || field
  end

end
