class OrganizationDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'cnpj', 'country', 'presentation']
  end

  def self.describe(field)
    {
      'name' =>  t(:name),
      'cnpj' => t(:cnpj),
      'presentation' => t(:presentation_name),
      'country' => t(:country),
    }[field] || field
  end

  def self.inlist_available_fields
    ['name', 'cnpj', 'country']
  end

  def self.break_lines
    ['name']
  end

  def self.titles
    self.available_fields
  end

end
