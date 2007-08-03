require File.dirname(__FILE__) + '/../test_helper'

class OrganizationTest < Test::Unit::TestCase

  def setup
    @organization = Organization.new
    @organization.name = 'organization for testing'
    @organization.cnpj = '19900000002462'
    @organization.nickname = 'test_organization'
    @organization.save
    
    @cat_prod = ProductCategory.create(:name => 'Category for testing', :organization_id => @organization.id)
    @cat_cust = CustomerCategory.create(:name => 'Category for testing', :organization_id => @organization.id)
    @cat_worker = WorkerCategory.create(:name => 'Category for testing', :organization_id => @organization.id)
    @cat_supp = SupplierCategory.create(:name => 'Category for testing', :organization_id => @organization.id)

    @user = User.create!("salt"=>"7e3041ebc2fc05a40c60028e2c4901a81035d3cd", "updated_at"=>nil, "crypted_password"=>"00742970dc9e6319f8019fd54864d3ea740f04b1", "type"=>"User", "remember_token_expires_at"=>nil, "id"=>"1", "administrator"=>nil, "remember_token"=>nil, "login"=>"new_user", "email"=>"new_user@example.com", "created_at"=>"2007-07-14 18:03:29")
  end


  def test_relation_with_departaments
    dept = Department.create(:name => 'Department for testing')
    @organization.departments.concat(dept)
    assert @organization.departments.include?(dept)
  end

  def test_relation_with_products
    product = Product.create(:name => 'Image of product', :sell_price => 2.0, :unit => 'kg', :organization_id => @organization.id)
    @organization.products.concat(product)
    assert @organization.products.include?(product)
  end

  def test_relation_with_sales
    sale = Sale.create(:date => '05-11-2007', :user_id => 1, :organization_id => @organization.id)
    @organization.sales.concat(sale)
    assert @organization.sales.include?(sale)
  end

  def test_relation_with_mass_mails
    mail = MassMail.create(:subject => "Email subject", :body => "Email body", :organization_id => @organization.id)
    @organization.mass_mails.concat(mail)
    assert @organization.mass_mails.include?(mail)
  end

  def test_relation_with_commercial_proposals
    dept = Department.create(:name => 'Department for testing')
    com_prop = CommercialProposal.create(:name => 'Commercial Proposal', :organization_id => @organization.id, :is_template => true, :department_ids => [dept.id])
    assert @organization.commercial_proposals.include?(com_prop)
  end

  def test_relation_with_ledgers
  end

  def test_relation_with_categories
    assert_equal 4, @organization.categories.count
  end

  def test_relation_with_product_categories
    assert @organization.product_categories.include?(@cat_prod)
  end

  def test_relation_with_customer_categories
    assert @organization.customer_categories.include?(@cat_cust)
  end

  def test_relation_with_worker_categories
    assert @organization.worker_categories.include?(@cat_worker)
  end

  def test_relation_with_supplier_categories
    assert @organization.supplier_categories.include?(@cat_supp)
  end

  def test_relation_with_system_actors
    supplier = Supplier.create!(:name => 'Hering', :cnpj => '58178734000145', :organization_id => @organization.id, :email => 'contato@hering.com', :category_id => @cat_supp.id)
    customer = Customer.create!(:name => 'João da Silva', :email => 'joao@softwarelivre.org', :cpf => '74676743920', :organization_id => @organization.id, :email => 'joao@softwarelivre.org', :category_id => @cat_cust.id)
    worker = Worker.create!(:name => 'José Fernandes', :cpf => '63358421813', :category_id => @cat_worker.id, :organization_id => @organization.id , :email => 'jose@toca.com')
    assert_equal 3, @organization.system_actors.count
  end

  def test_relation_with_suppliers
    supplier = Supplier.create!(:name => 'Hering', :cnpj => '58178734000145', :organization_id => @organization.id, :email => 'contato@hering.com', :category_id => @cat_prod.id)
    assert @organization.suppliers.include?(supplier)
  end

  def test_relation_with_customers
    customer = Customer.create!(:name => 'João da Silva', :email => 'joao@softwarelivre.org', :cpf => '74676743920', :organization_id => @organization.id, :email => 'joao@softwarelivre.org', :category_id => @cat_supp.id)
    assert @organization.customers.include?(customer)
  end

  def test_relation_with_workers
    worker = Worker.create!(:name => 'José Fernandes', :cpf => '63358421813', :category_id => @cat_worker.id, :organization_id => @organization.id , :email => 'jose@toca.com')
    assert @organization.workers.include?(worker)
  end

  def test_relation_with_profiles
    profile = Profile.create(:organization_id => @organization.id, :user_id => @user.id, :permissions => [:controller => '*', :action => '*'])
    assert @organization.profiles.include?(profile)
  end

  def test_users
   profile = Profile.create(:organization_id => @organization.id, :user_id => @user.id, :permissions => [:controller => '*', :action => '*'])
   assert @organization.users.include?(@user)
  end

  def test_relation_with_contacts
    customer= Customer.create!(:name => 'Hering', :cnpj => '58178734000145', :organization_id => @organization.id, :email => 'contato@hering.com', :category_id => @cat_cust.id)
    contact = Contact.create(:name => 'Contact for testing', :system_actor_id => customer.id, :category_id => @cat_cust)
    assert @organization.contacts.include?(contact)
  end

  def test_mandatory_field_name
    org = Organization.create(:cnpj => '63182452000151', :nickname => 'org')
    assert org.errors.invalid?(:name) 
  end

  def test_mandatory_field_cnpj
    org = Organization.create(:name => 'Organization for testing', :nickname => 'org')
    assert org.errors.invalid?(:cnpj) 
  end
  
  def test_mandatory_field_nickname
    org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151')
    assert org.errors.invalid?(:nickname)
  end

  def test_uniqueness_name
    org_1 = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org_1')
    org_2 = Organization.create(:name => 'Organization for testing', :cnpj => '67444545000168', :nickname => 'org_2')
    assert org_2.errors.invalid?(:name) 
  end

  def test_uniqueness_cnpj
    org_1 = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org_1')
    org_2 = Organization.create(:name => 'Organization for testing 2', :cnpj => '63182452000151', :nickname => 'org_2')
    assert org_2.errors.invalid?(:cnpj) 
  end

  def test_uniqueness_nickname
    org_1 = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
    org_2 = Organization.create(:name => 'Organization for testing 2', :cnpj => '67444545000168', :nickname => 'org')
    assert org_2.errors.invalid?(:nickname) 
  end

  def test_cnpj_format
    org = Organization.new(:name => 'Organization for testing', :nickname => 'org')
    org.cnpj = 'bli'
    assert(!org.save)
    org.cnpj = '12121212121212'
    assert(!org.save)
    org.cnpj = '66145476000129'
    assert(org.save)
  end

  def test_nickname_format
    org = Organization.new(:name => 'Organization for testing', :cnpj => '63182452000151')
    org.nickname = 'invalid nickname'
    assert(!org.save)
    org.nickname = 'valid_nickname'
    assert(org.save)
  end

  def test_top_level_product_categories
    assert @organization.top_level_product_categories.include?(@cat_prod)
  end

  def test_top_level_supplier_categories
    assert @organization.top_level_supplier_categories.include?(@cat_supp)
  end

  def test_top_level_worker_categories
    assert @organization.top_level_worker_categories.include?(@cat_worker)
  end
  
  def test_top_level_customer_categories
    assert @organization.top_level_customer_categories.include?(@cat_cust)
  end

  def test_pending_sales
    sale = Sale.create(:date => '05-11-2007', :user_id => 1, :organization_id => @organization.id)
    Sale.stubs(:pending).returns([sale])
    user = User.find(1)
    assert @organization.pending_sales(user).include?(sale)
  end

  def test_commercial_proposals_templates
    dept = Department.create(:name => 'Department for testing')
    com_prop = CommercialProposal.create(:name => 'Commercial Proposal', :organization_id => @organization.id, :is_template => true, :department_ids => [dept.id])
    CommercialProposal.stubs(:is_template).returns(true)
    assert @organization.commercial_proposals_templates.include?(com_prop)
  end

  def test_commercial_proposals_not_templates
    dept = Department.create(:name => 'Department for testing')
    com_prop = CommercialProposal.create(:name => 'Commercial Proposal', :organization_id => @organization.id, :is_template => false, :department_ids => [dept.id])
    CommercialProposal.stubs(:is_template).returns(false)
    assert @organization.commercial_proposals_not_templates.include?(com_prop) 
  end

  def test_ledger_categories_sorted
  end

  #TODO see it's necessary
  def test_has_many_cash_flows
    o = Organization.find(1)
    assert_valid o
    cf = CashFlow.new
    cf.date = Date.today
    cf.value = 10.0
    cf.historical_id = Historical.find(1)
    cf.specification_id = Specification.find(1)
    o.add_cash_flows(cf)
    assert_valid cf
    assert o.cash_flows.include?(cf)
  end

  #TODO see it's necessary
  def test_has_many_historicals
    o = Organization.find(1)
    assert_valid o
    h = Historical.new
    h.name = 'hisotrical for testing'
    h.type_of = 'C'
    h.operational = true
    o.add_historicals(h)
    assert_valid h
    assert o.historicals.include?(h)
  end

  #TODO see it's necessary
  def test_operational_entrances
    h = Historical.find(1)
    assert_valid h
    @organization.historicals.clear
    @organization.add_historicals(h)
    assert_equal true, h.operational
    assert_equal 'C', h.type_of
    historicals_expecteds = @organization.operational_entrances
    assert historicals_expecteds.include?(h)
    assert_equal 1, historicals_expecteds.size
  end

  #TODO see it's necessary
  def test_operational_exits
    h = Historical.find(2)
    assert_valid h
    @organization.historicals.clear
    @organization.add_historicals(h)
    assert_equal true, h.operational
    assert_equal 'D', h.type_of
    historicals_expecteds = @organization.operational_exits
    assert historicals_expecteds.include?(h)
    assert_equal 1, historicals_expecteds.size
  end

  #TODO see it's necessary
  def test_not_operational_entrances
    h = Historical.find(3)
    assert_valid h
    @organization.historicals.clear
    @organization.add_historicals(h)
    assert_equal false, h.operational
    assert_equal 'C', h.type_of
    historicals_expecteds = @organization.not_operational_entrances
    assert historicals_expecteds.include?(h)
    assert_equal 1, historicals_expecteds.size
  end

  #TODO see it's necessary
  def test_not_operational_exits
    h = Historical.find(4)
    assert_valid h
    @organization.historicals.clear
    @organization.add_historicals(h)
    assert_equal false, h.operational
    assert_equal 'D', h.type_of
    historicals_expecteds = @organization.not_operational_exits
    assert historicals_expecteds.include?(h)
    assert_equal 1, historicals_expecteds.size
  end

  #TODO see it's necessary
  def test_historical_total_value
    cf_1 = CashFlow.find(1)
    assert_valid cf_1
    @organization.add_cash_flows(cf_1)
    cf_2 = CashFlow.find(2)
    assert_valid cf_2
    @organization.add_cash_flows(cf_2)
    assert_equal 2, @organization.cash_flows.count
    assert_equal cf_1.historical_id, cf_2.historical_id
    total_value =  cf_1.value + cf_2.value
    assert_equal total_value, @organization.historical_total_value(cf_1.historical_id)
  end

end
