class PeriodicityDisplay < DisplayConfiguration
  def self.available_fields
    ['name','number_of_days']
  end

  def self.describe(field)
    {
      'name' => _('Name'),
      'namber_of_days' => _('Namber of Days'),
    }[field] || field
  end
end
