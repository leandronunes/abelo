class DocumentDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'body', 'departments', 'owner', 'owner_class', 'tag_list'] 
  end

  def self.describe(field)
    {
      'name' => _('Name'),
      'body' => _('Body'),
      'departments' => _('Departments'),
      'owner' => _('Person/Organization Name'),
      'owner_class' => _('Person/Organization Type'),
      'customer' => _('Customer'),
      'supplier' => _('Supplier'),
      'worker' => _('Worker'),
      'tag_list' => _('Tag_list')
    }[field] || field
  end

end
