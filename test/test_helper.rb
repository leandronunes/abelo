ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

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
    params[:printer] ||= @printer
    till = Till.new(params)
    till.save
    till
  end

  def create_organization(params = {})
    create_place
    organization = new_organization(params)
    organization.address = Address.new(address_params)
    organization.save!
    organization
  end

  def address_params(params= {})
    {:city_id => 1, :state_id => 1, :country_id => 1}.merge(params)
  end

  def create_environment(params={})
    @organization = params[:organization] || @organization
    Environment.create!({
                         :name => 'some_name', 
                         :owner => @organization,
                         :design_data => { :template => "default", :theme => "default", :icon_theme => "default" }
                        }.merge(params))
  end

  def create_article(params = {})
    environment = params[:environment] || @environment
    Article.create!({:name => 'some article', :environment => environment}.merge(params))
  end

  def new_organization(params = {})
     a = Article.find_by_slug(params[:identifier] || 'one')
     a.destroy unless a.nil?
     o = Organization.find_by_identifier(params[:identifier] || 'one')
     o ||= Organization.new({:name => 'one organization', :identifier => 'one', 
                     :country_id => BSC::Country.find(:first).id,
                     :state_id => BSC::State.find(:first).id, 
                     :city_id => BSC::City.find(:first).id, 
     }.merge(params))
     o.name ||= 'some organization'
     o.contact_name='some contact'
     o
  end

  def organization_params(options= {})
    {
      :name => 'Some Organization', 
      :identifier => 'testing_org', 
      :cnpj => '78048802000169', 
      :country_id => @country.id, 
      :state_id => @state.id, 
      :contact_name => 'contact name', 
      :city_id => @city.id
    }.merge(options)
  end

  def create_bank
    bank ||= Bank.find_by_code('3234') || Bank.create!(:name => 'some', :code => 3234, :site => 'http://www.some.com')
    bank
  end

  def create_bank_account(params = {})
    bank = params[:bank] || @bank
    organization = params[:organization] || @organization
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
    ledger_category = params[:category] || @ledger_category 
    bank_account = params[:bank_account] || @bank_account
    owner = params[:owner] || @organization
    organization = params[:organization] || @organization
    date = params[:date] || Date.today
    Ledger.new({:payment_method => Payment::MONEY, :value => 367,
                  :date => date, :owner => owner,
                  :bank_account => bank_account,
                  :category => ledger_category, :organization => organization}.merge(params))
  end

  def create_balance(params = {})
    bank_account = params[:bank_account] || @bank_account
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
    if category.nil?
      category ||= LedgerCategory.create!({:name => 'some', :is_operational => false,
           :organization => organization, :type_of => Payment::TYPE_OF_INCOME,
           :payment_methods => ['money']}.merge(params))
    else
      category.update_attributes(params)
    end
    category
  end

  def create_periodicity(params = {})
     @periodicity = Periodicity.new({:organization => @organization, :name => 'Some', :number_of_days => 10}.merge(params))
     @periodicity.save!
     @periodicity
  end

  def create_product_category(params = {})
    organization = params[:organization] || @organization
    ProductCategory.create!({:name => 'some', :organization => organization}.merge(params))
  end

  def create_product(params = {})
    product_category = params[:category] || @product_category
    unit = params[:unit_measure] || @unit
    p = Product.create!({:name => 'product', :sell_price => 2.0, :organization => @organization, :unit_measure => unit, :category => product_category}.merge(params))
    p
  end

  def create_supplier
    Supplier.create!(:name => 'some', :organization => @organization, 
                     :cnpj => '62.670.579/0001-57', :category => @supplier_category,
                     :email => 'supplier@colivre.coop.br')
  end

  def create_supplier_category(options = {})
    SupplierCategory.create!({:name => 'some', :organization => @organization}.merge(options))
  end

  def create_customer_category(options = {})
    CustomerCategory.create!({:name => 'some', :organization => @organization}.merge(options))
  end

  def create_worker_category(options = {})
    WorkerCategory.create!({:name => 'some', :organization => @organization}.merge(options))
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
    u = User.create!(user_params(params))
    create_profile(:user => u)
    u
  end

  def user_params(params = {})
    { 
      :login => 'quire', 
      :email => (params[:login].nil? ? 'quire@example.com' : params[:login]+'colivre.coop.br'),
      :password => 'test', 
      :password_confirmation => 'test' 
    }.merge(params)
  end

  def create_profile(params = {})
    Profile.create!({:user => @user, :organization => @organization, :template => 'organization_management' }.merge(params))
  end

  def create_department(params = {})
    Department.create!({:name => 'some', :organization => @organization}.merge(params))
  end

  def create_customer(params = {})
    Customer.create!({:name => 'some', :organization => @organization, 
                     :cpf => '642.229.464-60', :category => @customer_category,
                     :email => 'customer@colivre.coop.br'}.merge(params))
  end

  def create_supplier(params = {})
    Supplier.create!({:name => 'some supplier', :organization => @organization, 
                     :cpf => '642.229.464-60', :category => @supplier_category,
                     :email => 'supplier@colivre.coop.br'}.merge(params))
  end

  def create_worker(params = {})
    Worker.create!({:name => 'some worker', :organization => @organization,
                   :cpf => '642.229.464-60', :category => @worker_category,
                   :email => 'worker@colivre.coop.br'}.merge(params))
  end


  def create_document(params = {})
    Document.create!({
      :name => 'Some Name', :is_model => false,
      :organization => @organization, :departments => [@department],
      :owner => (params[:is_model] == true ? nil : @customer),
      :document_model => params[:document_model]
    }.merge(params))
  end

  def create_schedule_ledger(params = {})
    ScheduleLedger.create!({:periodicity_id => 1, :start_date => DateTime.now, :interval => 3}.merge(params))
  end

  def create_document_item(params = {})
    DocumentItem.create!({
      :quantity => 10,
      :number => 5,
      :unitary_value => 5.0,
      :document_section_id => 1,
      :product_id => 1
    }.merge(params))
  end

  def create_document_section(params = {})
    DocumentSection.create!({
      :name => 'some document item',
      :document_id => 1
    }.merge(params))
  end

  def create_sale(params = {})
    sale = new_sale(params)
    sale.save!
    sale
  end

  def new_sale(params = {})
    params[:till] ||= @till
    params[:organization] ||= @organization
    params[:user_id] = @user.id unless @user.nil?
    Sale.new(params)    
  end
 
  def create_item(params = {})
    sale = params[:sale] || @sale
    item = SaleItem.new(params.merge(:sale => sale))
    item.save!
    item
  end

  def create_unit(params= {})
    organization = params[:organization] || @organization
    u = UnitMeasure.find_by_abbreviation('au')
    if u.nil?
      u = UnitMeasure.create!({:name => 'a unit', :abbreviation => 'au', :organization => organization}.merge(params))
    else
      u.update_attributes(params)
    end
    u
  end

  def create_domain(params = {})
    Domain.create!({:name => 'mycolivre.net'}.merge(params))      
  end

  def create_mass_mail(params = {})
    organization = params[:organization] || @organization
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

  def generate_random_string
    chars = ('a'..'z').to_a
    Array.new(30, '').collect{chars[rand(chars.size)]}.join
  end

  def generate_image_data(content = generate_random_string)
    image_path = File.join(RAILS_ROOT, 'tmp', generate_random_string + '.png')
    test_image = Magick::Image.new(300, 300, Magick::HatchFill.new('white','black'))
    gc = Magick::Draw.new
    gc.stroke('transparent').fill('black')
    gc.text(10,10,content)
    gc.draw(test_image)
    test_image.write(image_path)
    return image_path
  end

  def create_image(options = {})
    image_path = generate_image_data
    image = Image.new(image_params(options))
    image.save!
    image
  end

  def image_params(options = {})
    image_path = generate_image_data
    {:uploaded_data => ActionController::TestUploadedFile.new(image_path, 'image/png'), :description => "some description" }.merge(options)
  end
  

  class ActionController::TestRequest
    def user_agent
      'firefox'
    end
  end

end

