class ConfigurationDisplay < ActiveRecord::Base

  def self.available_fields
    %w[
      name
      organization_name
      product_name 
      department_name
      customer_name
      document_name
      worker_displays
      customer_displays
      supplier_displays
      product_displays
      department_displays
      ledger_category_displays
      ledger_displays
      bank_account_displays
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
      'customer_displays' => _('Customer Fields'),
      'supplier_displays' => _('Supplier Fields'),
      'product_displays' => _('Product Fields'),
      'department_displays' => _('Department Fields'),
      'ledger_category_displays' => _('Ledger Category Fields'),
      'ledger_displays' => _('Ledger Fields'),
      'bank_account_displays' => _('Bank Account Fields'),
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
