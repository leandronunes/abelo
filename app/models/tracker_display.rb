class TrackerDisplay < DisplayConfiguration

  #FIXME remove info column and moves the information of this filed to the field description

  def self.available_fields
    ['available_points', 'product_points', 'customer_points', 'supplier_points', 'worker_points', 'ledger_points', 'document_points', 'website_points', 'user_points']
  end

  def self.describe(field)
    {
      'available_points' => t(:total_available_points),
      'product_points'   => t(:product_points),
      'customer_points'  => t(:customer_points),
      'supplier_points'  => t(:supplier_points),
      'worker_points'    => t(:worker_points),
      'ledger_points'    => t(:ledger_points),
      'document_points'  => t(:document_points),
      'points_per_user'  => t(:points_per_user),
      'website_points'   => t(:website_points),
      'user_points'      => t(:user_points),
   }[field] || field
  end

end
