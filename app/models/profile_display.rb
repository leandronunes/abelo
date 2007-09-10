class ProfileDisplay < DisplayConfiguration
  def self.available_fields
    ['name','permission','user']
  end

  def self.describe(field)
    {
      'name' => _('Name'),
      'permission' => _('Permission'),
      'user' => _('User'),
    }[field] || field
  end
end
