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
      'name' =>  I18n.t(:name),
      'organization_name' => I18n.t(:organization_name),
      'product_name' => I18n.t(:product_name_str),
      'department_name' => I18n.t(:department_name_str),
      'customer_name' => I18n.t(:customer_name_str),
      'document_name' => I18n.t(:document_name_str),
      'worker_displays' => I18n.t(:worker_fields),
      'worker_category_displays' => I18n.t(:worker_category_fields),
      'customer_displays' => I18n.t(:customer_fields),
      'customer_category_displays' => I18n.t(:customer_category_fields),
      'supplier_displays' => I18n.t(:supplier_fields),
      'supplier_category_displays' => I18n.t(:supplier_category_fields),
      'product_displays' => I18n.t(:product_fields),
      'product_category_displays' => I18n.t(:product_category_fields),
      'department_displays' => I18n.t(:department_fields),
      'ledger_category_displays' => I18n.t(:ledger_category_fields),
      'bank_account_displays' => I18n.t(:bank_account_fields),
      'money_displays' => I18n.t(:money_fields), 
      'check_displays' => I18n.t(:check_fields),
      'credit_card_displays' => I18n.t(:credit_card_fields),
      'debit_card_displays' => I18n.t(:debit_card_fields),
      'stock_virtual_displays' => I18n.t(:stock_virtual_fields),
      'stock_in_displays' => I18n.t(:stock_in_fields),
      'stock_out_displays' => I18n.t(:stock_out_fields),
      'user_displays' => I18n.t(:user_fields),
      'periodicity_displays' => I18n.t(:periodicity_fields),
      'document_displays' => I18n.t(:document_fields),
      'fiscal_printer' => I18n.t(:has_fiscal_printer),
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
