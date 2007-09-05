class LedgerCategoryDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'interests', 'interests_days', 'number_of_parcels', 'is_operational', 'is_store','type_of']
  end

  def self.title_name
    _('Name')
  end

  def self.title_interests
    _('Interests')
  end

  def self.title_interests_days
    _('Days of Interests')
  end

  def self.title_is_operational
    _('Is operational?')
  end

  def self.title_is_store
    _("It's to Store?")
  end
  
  def self.title_type_of
    _('Type of')
  end

end
