class CategoryDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'parent']
  end

  def self.describe(field)
    {
      'name' =>  I18n.t(:name),
      'parent' => I18n.t(:related_category),
    }[field] || field
  end

end
