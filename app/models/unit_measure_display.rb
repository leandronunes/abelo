class UnitMeasureDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'abbreviation']
  end

  def self.describe(field)
    {
      'name' =>  t(:name),
      'abbreviation' => t(:abbreviation),
    }[field] || field
  end

end
