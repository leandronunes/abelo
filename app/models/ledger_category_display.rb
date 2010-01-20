class LedgerCategoryDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'interests', 'interests_days', 'periodicity', 'number_of_parcels', 'is_sale', 'is_stock', 'type_of', 'payment_methods']
  end

  def self.describe(field)
    {
      'name' =>  t(:name),
      'interests' =>  t(:interests),
      'interests_days' =>  t(:days_of_interests),
      'periodicity' =>  t(:periodicity),
      'number_of_parcels' =>  t(:number_of_parcels?),
      'is_sale' =>  t(:is_to_sale?),
      'is_stock' =>  t(:is_to_stock?),
      'type_of' =>  t(:type),
      'payment_methods' =>  t(:payment_methods),
    }[field] || field
  end

end
