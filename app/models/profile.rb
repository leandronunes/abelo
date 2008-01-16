class Profile < ActiveRecord::Base

  
  PERMISSIONS[:department] = {
    'manage_department' => N_('Manage Department'),
    'view_deparment' => N_('View Department'),
  }

  PERMISSIONS[:stock] = {
    'manage_stock' => N_('Manage Department'),
    'view_stock' => N_('View Department'),
  }

  PERMISSIONS[:configuration] = {
    'manage_category' => N_('Manage Category'),
    'manage_interface' => N_('Manage Interface'),
    'manage_content' => N_('Manage Content'),
    'manage_periodicity' => N_('Manage Periodicity'),
  }

  PERMISSIONS[:financial] = {
    'manage_ledger' => N_('Manage Ledger'),
    'view_ledger' => N_('View Ledger'),
    'manage_bank_account' => N_('Manage Bank Account'),
    'manage_ledger_category' => N_('Manage Ledger Category'),
  }

  PERMISSIONS[:point_of_sale] = {
    'point_of_sale_sell' => N_('Make Sell of Point of Sale'),
    'point_of_sale_cancel' => N_('Cancel Sell of Point of Sale'),
    'point_of_sale_add_cash' => N_('Add Cash of Point of Sale'),
    'point_of_sale_remove_cash' => N_('Remove Cash of Point of Sale'),
  }

  PERMISSIONS[:register] = {
    'manage_worker_register' => N_('Manage Worker Register'),
    'manage_customer_register' => N_('Manage Customer Register'),
    'manage_supplier_register' => N_('Manage Supplier Register'),
    'manage_product_register' => N_('Manage Product Register'),
    'view_worker_register' => N_('View Worker Register'),
    'view_customer_register' => N_('View Customer Register'),
    'view_supplier_register' => N_('View Supplier Register'),
    'view_product_register' => N_('View Product Register'),
  }


  acts_as_accessible


  belongs_to :organization
  belongs_to :user
  belongs_to :environment

  validates_presence_of :user_id
  validates_presence_of :organization_id, :if  => lambda {|p| !p.user.nil? and !p.user.administrator }

  serialize :permissions, Array

  def save
    self.permissions = Array.new if self.permissions.nil?
    super
  end

  def validate
    unless self.permissions.kind_of? Array
      self.errors.add('permissions', '%{fn} must be a list of permissions')
    end
    if !self.user.nil? and self.user.administrator and !self.organization.nil?
      self.errors.add('organization_id', 'An administrator user cannot be associated to an organization')
    end
  end


  # For example, suppose we have a profile without access to the <tt>edit</tt>
  # action of the <tt>main</tt> controller, but which has access to the
  # <tt>index</tt> action:
  #
  #   profile.allows(:controller => 'main', :action => 'index')   => true
  #   profile.allows(:controller => 'main', :action => 'edit')    => false
  def allows?(location)
    return false unless  self.organization.nil? or (location['organization_nickname'] != self.organization.identifier)
    test = location.reject { |key,value| key.to_s == 'organization_nickname' }
    self.permissions.any? do |permission|
      test.all? do |key,value|
        (value == permission[key.to_s]) || (permission[key.to_s] == '*')
      end
    end
  end

  def allows_all?(locations)
    return false unless locations.kind_of? Array
    locations.all? do |item|
      allows?(item)
    end
  end
  # defined permission templates
  TEMPLATES = {
    'sales_person' => [
      { 'controller' => 'point_of_sale', 'action' => 'index' },
      { 'controller' => 'point_of_sale', 'action' => 'coupon_open' },
      { 'controller' => 'point_of_sale', 'action' => 'refresh_product' },
      { 'controller' => 'point_of_sale', 'action' => 'coupon_add_item' },
      { 'controller' => 'point_of_sale', 'action' => 'payment' },
      { 'controller' => 'point_of_sale', 'action' => 'save_customer' },
      { 'controller' => 'point_of_sale', 'action' => 'payment_method' },
      { 'controller' => 'point_of_sale', 'action' => 'coupon_add_payment' },
      { 'controller' => 'point_of_sale', 'action' => 'coupon_close' },
      { 'controller' => 'point_of_sale', 'action' => 'cancel' },
      { 'controller' => 'point_of_sale', 'action' => 'autocomplete_customer' },
      { 'controller' => 'point_of_sale', 'action' => 'select_category' },
      { 'controller' => 'point_of_sale', 'action' => 'add_cash' },
      { 'controller' => 'point_of_sale', 'action' => 'create_add_cash' },
      { 'controller' => 'point_of_sale', 'action' => 'remove_cash' },
      { 'controller' => 'point_of_sale', 'action' => 'create_remove_cash' },
    ],
    'sales_supervisor' => [
      { 'controller' => 'point_of_sale', 'action' => '*' },
    ],
    'financial' => [
      { 'controller' => 'ledgers', 'action' => '*' },
      { 'controller' => 'ledger_categories', 'action' => '*' },
      { 'controller' => 'bank_accounts', 'action' => '*' },
    ],
    'administration' => [
      { 'controller' => 'organizations', 'action' => '*' },
      { 'controller' => 'admin_configurations', 'action' => '*' },
      { 'controller' => 'banks', 'action' => '*' },
      { 'controller' => 'permissions_admin', 'action' => '*' },
    ],
    'organization_management' => [
      { 'controller' => 'categories', 'action' => '*' },
      { 'controller' => 'stock', 'action' => '*' },
      { 'controller' => 'stock_in', 'action' => '*' },
      { 'controller' => 'stock_devolution', 'action' => '*' },
      { 'controller' => 'stock_out', 'action' => '*' },
      { 'controller' => 'stock_down', 'action' => '*' },
      { 'controller' => 'permissions', 'action' => '*' },
      { 'controller' => 'system_actors', 'action' => '*' },
      { 'controller' => 'point_of_sale', 'action' => '*' },
      { 'controller' => 'sales', 'action' => '*' },
      { 'controller' => 'mass_mails', 'action' => '*' },
      { 'controller' => 'ledgers', 'action' => '*' },
      { 'controller' => 'ledger_categories', 'action' => '*' },
      { 'controller' => 'documents', 'action' => '*' },
      { 'controller' => 'document_models', 'action' => '*' },
      { 'controller' => 'departments', 'action' => '*' },
      { 'controller' => 'main', 'action' => '*' },
      { 'controller' => 'products', 'action' => '*' },
      { 'controller' => 'bank_accounts', 'action' => '*' },
      { 'controller' => 'interface', 'action' => '*' },
      { 'controller' => 'content_viewer', 'action' => '*' },
      { 'controller' => 'periodicities', 'action' => '*' },
      { 'controller' => 'favorite_links', 'action' => '*' },
      { 'controller' => 'financial_forecasting', 'action' => '*' },
      { 'controller' => 'web_site_interface', 'action' => '*' },
      { 'controller' => 'favorite_links_web_site', 'action' => '*' },
      { 'controller' => 'favorite_links_organization', 'action' => '*' },
      { 'controller' => 'comatose_menu_web_site', 'action' => '*' },
      { 'controller' => 'product_store', 'action' => '*' },
      { 'controller' => 'organization_configuration', 'action' => '*' },
      { 'controller' => 'sintegra', 'action' => '*' },
    ],
    'other' => []
  }

  # detects the template used for this Profile, if any. Returns 'other'
  # if no template matches
  def template
    templates = TEMPLATES.select do |key, value|
      value = value.map{|v| v.reject { |key,value| key.to_s == 'organization_nickname' }}
      value == self.permissions
    end
    templates.first ? templates.first.first : 'other'
  end

  # assings the permission template to this instance of Profile.
  # * <tt>template</tt>: a string. Must be a key in the TEMPLATES hash.
  def template=(template)
    raise ArgumentError.new("%s is not a valid template" % template) unless TEMPLATES[template]
    permissions = TEMPLATES[template].each{|t| t }
    permissions = permissions.map{|a| a.reject { |key,value| key.to_s == 'organization_nickname' }}
    self.permissions = permissions
  end

  # Return an array with all locations defined by template
  def self.locations_by_template(template)
    TEMPLATES[template]
  end

  # Describes the permissions granted comparing them with the templates in this
  # class.
  def description
    self.class.describe(self.template)
  end

  # maps a template code (a key in TEMPLATES) to an human-readable string
  def self.describe(template)
    return {
      'sales_person' => _('Sales person'),
      'sales_supervisor' => _('Sales Supervisor'), 
      'financial' => _('Financial'), 
      'organization_management' => _('Organization Management'), 
      'administration' => _('Administration'), 
      'other' => _('Other')
    }[template]
  end
  
end


