class TrackerDisplay < DisplayConfiguration

  #FIXME remove info column and moves the information of this filed to the field description

  def self.available_fields
    ['available_points', 'product_points', 'customer_points', 'supplier_points', 'worker_points', 'ledger_points', 'document_points', 'website_points', 'user_points']
  end

  def self.describe(field)
    {
      'available_points' => I18n.t(:total_available_points),
      'product_points'   => I18n.t(:product_points),
      'customer_points'  => I18n.t(:customer_points),
      'supplier_points'  => I18n.t(:supplier_points),
      'worker_points'    => I18n.t(:worker_points),
      'ledger_points'    => I18n.t(:ledger_points),
      'document_points'  => I18n.t(:document_points),
      'points_per_user'  => I18n.t(:points_per_user),
      'website_points'   => I18n.t(:website_points),
      'user_points'      => I18n.t(:user_points),
   }[field] || field
  end

end
