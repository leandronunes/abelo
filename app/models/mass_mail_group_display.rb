class MassMailGroupDisplay < DisplayConfiguration

  def self.describe(field)
    {
      'name' => t(:name),
      'customers' => t(:customers),
      'customer' => t(:customer),
      'workers' => t(:workers),
      'worker' => t(:worker),
    } [field] || field
  end

end
