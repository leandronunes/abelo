class ProfileDisplay < DisplayConfiguration
  def self.available_fields
    ['name','permission','user']
  end

  def self.describe(field)
    {
      'name' => I18n.t(:name),
      'permission' => I18n.t(:permission),
      'user' => I18n.t(:user),
    }[field] || field
  end
end
