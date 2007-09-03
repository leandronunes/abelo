class DepartmentDisplay < DisplayConfiguration

  def self.available_fields
    ['name']
  end

  def self.title_name
    _('Name')
  end

end



