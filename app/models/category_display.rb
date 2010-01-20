class CategoryDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'parent']
  end

  def self.describe(field)
    {
      'name' =>  t(:name),
      'parent' => t(:related_category),
    }[field] || field
  end

end
