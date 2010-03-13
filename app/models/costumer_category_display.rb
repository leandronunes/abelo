class CostumerCategoryDisplay < CategoryDisplay

  def self.available_fields
    ['name', 'parent']
  end

  def self.title_name
    I18n.t(:name)
  end

  def self.title_parent
    I18n.t(:related_category)
  end

end
