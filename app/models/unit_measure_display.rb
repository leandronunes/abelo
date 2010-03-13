class UnitMeasureDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'abbreviation']
  end

  def self.describe(field)
    {
      'name' =>  I18n.t(:name),
      'abbreviation' => I18n.t(:abbreviation),
    }[field] || field
  end

end
