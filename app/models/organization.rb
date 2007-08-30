class Organization < ActiveRecord::Base

  after_create do |organization|
    configuration = Configuration.new
    configuration.organization = organization
    configuration.save!
  end

#TODO See a way to guarantee that a organization cannot be created whithout a configuration

  has_one :configuration, :dependent => :delete

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
  has_many :ledgers, :through => :bank_accounts, :foreign_key => :organization_id
  has_many :periodicities

  validates_presence_of :name, :cnpj, :nickname
  validates_uniqueness_of :name, :cnpj, :nickname
  validates_as_cnpj :cnpj
  validates_format_of :nickname, :with => /^[a-z0-9_]*$/, :message => '%{fn} can only contain downcase letters, numbers and "_"'

  acts_as_design

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

  def ledgers_by_bank_account(bank_account = nil)
    bank_account = default_bank_account if bank_account.nil?
    bank_account.nil? ? Array.new : bank_account.ledgers
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


  # Return all ledger categories ordened by type and name.
  # Income ledger categories appear first ordened by name and
  # Out ledger categories appear after ordened by name too.
  #TODO see if it's useful
  def ledger_categories_sorted
    LedgerCategory.find(:all, :conditions => ['organization_id = ?', self], :order => 'type_of, name ASC' )
  end


  def customers_by_products(list_products)
    customers = []
    self.sales.each { |s|
      customers = s.customers_products(list_products, self)
    }
    return customers
  end

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

end
