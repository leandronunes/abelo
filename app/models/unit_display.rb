class UnitDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'abbreviation']
  end

  def self.describe(field)
    {
      'name' =>  _('Name'),
      'abbreviation' => _('Abbreviation'),
    }[field] || field
  end

end
