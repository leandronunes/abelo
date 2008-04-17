class OrganizationDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'cnpj', 'country', 'presentation']
  end

  def self.describe(field)
    {
      'name' =>  _('Name'),
      'cnpj' => _('CNPJ'),
      'presentation' => _('Presentation Name'),
      'country' => _('Country'),
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
