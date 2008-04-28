class MassMailGroupDisplay < DisplayConfiguration

  def self.describe(field)
    {
      'name' => _('Name'),
      'customers' => _('Customers'),
      'customer' => _('Customer'),
      'workers' => _('Workers'),
      'worker' => _('Worker'),
    } [field] || field
  end

end
