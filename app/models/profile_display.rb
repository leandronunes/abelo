class ProfileDisplay < DisplayConfiguration
  def self.available_fields
    ['name','permission','user']
  end

  def self.describe(field)
    {
      'name' => t(:name),
      'permission' => t(:permission),
      'user' => t(:user),
    }[field] || field
  end
end
