class MassMailGroupDisplay < DisplayConfiguration

  def self.describe(field)
    {
      'name' => I18n.t(:name),
      'customers' => I18n.t(:customers),
      'customer' => I18n.t(:customer),
      'workers' => I18n.t(:workers),
      'worker' => I18n.t(:worker),
    } [field] || field
  end

end
