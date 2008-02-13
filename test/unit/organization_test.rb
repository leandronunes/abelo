require File.dirname(__FILE__) + '/../test_helper'

class OrganizationTest < Test::Unit::TestCase

  fixtures :bank_accounts, :banks, :system_actors, :departments

  def setup
    create_place
    @organization = Organization.find_by_identifier('one')
    @customer = Customer.find(:first)
    @department = Department.find(:first)
    @cat_prod = ProductCategory.create(:name => 'Category for testing', :organization_id => @organization.id)
    @cat_cust = CustomerCategory.create(:name => 'Category for testing', :organization_id => @organization.id)
    @cat_worker = WorkerCategory.create(:name => 'Category for testing', :organization_id => @organization.id)
    @cat_supp = SupplierCategory.create(:name => 'Category for testing', :organization_id => @organization.id)

    @user = User.create!("salt"=>"7e3041ebc2fc05a40c60028e2c4901a81035d3cd", "updated_at"=>nil, "crypted_password"=>"00742970dc9e6319f8019fd54864d3ea740f04b1", "type"=>"User", "remember_token_expires_at"=>nil, "id"=>"1", "administrator"=>false, "remember_token"=>nil, "login"=>"new_user", "email"=>"new_user@example.com", "created_at"=>"2007-07-14 18:03:29")
  end

  def create_document(params = {})
    Document.create!(
      {
        :name => 'Anohter Document Again', 
        :organization => @organization, 
        :is_model => false,
        :departments => [@department]
      }.merge(params)
    )
  end

  def create_till
    till = Till.new(@organization, @user, nil)
    till.save
    till
  end

  def create_sale(params = {})
    till =  create_till
    sale = Sale.new(till, params)
    sale.save
    sale
  end

  def create_ledger
    ledger = Ledger.new(:payment_method => Payment::ADD_CASH)
    ledger.bank_account = @organization.default_bank_account
    ledger.owner = @organization
    ledger.value = 10
    ledger.save!
  end

  def test_setup
    assert @organization.valid?
    assert @cat_prod.valid?
    assert @cat_cust.valid?
    assert @cat_worker.valid?
    assert @cat_supp.valid?
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
    sale = create_sale()
    @organization.sales.concat(sale)
    assert @organization.sales.include?(sale)
  end

  def test_relation_with_mass_mails
    mail = MassMail.create(:subject => "Email subject", :body => "Email body", :organization_id => @organization.id)
    @organization.mass_mails.concat(mail)
    assert @organization.mass_mails.include?(mail)
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
    num_actors = @organization.system_actors.length
    supplier = Supplier.create!(:name => 'Hering', :cnpj => '58178734000145', :organization_id => @organization.id, :email => 'contato@hering.com', :category_id => @cat_supp.id)
    customer = Customer.create!(:name => 'João da Silva', :email => 'joao@softwarelivre.org', :cpf => '74676743920', :organization_id => @organization.id, :email => 'joao@softwarelivre.org', :category_id => @cat_cust.id)
    worker = Worker.create!(:name => 'José Fernandes', :cpf => '63358421813', :category_id => @cat_worker.id, :organization_id => @organization.id , :email => 'jose@toca.com')
    assert_equal num_actors + 3, @organization.system_actors.count
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
    org = Organization.create(:cnpj => '63182452000151', :identifier => 'org')
    assert org.errors.invalid?(:name) 
  end

  def test_mandatory_field_identifier
    org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151')
    assert org.errors.invalid?(:identifier)
  end

  def test_uniqueness_name
    org_1 = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :identifier => 'org_1')
    org_2 = Organization.create(:name => 'Organization for testing', :cnpj => '67444545000168', :identifier => 'org_2')
    assert org_2.errors.invalid?(:name) 
  end

  def test_uniqueness_cnpj
    org_1 = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :identifier => 'org_1')
    org_2 = Organization.create(:name => 'Organization for testing 2', :cnpj => '63182452000151', :identifier => 'org_2')
    assert org_2.errors.invalid?(:cnpj) 
  end

  def test_uniqueness_identifier
    org_1 = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :identifier => 'org')
    org_2 = Organization.new(:name => 'Organization for testing 2', :cnpj => '67444545000168', :identifier => 'org')
    org_2.valid?
    assert org_2.errors.invalid?(:identifier) 
  end

  def test_cnpj_format
    org = Organization.new(:name => 'Organization for testing', :identifier => 'org')
    org.cnpj = 'bli'
    assert(!org.save)
    org.cnpj = '12121212121212'
    assert(!org.save)
    org.cnpj = '66145476000129'
    assert(org.save)
  end

  def test_identifier_format
    org = Organization.new(:name => 'Organization for testing', :cnpj => '63182452000151')
    org.identifier = 'invalid identifier'
    assert(!org.save)
    org.identifier = 'valid_identifier'
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

  def test_documents_model
    dept = Department.create!(:name => 'Department for testing', :organization_id => @organization.id)
    com_prop = Document.create!(:name => 'Commercial Proposal', :organization_id => @organization.id, :is_model => true, :department_ids => [dept.id])
    assert @organization.documents_model.include?(com_prop)
  end

  def test_document_not_model
    doc = create_document(:is_model => false, :owner => @customer)
    assert @organization.documents_not_model.include?(doc) 
  end

  def test_ledgers
    l = create_ledger
     
    assert_not_nil @organization.ledgers(l.object_id)
  end

  def test_get_all_ledgers
    Ledger.destroy_all
    create_ledger
    create_ledger
    create_ledger
    n = Ledger.count 
    assert_equal n, @organization.ledgers.length
  end


end
