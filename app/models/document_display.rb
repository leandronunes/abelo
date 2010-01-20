class DocumentDisplay < DisplayConfiguration

  def self.all_available?
    false
  end

  def self.available_fields
    ['name', 'body', 'departments', 'owner', 'owner_class', 'tag_list'] 
  end

  def self.describe(field)
    {
      'name' => t(:name),
      'body' => t(:body),
      'departments' => t(:departments),
      'owner' => t(:person/organization_name),
      'owner_class' => t(:person/organization_function),
      'customer' => t(:customer),
      'supplier' => t(:supplier),
      'worker' => t(:worker),
      'tag_list' => t(:tag_list),
    }[field] || field
  end

end
