ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'
require 'mocha'

class Test::Unit::TestCase
  # Transactional fixtures accelerate your tests by wrapping each test method
  # in a transaction that's rolled back on completion.  This ensures that the
  # test database remains unchanged so your fixtures don't have to be reloaded
  # between every test method.  Fewer database queries means faster tests.
  #
  # Read Mike Clark's excellent walkthrough at
  #   http://clarkware.com/cgi/blosxom/2005/10/24#Rails10FastTesting
  #
  # Every Active Record database supports transactions except MyISAM tables
  # in MySQL.  Turn off transactional fixtures in this case; however, if you
  # don't care one way or the other, switching from MyISAM to InnoDB tables
  # is recommended.
  self.use_transactional_fixtures = true

  # Instantiated fixtures are slow, but give you @david where otherwise you
  # would need people(:david).  If you don't want to migrate your existing
  # test cases which use the @david style and don't mind the speed hit (each
  # instantiated fixtures translates to a database query per test method),
  # then set this back to true.
  self.use_instantiated_fixtures  = false

  # Add more helper methods to be used by all tests here...
  include AuthenticatedTestHelper
  fixtures :people, :profiles, :organizations, :environments, :roles, :role_assignments, :configurations

  def self.extra_parameters
    @extra_parameters
  end

  def self.add_extra_parameter(name, value)
    @extra_parameters ||= {}
    @extra_parameters[name] = value.to_s
    self.send(:include, AbeloTest)  unless self.include?(AbeloTest)
  end

  def self.under_organization(organization_nickname)
    add_extra_parameter(:organization_nickname, organization_nickname)
    raise "organization_nickname must be set!" unless extra_parameters[:organization_nickname]
  end

  def create_place
    @country = BSC::Country.create(:name => 'Some Country')
    @state = BSC::State.create(:name => 'Some State', :country => @country, :code => 'SS')
    @city = BSC::City.create(:state => @state, :name => 'Some City', :zip_code => '40000')
  end

  def create_printer(params= {})
    p = Printer.create!({:serial => 'test printer', :organization => @organization, :computer_id => 'FF:EE:44:22:GG'}.merge(params))
    p
  end

  def create_till(params = {})
    till = Till.new(@organization, @user, params[:printer] || create_printer)
    till.save
    till
  end

  def create_organization(params = {})
    create_place
    organization = new_organization(params)
    organization.save!
    organization
  end

  def new_organization(params = {})
     Organization.new({:name => 'some organization', :identifier => 'some', 
                     :country => BSC::Country.find(:first).id,
                     :state => BSC::State.find(:first).id, 
                     :city => BSC::City.find(:first).id, 
     }.merge(params))
  end

  def create_bank
    bank ||= Bank.create!(:name => 'some', :code => 3234, :site => 'http://www.some.com')
    bank
  end

  def create_bank_account(params = {})
    bank = params[:bank] || @bank || create_bank
    organization = params[:organization] || @organization || create_organization
    @bank_account = BankAccount.create!({:bank => bank, :organization => organization, 
                  :agency => 23434, :account => 33434, :is_default => true}.merge(params))
    @bank_account
  end

  def create_ledger(params = {})
    l = new_ledger(params)
    l.save!
    l
  end

  def create_add_cash(params = {})
    l = new_ledger(params.merge(:payment_method => Payment::ADD_CASH, :category => nil))
    l.save!
    l
  end

  def new_ledger(params = {})
    ledger_category = params[:category] || @ledger_category || create_ledger_category
    bank_account = params[:bank_account] || @bank_account || create_bank_account
    owner = params[:owner] || @organization
    organization = params[:organization] || @organization
    date = params[:date] || Date.today
    Ledger.new({:payment_method => Payment::MONEY, :value => 367,
                  :date => date, :owner => owner,
                  :bank_account => bank_account,
                  :category => ledger_category, :organization => organization}.merge(params))
  end

  def create_balance(params = {})
    bank_account = params[:bank_account] || @bank_account || create_bank_account
    Balance.create!({:value => 45, :date => Date.today,  :bank_account => bank_account}.merge(params))
  end

  def create_remove_cash(params = {})
    l = new_ledger(params.merge(:payment_method => Payment::REMOVE_CASH))
    l.category = nil
    l.save!
    l
  end

  def create_money(params = {})
    params[:payment_method] = Payment::MONEY
    create_ledger(params)
  end

  def create_ledger_category(params = {})
    organization = params[:organization] || @organization
    category = LedgerCategory.create!({:name => 'Some', :is_operational => false,
           :organization => organization, :type_of => Payment::TYPE_OF_INCOME,
           :payment_methods => ['money']}.merge(params))
  end

  def create_periodicity(params = {})
     @periodicity = Periodicity.new({:organization => @organization, :name => 'Some', :number_of_days => 10}.merge(params))
     @periodicity.save!
     @periodicity
  end

  def create_product_category(params = {})
    ProductCategory.create!({:name => 'some', :organization => @organization}.merge(params))
  end

  def create_product(params = {})
    @product_category ||= create_product_category
    Product.create!({:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization => @organization, :category => @product_category}.merge(params))
  end

  def create_supplier
    @supplier_category ||= create_supplier_category
    Supplier.create!(:name => 'some', :organization => @organization, 
                     :cnpj => '62.670.579/0001-57', :category => @supplier_category,
                     :email => 'supplier@colivre.coop.br')
  end

  def create_supplier_category
    SupplierCategory.create!(:name => 'some', :organization => @organization)
  end

  def create_customer_category
    CustomerCategory.create!(:name => 'some', :organization => @organization)
  end


  def create_invoice(params = {})
    Invoice.create!({:number => 3344, :serie => 33443, :issue_date => Date.today, :supplier => @supplier}.merge(params))
  end

  def create_stock_in(params ={})
    invoice = params[:invoice] || @invoice || create_invoice
    product = params[:product] || @product || create_product
    StockIn.create!({:supplier => @supplier, :amount => 30, :price => 1.99, :invoice => invoice, :product => product}.merge(params))
  end

  def create_stock_down(params = {})
    StockDown.create!(:amount => 1, :product => @product, :date => Date.today)
  end


  def create_user(params = {})
    u = User.create!({ :login => 'quire', :email => (params[:login].nil? ? 'quire@example.com' : params[:login]+'colivre.coop.br'),
                    :password => 'quire', :password_confirmation => 'quire' }.merge(params))
    create_profile(:user => u)
    u
  end

  def create_profile(params = {})
    Profile.create!({:user => @user, :organization => @organization, :template => 'organization_management' }.merge(params))
  end

  def create_department(params = {})
    Department.create!({:name => 'some', :organization => @organization}.merge(params))
  end

  def create_customer(params = {})
    @customer_category ||= create_customer_category
    Customer.create!(:name => 'some', :organization => @organization, 
                     :cpf => '642.229.464-60', :category => @customer_category,
                     :email => 'customer@colivre.coop.br')
  end

  def create_supplier(params = {})
    @supplier_category ||= create_supplier_category
    Supplier.create!({:name => 'some supplier', :organization => @organization, 
                     :cpf => '642.229.464-60', :category => @supplier_category,
                     :email => 'supplier@colivre.coop.br'}.merge(params))
  end


  def create_document(params = {})
    @organization ||= create_organization
    @department ||= create_department
    @customer ||= create_customer
    Document.create!({
      :name => 'Some Name', :is_model => false,
      :organization => @organization,:departments => [@department],
      :owner => (params[:is_model] == true ? nil : @customer),
      :document_model => params[:document_model]
    }.merge(params))
  end

  def create_sale(params = {})
    sale = new_sale(params)
    sale.save
    sale
  end

  def new_sale(params = {})
    till = params[:owner] || create_till
    Sale.new(till, params)    
  end
 
  def create_item(params = {})
    sale = params[:sale] || create_sale
    item = SaleItem.new(params.merge(:sale => sale))
    item.save!
    item
  end

end

