class DocumentDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'body', 'departments', 'owner', 'owner_type', 'tag_list'] 
  end

  def self.describe(field)
    {
      'name' => _('Name'),
      'body' => _('Body'),
      'departments' => _('Departments'),
      'owner' => _('Owner'),
      'owner' => _('Owner Type'),
      'customer' => _('Customer'),
      'supplier' => _('Supplier'),
      'worker' => _('Worker'),
      'tag_list' => _('Tag List')
    }[field] || field
  end

end
