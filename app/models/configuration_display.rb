class ConfigurationDisplay < DisplayConfiguration

#FIXME see the display on helper. I changed the ActiveRecord to DisplayConfiguration 
  def self.available_fields
    %w[
      name
      organization_name
      product_name 
      department_name
      customer_name
      document_name
      fiscal_printer
      worker_displays
      worker_category_displays
      customer_displays
      customer_category_displays
      supplier_displays
      supplier_category_displays
      product_displays
      product_category_displays
      department_displays
      ledger_category_displays
      bank_account_displays
      money_displays
      check_displays
      credit_card_displays
      debit_card_displays
      stock_virtual_displays
      stock_in_displays
      stock_out_displays
      user_displays
      periodicity_displays
      document_displays
    ]
  end

  def self.describe(field)
    {
      'name' =>  t(:name),
      'organization_name' => t(:organization_name),
      'product_name' => t(:product_name),
      'department_name' => t(:department_name),
      'customer_name' => t(:customer_name),
      'document_name' => t(:document_name),
      'worker_displays' => t(:worker_fields),
      'worker_category_displays' => t(:worker_category_fields),
      'customer_displays' => t(:customer_fields),
      'customer_category_displays' => t(:customer_category_fields),
      'supplier_displays' => t(:supplier_fields),
      'supplier_category_displays' => t(:supplier_category_fields),
      'product_displays' => t(:product_fields),
      'product_category_displays' => t(:product_category_fields),
      'department_displays' => t(:department_fields),
      'ledger_category_displays' => t(:ledger_category_fields),
      'bank_account_displays' => t(:bank_account_fields),
      'money_displays' => t(:money_fields), 
      'check_displays' => t(:check_fields),
      'credit_card_displays' => t(:credit_card_fields),
      'debit_card_displays' => t(:debit_card_fields),
      'stock_virtual_displays' => t(:stock_virtual_fields),
      'stock_in_displays' => t(:stock_in_fields),
      'stock_out_displays' => t(:stock_out_fields),
      'user_displays' => t(:user_fields),
      'periodicity_displays' => t(:periodicity_fields),
      'document_displays' => t(:document_fields),
      'fiscal_printer' => t(:has_fiscal_printer),
    }[field] || field
  end

  def self.inlist_available_fields
    ['name', 'organization_name', 'product_name', 'department_name', 'customer_name', 'document_name']
  end

  def self.break_lines
    ['organization_name']
  end

  def self.titles
    self.available_fields
  end

end
