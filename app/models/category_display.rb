class CategoryDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'parent']
  end

  def self.describe(field)
    {
      'name' =>  _('Name'),
      'parent' => _('Related Category'),
    }[field] || field
  end

end
