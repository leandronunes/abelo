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
    params[:organization] ||= @organization
    params[:user] ||= @user
    params[:printer] ||= create_printer
    till = Till.new(params)
    till.save
    till
  end

  def create_organization(params = {})
    create_place
    organization = new_organization(params)
    organization.save!
    organization
  end

  def create_environment(params={})
    organization = params[:organization] || @organization ||create_organization(:name => params[:name])
    Environment.create!({:name => 'some_name', :owner => organization}.merge(params))
  end

  def create_article(params = {})
    environment = params[:environment] || @environment || create_environment
    Article.create!({:name => 'some article', :environment => environment}.merge(params))
  end

  def new_organization(params = {})
     a = Article.find_by_slug(params[:identifier] || 'some')
     a.destroy unless a.nil?
     o = Organization.find_by_identifier(params[:identifier] || 'some')
     o || Organization.new({:name => 'some organization', :identifier => 'some', 
                     :country_id => BSC::Country.find(:first).id,
                     :state_id => BSC::State.find(:first).id, 
                     :city_id => BSC::City.find(:first).id, 
     }.merge(params))
  end

  def create_bank
    bank ||= Bank.find_by_code('3234') || Bank.create!(:name => 'some', :code => 3234, :site => 'http://www.some.com')
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
    l = new_ledger(params.merge(:payment_method => Payment::REMOVE_CASH, :category => nil))
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
    category = LedgerCategory.find_by_name(params[:name] || 'some')
    category ||= LedgerCategory.create!({:name => 'some', :is_operational => false,
           :organization => organization, :type_of => Payment::TYPE_OF_INCOME,
           :payment_methods => ['money']}.merge(params))
    category
  end

  def create_periodicity(params = {})
     @periodicity = Periodicity.new({:organization => @organization, :name => 'Some', :number_of_days => 10}.merge(params))
     @periodicity.save!
     @periodicity
  end

  def create_product_category(params = {})
    organization = params[:organization] || @organization || create_organization
#    ProductCategory.find_by_name('some') || ProductCategory.create!({:name => 'some', :organization => organization}.merge(params))
    ProductCategory.create!({:name => 'some', :organization => organization}.merge(params))
  end

  def create_product(params = {})
    product_category = params[:category] || @product_category || ProductCategory.find(:first) || create_product_category
    unit = params[:unit] || @unit || create_unit
    p = Product.create!({:name => 'product', :sell_price => 2.0, :organization => @organization, :unit_measure => unit, :category => product_category}.merge(params))
    p
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

  def create_worker_category
    WorkerCategory.create!(:name => 'some', :organization => @organization)
  end

  def create_invoice(params = {})
    Invoice.create!({:number => 3344, :serie => 33443, :issue_date => Date.today, :supplier => @supplier}.merge(params))
  end

  def create_stock_buy(params ={})
    invoice = params[:invoice] || @invoice || create_invoice
    invoice.status = params[:status] unless params[:status].blank?
    invoice.save
    product = params[:product] || @product || create_product
    StockBuy.create!({:supplier => @supplier, :amount => 30, :price => 1.99, :invoice => invoice, :product => product}.merge(params))
  end

  def create_stock_in(params ={})
    product = params[:product] || @product || create_product
    StockIn.create!({:supplier => @supplier, :amount => 30, :price => 1.99, :product => product, :date => Date.today}.merge(params))
  end

  def create_stock_down(params = {})
    StockDown.create!(:amount => 1, :product => @product, :date => Date.today)
  end

  def create_stock_devolution(params = {})
    StockDevolution.create!({:amount => 1, :product => @product, :date => Date.today}.merge(params))
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
    Customer.create!({:name => 'some', :organization => @organization, 
                     :cpf => '642.229.464-60', :category => @customer_category,
                     :email => 'customer@colivre.coop.br'}.merge(params))
  end

  def create_supplier(params = {})
    @supplier_category ||= create_supplier_category
    Supplier.create!({:name => 'some supplier', :organization => @organization, 
                     :cpf => '642.229.464-60', :category => @supplier_category,
                     :email => 'supplier@colivre.coop.br'}.merge(params))
  end

  def create_worker(params = {})
    @worker_category ||= create_worker_category
    Worker.create!({:name => 'some worker', :organization => @organization,
                   :cpf => '642.229.464-60', :category => @worker_category,
                   :email => 'worker@colivre.coop.br'}.merge(params))
  end


  def create_document(params = {})
    @organization ||= create_organization
    @department ||= create_department
    @customer ||= create_customer
    Document.create!({
      :name => 'Some Name', :is_model => false,
      :organization => @organization, :departments => [@department],
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
    params[:till] ||= create_till 
    Sale.new(params)    
  end
 
  def create_item(params = {})
    sale = params[:sale] || create_sale
    item = SaleItem.new(params.merge(:sale => sale))
    item.save!
    item
  end

  def create_unit(params= {})
    organization = params[:organization] || @organization || create_organization
    u = UnitMeasure.find_by_abbreviation('au')
    u ||= UnitMeasure.create!({:name => 'a unit', :abbreviation => 'au', :organization => organization}.merge(params))
    u
  end

  def create_domain(params = {})
    Domain.create!({:name => 'mycolivre.net'}.merge(params))      
  end

  def create_mass_mail(params = {})
    organization = params[:organization] || @organization || create_organization
    m = MassMail.create!({:subject => "Some subject", :body => "Some body", :organization => organization}.merge(params))
    m
  end

  def create_customer_group(params = {})
    organization = params[:organization] || @organization || create_organization
    g = CustomerGroup.create!({:name => "Some customer mass mail group", :organization => organization}.merge(params))
    g
  end
 
  def create_worker_group(params = {})
    organization = params[:organization] || @organization || create_organization
    g = WorkerGroup.create!({:name => "Some customer mass mail group", :organization => organization}.merge(params))
    g
  end

  def self.should(name, &block)
    @shoulds ||= []
  
    destname = 'test_should_' + name.gsub(/[^a-zA-z0-9]+/, '_')
    if @shoulds.include?(destname)
      raise "there is already a test named \"#{destname}\"" 
    end
  
    @shoulds << destname
    if block_given?
      self.send(:define_method, destname, &block)
    else
      self.send(:define_method, destname) do
        flunk 'pending: should ' + name
      end
    end

  end

  class ActionController::TestRequest
    def user_agent
      'firefox'
    end
  end

end

