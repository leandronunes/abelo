class DocumentDisplay < DisplayConfiguration

  def self.all_available?
    false
  end

  def self.available_fields
    ['name', 'body', 'departments', 'owner', 'owner_class', 'tag_list'] 
  end

  def self.describe(field)
    {
      'name' => I18n.t(:name),
      'body' => I18n.t(:body),
      'departments' => I18n.t(:departments),
      'owner' => I18n.t(:person_organization_name),
      'owner_class' => I18n.t(:person_organization_function),
      'customer' => I18n.t(:customer),
      'supplier' => I18n.t(:supplier),
      'worker' => I18n.t(:worker),
      'tag_list' => I18n.t(:tag_list),
    }[field] || field
  end

end
