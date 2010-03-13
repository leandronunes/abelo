class LedgerCategoryDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'interests', 'interests_days', 'periodicity', 'number_of_parcels', 'is_sale', 'is_stock', 'type_of', 'payment_methods']
  end

  def self.describe(field)
    {
      'name' =>  I18n.t(:name),
      'interests' =>  I18n.t(:interests),
      'interests_days' =>  I18n.t(:days_of_interests),
      'periodicity' =>  I18n.t(:periodicity),
      'number_of_parcels' =>  I18n.t(:number_of_parcels?),
      'is_sale' =>  I18n.t(:is_to_sale?),
      'is_stock' =>  I18n.t(:is_to_stock?),
      'type_of' =>  I18n.t(:type),
      'payment_methods' =>  I18n.t(:payment_methods),
    }[field] || field
  end

end
