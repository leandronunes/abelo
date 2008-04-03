class TrackerDisplay < DisplayConfiguration

  #FIXME remove info column and moves the information of this filed to the field description

  def self.available_fields
    ['available_points', 'product_points', 'customer_points', 'supplier_points', 'worker_points', 'ledger_points', 'document_points', 'points_per_user', 'points_per_web_site']
  end

  def self.describe(field)
    {
      'available_points' => _('Total available points'),
      'product_points' => _('Product points'),
      'customer_points' => _('Customer points'),
      'supplier_points' => _('Supplier points'),
      'worker_points' => _('Worker points'),
      'ledger_points' => _('Ledger points'),
      'document_points' => _('Document points'),
      'points_per_user' => _('Points per user'),
      'points_per_web_site' => _('Points per web site'),
   }[field] || field
  end

end
