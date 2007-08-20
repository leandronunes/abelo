class Organization < ActiveRecord::Base

  after_create do |organization|
    configuration = Configuration.new
    configuration.organization = organization
    configuration.save!
  end

  has_one :configuration

  has_many :departments
  has_many :products
  has_many :sales
  has_many :mass_mails
  has_many :documents
  has_many :ledgers
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

  #TODO see if it's useful
  def operational_entrances
    return filter_historicals('t', TypeTransaction::CREDIT)
  end

  #TODO see if it's useful
  def operational_exits
    return filter_historicals('t', TypeTransaction::DEBIT)
  end

  #TODO see if it's useful
  def not_operational_entrances
    return filter_historicals('f', TypeTransaction::CREDIT)
  end

  #TODO see if it's useful
  def not_operational_exits
    return filter_historicals('f', TypeTransaction::DEBIT)
  end

  #TODO see if it's useful
  def historical_total_value(id)
    value = 0.0
    self.cash_flows.each { |c|
      if c.historical_id == id
        value = value + c.value
      end
    }
    return value
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

  private

  #TODO see if it's useful
  def filter_historicals(operational, type_transaction)
    return self.historicals.find(:all, :conditions => "operational = '#{operational}' AND type_of = '#{type_transaction}'" )
  end

end
