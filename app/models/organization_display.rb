class OrganizationDisplay < DisplayConfiguration

#FIXME see the display on helper. I changed the ActiveRecord to DisplayConfiguration 

  def self.available_fields
    ['name', 'cnpj', 'presentation']
  end

  def self.describe(field)
    {
      'name' =>  _('Name'),
      'cnpj' => _('CNPJ'),
      'presentation' => _('Presentation Name'),
    }[field] || field
  end

  def self.inlist_available_fields
    ['presentation', 'name', 'cnpj']
  end

  def self.break_lines
    ['name']
  end

  def self.titles
    self.available_fields
  end

end
