class PeriodicityDisplay < DisplayConfiguration

  def self.available_fields
    ['name','number_of_days']
  end

  def self.describe(field)
    {
      'name' => _('Name'),
      'number_of_days' => _('Number of Days'),
    }[field] || field
  end
end
