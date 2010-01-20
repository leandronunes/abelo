class PeriodicityDisplay < DisplayConfiguration

  def self.available_fields
    ['name','number_of_days']
  end

  def self.describe(field)
    {
      'name' => t(:name),
      'number_of_days' => t(:number_of_days),
    }[field] || field
  end
end
