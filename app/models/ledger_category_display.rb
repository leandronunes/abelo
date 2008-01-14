class LedgerCategoryDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'interests', 'interests_days', 'number_of_parcels', 'is_sale', 'is_stock', 'type_of', 'payment_methods']
  end

  def self.describe(field)
    {
      'name' =>  _('Name'),
      'interests' =>  _('Interests'),
      'interests_days' =>  _('Days of Interests'),
      'number_of_parcels' =>  _('Number of Parcels?'),
#      'is_operational' =>  _('Is Operational?'),
      'is_sale' =>  _('Is to Sale?'),
      'is_stock' =>  _('Is to Stock?'),
      'type_of' =>  _('Type'),
      'payment_methods' =>  _('Payment Methods'),
    }[field] || field
  end

end
