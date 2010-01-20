class CostumerCategoryDisplay < CategoryDisplay

  def self.available_fields
    ['name', 'parent']
  end

  def self.title_name
    t(:name)
  end

  def self.title_parent
    t(:related_category)
  end

end
