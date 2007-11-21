class SystemActor < ActiveRecord::Base

  #relationships 
  belongs_to :organization
  has_many :contacts
  has_many :documents, :as => :owner
 

  attr_accessor :type_person

  acts_as_ferret :fields => ['name', 'description']

  #validations
  validates_presence_of :name, :organization_id, :category_id,:email    
  validates_as_cnpj :cnpj
  validates_as_cpf :cpf
  validates_presence_of :cnpj, :scope => :organization_id, :if  => lambda { |actor| actor.person_type == 'juristic' }, :message => _('This %{fn} already exist')
  validates_presence_of :cpf, :scope => :organization_id, :if  => lambda { |actor| actor.person_type == 'natural' }, :message => _('This %{fn} already exist')
  validates_uniqueness_of :cnpj, :scope => :organization_id, :if => lambda { |user| ! user.cnpj.blank? }, :message => _('This %{fn} already exist')
  validates_uniqueness_of :cpf, :scope => :organization_id, :if => lambda { |user| ! user.cpf.blank? }, :message => _('This %{fn} already exist')

  def actor_type
    self.type_person ||= self.cnpj.nil? ? _('Natural Person') : _('Juristic Person')
  end

  def person_type 
    self.type_person ||= self.cnpj.nil? ? 'natural' : 'juristic'
  end

  def person_type= type
    self.type_person = type
  end

  def validate
    if (self.cpf.blank? && self.cnpj.blank?)
      errors.add('person_type', 'Either %{fn} or CPF must be filled, and they cannot be filled at the same time.')
    end
  end

  def identifier
    self.cpf || self.cnpj
  end

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    results = self.find_by_contents(q, options)
    return results
  end

  # maps an actor to an human-readable string
  def self.describe(actor)
    return {
      'customer' => _('Customer'),
      'worker' => _('Worker'),
      'supplier' => _('Supplier')
    }[actor]
  end

  
  # Return all ledgers of a sale filtering with the parameters:
  #   - Accounts
  #   - Tags
  #   - Categories
  #   - Start Date
  #   - End Date
  #   - Query
  def sale_ledgers_by_all(accounts, tags, categories, start_date, end_date, query = nil)
    return [] if accounts.blank? or !accounts.all?{|a| self.organization.bank_accounts.include?(a)}
    ledger_banks = ledgers_by_bank_account(accounts)
    ledger_tags = ledgers_by_tag(tags, accounts)
    ledger_dates = ledgers_by_dates(start_date, end_date, accounts)
    ledger_categories = ledgers_by_categories(categories, accounts)
    ledger_search = ledgers_by_search(query, accounts)
    ledger_sale = Sale.sale_ledgers_by_customer(self)  

    all_leders = ledger_banks 
    all_leders = all_leders & ledger_tags unless ledger_tags.blank?
    all_leders = all_leders & ledger_categories unless ledger_categories.blank?
    all_leders = all_leders & ledger_search unless ledger_search.blank?
    all_leders = all_leders & ledger_dates
    all_leders = all_leders & ledger_sale
    all_leders
  end

  # Return the organization ledgers by bank accounts passed as arguments
  def ledgers_by_bank_account(accounts = [])
    accounts = [accounts] unless accounts.kind_of?(Array)
    return [] unless accounts.all?{|a| self.organization.bank_accounts.include?(a)}
    if(accounts.class == Array)
      ledgers = accounts.collect{|b| b.ledgers}.flatten
    else
      ledgers = self.organization.bank_accounts.find(accounts).ledgers
    end
    ledgers #Redundant make the return value more clear
  end

  # Return the organization ledgers by tags and bank accounts passed as arguments
  def ledgers_by_tag(tags, accounts = [])
    return [] unless accounts.all?{|a| self.organization.bank_accounts.include?(a)}
    accounts.collect{ |b| b.ledgers.find_tagged_with(tags) }.flatten
  end

  # Return the organization ledgers between the start and end dates passed as arguments
  def ledgers_by_dates(start_date, end_date, accounts = [])
    return [] if start_date.nil? or end_date.nil? or !accounts.all?{|a| self.organization.bank_accounts.include?(a)}

    accounts.collect{|b|
      b.ledgers.find(:all, :conditions => [
        '((effective_date >= ?) and (effective_date <= ?)) or (foreseen_date >= ? and foreseen_date <= ?)',
         start_date, end_date, start_date, end_date
      ])
    }.flatten
  end

  # Return the organization ledgers by categories and bank accounts passed as arguments
  def ledgers_by_categories(categories, accounts = [])
    return [] if categories.blank? or !accounts.all?{|a| self.organization.bank_accounts.include?(a)}

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



end
