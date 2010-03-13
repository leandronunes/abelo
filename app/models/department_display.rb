class DepartmentDisplay < DisplayConfiguration

  def self.available_fields
    ['name']
  end

  def self.describe(field)
    {
      'name' =>  I18n.t(:name),
    }[field] || field
  end

end



