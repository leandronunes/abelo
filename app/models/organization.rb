class Organization < ActiveRecord::Base

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
  has_many :display_configurations, :through => :configuration
  # End displays has_many methods
  
  has_many :departments
  has_many :products
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
  has_many :bank_accounts, :as => :owner
  has_many :stocks, :through => :products
  has_one  :environment, :as => :owner
  has_many :periodicities
  has_many :mass_mails
  # One Environment can be reached by many domains
  has_many :domains, :as => :owner


  validates_presence_of :name, :cnpj
  validates_uniqueness_of :name, :cnpj
  validates_as_cnpj :cnpj
  validates_presence_of :identifier, :name
  validates_uniqueness_of :identifier
  validates_format_of :identifier, :with => IDENTIFIER_FORMAT
  validates_exclusion_of :identifier, :in => RESERVED_IDENTIFIERS

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
    Article.find_by_path(organization.identifier).destroy
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

  #Find a ledger of organization
  def find_ledger(id)
   ledgers = self.bank_accounts.map{|b| b.ledgers}
   ledgers.flatten.detect{|l| l.id.to_s == id.to_s}
  end

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
    if(accounts.class == Array)
      ledgers = accounts.collect{|b| b.ledgers}.flatten
    else
      ledgers = self.bank_accounts.find(accounts).ledgers
    end
    ledgers #Redundant make the return value more clear
  end

  def tags_by_bank_account(accounts = [])
    return [] unless accounts.all?{|a| self.bank_accounts.include?(a)}
    accounts.collect{ |b| b.ledgers.tag_counts }.flatten
  end

  # Return the organization ledgers by tags and bank accounts passed as arguments
  def ledgers_by_tag(tags, accounts = [])
    return [] unless accounts.all?{|a| self.bank_accounts.include?(a)}
    accounts.collect{ |b| b.ledgers.find_tagged_with(tags) }.flatten
  end

  # Return the organization ledgers between the start and end dates passed as arguments
  def ledgers_by_dates(start_date, end_date, accounts = [])
    return [] if start_date.nil? or end_date.nil? or !accounts.all?{|a| self.bank_accounts.include?(a)}

    accounts.collect{|b| 
      b.ledgers.find(:all, :conditions => [ 
        '((effective_date >= ?) and (effective_date <= ?)) or (foreseen_date >= ? and foreseen_date <= ?)', 
         start_date, end_date, start_date, end_date
      ])
    }.flatten
  end

  # Return the organization ledgers by categories and bank accounts passed as arguments
  def ledgers_by_categories(categories, accounts = [])
    return [] if categories.blank? or !accounts.all?{|a| self.bank_accounts.include?(a)}

    merge_cond = ''
    categories.each do |c|
      merge_cond = merge_cond.blank? ? merge_cond + "category_id = #{c.id}" : merge_cond + " or category_id = #{c.id}"
    end

    accounts.collect{ |b| b.ledgers.find(:all, :conditions => [ merge_cond]) }.flatten
  end

  def ledgers_by_search(search_query, accounts = [])
    return [] if search_query.blank? or !accounts.all?{|a| self.bank_accounts.include?(a)}
    accounts.collect{ |b| b.ledgers.full_text_search(search_query) }.flatten
  end

  def ledgers_by_all(accounts, tags, categories, start_date, end_date, query = nil)
    return [] if accounts.blank? or !accounts.all?{|a| self.bank_accounts.include?(a)}
    ledger_banks = ledgers_by_bank_account(accounts)
    ledger_tags = ledgers_by_tag(tags, accounts)
    ledger_dates = ledgers_by_dates(start_date, end_date, accounts)
    ledger_categories = ledgers_by_categories(categories, accounts)
    ledger_search = ledgers_by_search(query, accounts)

    all_leders = ledger_banks 
    all_leders = all_leders & ledger_tags unless ledger_tags.blank?
    all_leders = all_leders & ledger_categories unless ledger_categories.blank?
    all_leders = all_leders & ledger_search unless ledger_search.blank?
    all_leders = all_leders & ledger_dates 
    all_leders
  end

  def sum_foreseen_value_by_date(bank_account, date = Date.today)
    ledgers = self.ledgers_by_bank_account(bank_account).select{|l| l.date.month == date.month}
    value = 0
    ledgers.collect{|l| value = value + l.foreseen_value }
    value
  end

  def sum_effective_value_by_date(bank_account, date = Date.today)
    ledgers = self.ledgers_by_bank_account(bank_account).select{|l| !l.is_foreseen? and l.date.month == date.month}
    value = 0
    ledgers.collect{|l| value = value + l.foreseen_value }
    value
  end
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
  def ledger_categories_by_payment_method(payment_method = 'money')
    category = LedgerCategory.find(:all, :conditions => ['organization_id = ?', self], :order => 'type_of, name ASC' )
    category.select{|c| c.payment_methods.include?(payment_method)} 
  end

  # Return all ledger categories of a specific payment method
  # ordened by type and name.
  # Income ledger categories appear first ordened by name and
  # Expense ledger categories appear after ordened by name too.
  def sale_ledger_categories_by_payment_method(payment_method = 'money')
    category = LedgerCategory.find(:all, :conditions => ['organization_id = ?', self], :order => 'type_of, name ASC' )
    category.select{|c| c.payment_methods.include?(payment_method) and c.is_sale?} 
  end
 

  # Create new stock objects fill virtual attributes 'product_in_list' and 'amount_in_list'
  # of Stock object to display this attributes on list action
  def stock_virtuals
    StockVirtual.create_virtuals(self.products)
  end 

  def stock_virtual_devolutions
    StockVirtual.create_virtual_devolutions(self.products)
  end

  def stock_virtual_ins
    StockVirtual.create_virtual_ins(self.products)
  end

  def stock_virtual_outs
    StockVirtual.create_virtual_outs(self.products)
  end 

  def stock_virtual_downs
    StockVirtual.create_virtual_downs(self.products)
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
