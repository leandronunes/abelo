class PeriodicityDisplay < DisplayConfiguration

  def self.available_fields
    ['name','number_of_days']
  end

  def self.describe(field)
    {
      'name' => I18n.t(:name),
      'number_of_days' => I18n.t(:number_of_days),
    }[field] || field
  end
end
