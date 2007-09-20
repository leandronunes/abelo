class DepartmentDisplay < DisplayConfiguration

  def self.available_fields
    ['name']
  end

  def self.describe(field)
    {
      'name' =>  _('Name'),
    }[field] || field
  end

  def self.title
    _('Department Display Configuration')
  end



end



