class LedgerCategoryDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'interests', 'interests_days', 'number_of_parcels', 'is_operational', 'is_store','type_of']
  end

  def self.describe(field)
    {
      'name' =>  _('Name'),
      'interests' =>  _('Interests'),
      'interests_days' =>  _('Days of Interests'),
      'number_of_parcels' =>  _('Number of Parcels?'),
      'is_operational' =>  _('Is Operational?'),
      'is_store' =>  _('Is to Store?'),
      'type_of' =>  _('Type of'),
    }[field] || field
  end

end