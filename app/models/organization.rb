class Organization < ActiveRecord::Base

  attr_accessor :country, :state, :city

  # Valid identifiers must match this format.
  IDENTIFIER_FORMAT = /^[a-z][a-z0-9_]*[a-z0-9]$/

  # These names cannot be used as identifiers for Organizations
  RESERVED_IDENTIFIERS = %w[
    admin
    system
    myprofile
    profile
    cms
    community
    homepage
    test
  ]

  acts_as_design :root => File.join('designs', 'organization')

  has_one  :configuration, :dependent => :destroy

  # Displays has_many methods
  has_many :worker_displays, :through => :configuration
  has_many :customer_displays, :through => :configuration
  has_many :supplier_displays, :through => :configuration
  has_many :product_displays, :through => :configuration
  has_many :department_displays, :through => :configuration
  has_many :ledger_category_displays, :through => :configuration
  has_many :money_displays, :through => :configuration
  has_many :check_displays, :through => :configuration
  has_many :credit_card_displays, :through => :configuration
  has_many :debit_card_displays, :through => :configuration
  has_many :bank_account_displays, :through => :configuration
  has_many :stock_in_displays, :through => :configuration
  has_many :stock_devolution_displays, :through => :configuration
  has_many :stock_down_displays, :through => :configuration
  has_many :stock_out_displays, :through => :configuration
  has_many :user_displays, :through => :configuration
  has_many :periodicity_displays, :through => :configuration
  has_many :mass_mail_displays, :through => :configuration
  has_many :document_displays, :through => :configuration
  has_many :invoice_displays, :through => :configuration
  has_many :address_displays, :through => :configuration
  has_many :printer_displays, :through => :configuration
  has_many :display_configurations, :through => :configuration
  # End displays has_many methods
  
  has_many :departments
  has_many :products
  has_many :ledgers
  has_many :sales
  has_many :mass_mails
  has_many :documents
  has_many :categories
  has_many :product_categories
  has_many :customer_categories
  has_many :worker_categories
  has_many :ledger_categories
  has_many :supplier_categories
  has_many :system_actors
  has_many :suppliers
  has_many :customers
  has_many :workers
  has_many :profiles
  has_many :users, :through => :profiles  
  has_many :contacts, :through => :customers
  has_many :bank_accounts
  has_many :balances, :through => :bank_accounts
  has_many :stocks, :through => :products
  has_many :stock_ins, :through => :products
  has_many :stock_devolutions, :through => :products
  has_many :stock_downs, :through => :products
  has_one  :environment, :as => :owner
  has_many :periodicities
  has_many :mass_mails
  has_many :invoices, :through => :suppliers
  # One Environment can be reached by many domains
  has_many :domains, :as => :owner
  has_one :address, :as => :owner
  has_many :printers

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_uniqueness_of :cnpj, :if => lambda{|organization| not organization.cnpj.blank?}
  validates_as_cnpj :cnpj, :message => _('%{fn} is not valid.')
  validates_presence_of :identifier, :name
  validates_uniqueness_of :identifier
  validates_format_of :identifier, :with => IDENTIFIER_FORMAT
  validates_exclusion_of :identifier, :in => RESERVED_IDENTIFIERS
  validates_associated :address

  before_validation do |organization|
    if organization.address.nil?
      address = Address.new
      address.country = organization.country_obj
      address.state = organization.state_obj
      address.city = organization.city_obj
      organization.address = address
    end
  end

  #FIXME see a way to guarantee that configuration cannot be created whithout a organization
  after_create do |organization|
    transaction do 
      configuration = Configuration.new
      configuration.organization = organization
      organization.configuration = configuration
      configuration.organization_name = _('Organization')
      configuration.product_name = _('Product')
      configuration.department_name = _('Department')
      configuration.customer_name = _('Customer')
      configuration.document_name = _('Commercial Proposal')
      configuration.organization_name_on_plural = _('Organizations')
      configuration.product_name_on_plural = _('Products')
      configuration.department_name_on_plural = _('Departments')
      configuration.customer_name_on_plural = _('Customers')
      configuration.document_name_on_plural = _('Commercial Proposals')
      configuration.is_model = false
      configuration.save!

      homepage = Article.new
      homepage.title = organization.name
      homepage.parent = Comatose::Page.root
      homepage.slug = organization.identifier
      homepage.save!

      environment = Environment.new
      environment.owner = organization
      environment.name = organization.identifier
      environment.save!
     
    end
  end

  after_destroy do |organization|
    article = Article.find_by_path(organization.identifier)
    article.destroy unless article.nil?
  end

  def validate
    self.errors.add(_('You cannot change the organization properties on demonstration version')) if ACTIVATE_DEMOSTRATION == true and !self.new_record?
  end

  def country_obj
    BSC::Country.find(self.country) unless self.country.nil?
  end

  def state_obj
    BSC::State.find(self.state) unless self.state.nil?
  end

  def city_obj
    BSC::City.find(self.city) unless self.city.nil?
  end


  # Sets the identifier for this profile. Raises an exception when called on a
  # existing profile (since profiles cannot be renamed)
  def identifier=(value)
    unless self.new_record?
      raise ArgumentError.new(_('An existing organization cannot be renamed.'))
    end
    self[:identifier] = value
  end

  def homepage(reload = false)
    @homepage = nil if reload
    @homepage ||= Article.find_by_path(self.identifier)
  end

# FIXME Remove this
  # Returns all ledgers of organization. If 'id' is passed return 
  # the ledger with parameter id equal 'id'
#  def ledgers(id = nil)
#    Ledger.find((id.nil? ? :all : id), :conditions => {:bank_account_id => self.bank_accounts.to_a})
#  end

  def top_level_product_categories
    ProductCategory.top_level_for(self)
  end

  def top_level_supplier_categories 
    SupplierCategory.top_level_for(self)
  end

  def top_level_worker_categories 
    WorkerCategory.top_level_for(self)
  end

  def top_level_customer_categories 
    CustomerCategory.top_level_for(self)
  end

  def pending_sales(user)
    return Sale.pending(self, user)
  end

  def default_bank_account
    self.bank_accounts.find(:first, :conditions => ['is_default = ?', true])
  end

  # Return the organization ledgers by bank accounts passed as arguments
  def ledgers_by_bank_account(accounts = [])
    accounts = [accounts] unless accounts.kind_of?(Array)
    return [] unless accounts.all?{|a| self.bank_accounts.include?(a)}
    Ledger.find(:all, :conditions => {:bank_account_id => accounts})
  end

  def tags_by_bank_account(accounts = [])
    return [] unless accounts.all?{|a| self.bank_accounts.include?(a)}
    accounts.collect{ |b| b.ledgers.tag_counts }.flatten
  end

  # Return the organization ledgers by tags and bank accounts passed as arguments
  def ledgers_by_tag(tags, accounts = [])
    return [] unless accounts.all?{|a| self.bank_accounts.include?(a)}
    Ledger.find_tagged_with(tags, :conditions => {:bank_account_id => accounts})
  end

  # Return the organization ledgers between the start and end dates passed as arguments
  def ledgers_by_dates(start_date, end_date, accounts = [])
    return [] if start_date.nil? or end_date.nil? or !accounts.all?{|a| self.bank_accounts.include?(a)}
    Ledger.find(:all, :conditions => ['(effective_date IS ? AND foreseen_date BETWEEN ? AND ? AND bank_account_id IN (?)) OR (effective_date  BETWEEN ? AND ? AND bank_account_id IN (?) )', nil, start_date, end_date, accounts, start_date, end_date, accounts ])

# FIXME see if rails support OR sql clause and use somethig like that:
#    foressen_ledgers = Ledger.find(:all, :conditions => [{:effective_date => nil, :foreseen_date => (start_date..end_date), :bank_account_id => accounts}, {:effective_date => (start_date..end_date), :bank_account_id => accounts}])
#    effect =  Ledger.find(:all, :conditions => {:effective_date => (start_date..end_date), :bank_account_id => accounts})
  end

  # Return the organization ledgers by categories and bank accounts passed as arguments
  def ledgers_by_categories(categories, accounts = [])
    return [] if categories.blank? or !accounts.all?{|a| self.bank_accounts.include?(a)}

    Ledger.find(:all, :conditions => {:bank_account_id => accounts, :category_id => categories})
  end

  def ledgers_by_search(search_query, accounts = [])
    return [] if search_query.blank? or !accounts.all?{|a| self.bank_accounts.include?(a)}
    Ledger.full_text_search(search_query, :conditions => {:bank_account_id => accounts})
  end

  def ledgers_by_all(accounts, tags, categories, start_date, end_date, query = nil)
    return [] if accounts.blank? or !accounts.all?{|a| self.bank_accounts.include?(a)}
# FIXME see a sql way to do this search
#    conditions_clause = {}
#    conditions_clause[:bank_account_id] = accounts
#    conditions_clause[:category_id] = categories unless categories.blank?
#    all_ledgers = Ledger.find_tagged_with(tags, :conditions => conditions_clause , :order => :date)
#    all_ledgers = Ledger.find(:all, :conditions => conditions_clause , :order => :date)

    ledger_banks = ledgers_by_bank_account(accounts)
    ledger_tags = ledgers_by_tag(tags, accounts)
    ledger_dates = ledgers_by_dates(start_date, end_date, accounts)
    ledger_categories = ledgers_by_categories(categories, accounts)
    ledger_search = ledgers_by_search(query, accounts)

    all_ledgers = ledger_banks 
    all_ledgers = all_ledgers & ledger_tags unless tags.blank?
    all_ledgers = all_ledgers & ledger_categories unless categories.blank?
    all_ledgers = all_ledgers & ledger_search unless query.blank?
    all_ledgers = all_ledgers & ledger_dates 
    all_ledgers
    all_ledgers.sort{|x,y| x.date <=> y.date}
  end

# #FIXME uncomment this methods when we used it
#  def sum_foreseen_value_by_date(bank_account, date = Date.today)
#    ledgers = self.ledgers_by_bank_account(bank_account).select{|l| l.date.month == date.month}
#    value = 0
#    ledgers.collect{|l| value = value + l.foreseen_value }
#    value
#  end
#
#  def sum_effective_value_by_date(bank_account, date = Date.today)
#    ledgers = self.ledgers_by_bank_account(bank_account).select{|l| !l.pending? and l.date.month == date.month}
#    value = 0
#    ledgers.collect{|l| value = value + l.foreseen_value }
#    value
#  end
  #####################################
  # Documents Methods Related
  #####################################
  
  #Get all document models from organization
  def documents_model
    self.documents.select{ |d| d.is_model? }
  end

  #Get all document not models from organization
  def documents_not_model
    self.documents.select{ |d| !d.is_model? }
  end

  #Get all documents by a given model from organization
  def documents_by_model(model)
    self.documents.select{ |d| d.document_model == model }
  end

  #Get all documents without a model
  def documents_without_model
    self.documents_not_model.select{ |d| d.document_model_id.nil? }
  end


  # Return all ledger categories ordened by type and name.
  # Income ledger categories appear first ordened by name and
  # Out ledger categories appear after ordened by name too.
  def ledger_categories_sorted_by_name
    LedgerCategory.find(:all, :conditions => ['organization_id = ?', self], :order => 'type_of, name ASC' )
  end

  # Return all ledger categories of a specific payment method
  # ordened by type and name.
  # Income ledger categories appear first ordened by name and
  # Expense ledger categories appear after ordened by name too.
  # FIXME upgrade this function
  def ledger_categories_by_payment_method(payment_method = 'money')
    category = LedgerCategory.find(:all, :conditions => { :organization_id => self}, :order => 'type_of, name ASC' )
    category.select{|c| c.payment_methods.include?(payment_method) and !c.is_sale? and !c.is_stock?} 
  end

  # Return all ledger categories of a specific payment method
  # ordened by type and name.
  # Income ledger categories appear first ordened by name and
  # Expense ledger categories appear after ordened by name too.
  def sale_ledger_categories_by_payment_method(payment_method = 'money')
    categories = sale_ledger_categories
    categories.select{|c| c.payment_methods.include?(payment_method)} 
  end

  # Return all ledger categories of a specific payment method
  # ordened by type and name.
  # Income ledger categories appear first ordened by name and
  # Expense ledger categories appear after ordened by name too.
  def stock_ledger_categories_by_payment_method(payment_method = 'money')
    categories = stock_ledger_categories 
    categories.select{|c| c.payment_methods.include?(payment_method)} 
  end

  # Return all ledger categories thatt are not associated to stock and sale. Otherwise 
  # all ledgers with 'is_sale' and 'is_stock' attributes false.
  def common_ledger_categories
    categories = LedgerCategory.find(:all, :conditions => { :organization_id => self, :is_sale => false, :is_stock => false}, :order => 'name ASC' )
  end
 
  # Return all ledger categories associated to sale operations
  def sale_ledger_categories
    categories = LedgerCategory.find(:all, :conditions => { :organization_id => self, :is_sale => true}, :order => 'name ASC' )
  end

  # Return all ledger categories associated to stock operations
  def stock_ledger_categories
    categories = LedgerCategory.find(:all, :conditions => { :organization_id => self, :is_stock => true}, :order => 'name ASC' )
  end

  # Create new stock objects fill virtual attributes 'product_in_list' and 'amount_in_list'
  # of Stock object to display this attributes on list action
  def stock_virtuals(query=nil)
    query ||= '*'
    StockVirtual.create_virtuals(self.products.full_text_search(query))
  end 

  def stock_virtual_devolutions(query = nil)
    query ||= '*'
    StockVirtual.create_virtuals(self.products.full_text_search(query), 'stock_devolution')
  end

  def stock_virtual_downs(query = nil)
    query ||= '*'
    StockVirtual.create_virtuals(self.products.full_text_search(query), 'stock_down')
  end 

  def ledger_categories_of_sale
    self.ledger_categories.map{ |l| l.is_sale? }
  end

  def ledger_categories_of_stock
    self.ledger_categories.map{ |l| l.is_stock? }
  end

  #TODO see if it's useful
  def customers_by_products(list_products)
    customers = []
    self.sales.each { |s|
      customers = s.customers_products(list_products, self)
    }
    return customers
  end

  #TODO see if it's useful
  def customers_by_categories(list_categories)
    customers = []
    list_categories.each { |k|
      cat = self.customer_categories.find(k)
      if cat
        customers.concat(cat.customers)
      end
    }
    return customers
  end

  ################################
  # Configuration Actions
  ################################

  def has_fiscal_printer?
    self.configuration.nil? ? false : self.configuration.has_fiscal_printer?
  end

  Configuration::CONFIGURATION_NAMES.each do |item|
    define_method("camel_#{item}_name") do 
      self.configuration.send("#{item}_name").camelcase
    end

    define_method("#{item}_name") do 
      self.configuration.send("#{item}_name").downcase
    end

    define_method("camel_#{item}_name_pl") do 
      self.configuration.send("#{item}_name_on_plural").camelcase
    end

    define_method("#{item}_name_pl") do 
      self.configuration.send("#{item}_name_on_plural").downcase
    end

  end

end
