class SupplierCategoryDisplay < CategoryDisplay

  def self.available_fields
    ['name', 'parent']
  end

  def self.title_name
    _('Name')
  end

  def self.title_parent
    _('Related Category')
  end

end
