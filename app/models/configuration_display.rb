class ConfigurationDisplay < ActiveRecord::Base

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
      'name' =>  _('Name'),
      'organization_name' => _('Organization Name'),
      'product_name' => _('Product Name'),
      'department_name' => _('Department Name'),
      'customer_name' => _('Customer Name'),
      'document_name' => _('Document Name'),
      'worker_displays' => _('Worker Fields'),
      'worker_category_displays' => _('Worker Category Fields'),
      'customer_displays' => _('Customer Fields'),
      'customer_category_displays' => _('Customer Category Fields'),
      'supplier_displays' => _('Supplier Fields'),
      'supplier_category_displays' => _('Supplier Category Fields'),
      'product_displays' => _('Product Fields'),
      'product_category_displays' => _('Product Category Fields'),
      'department_displays' => _('Department Fields'),
      'ledger_category_displays' => _('Ledger Category Fields'),
      'bank_account_displays' => _('Bank Account Fields'),
      'money_displays' => _('Money Fields'), 
      'check_displays' => _('Check Fields'),
      'credit_card_displays' => _('Credit Card Fields'),
      'debit_card_displays' => _('Debit Card Fields'),
      'stock_virtual_displays' => _('Stock Virtual Fields'),
      'stock_in_displays' => _('Stock In Fields'),
      'stock_out_displays' => _('Stock Out Fields'),
      'user_displays' => _('User Fields'),
      'periodicity_displays' => _('Periodicity Fields'),
      'document_displays' => _('Document Fields'),
      'fiscal_printer' => _('Has Fiscal Printer'),
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
