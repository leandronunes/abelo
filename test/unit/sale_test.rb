require File.dirname(__FILE__) + '/../test_helper'

class SaleTest < Test::Unit::TestCase

  fixtures :products, :banks, :ledger_categories, :organizations
  include Status

  def setup
    @organization = create_organization
    BankAccount.create!(:organization => @organization, :account => 234, :bank_id => 1, :agency => 3434, :is_default => true )
    @user = User.create!("salt"=>"7e3041ebc2fc05a40c60028e2c4901a81035d3cd", "updated_at"=>nil, "crypted_password"=>"00742970dc9e6319f8019fd54864d3ea740f04b1", "type"=>"User", "remember_token_expires_at"=>nil, "id"=>"1", "administrator"=>false, "remember_token"=>nil, "login"=>"new_user", "email"=>"new_user@example.com", "created_at"=>"2007-07-14 18:03:29")
    @product_category = create_product_category
    @product1 = create_product(:organization => @organization)
    @product2 = create_product(:organization => @organization, :name => 'another name')
  end

  def test_setup
    assert @organization.valid?
    assert @user.valid?
    assert @product1.valid?
    assert @product2.valid?
    assert @organization.products.include?(@product1)
    assert @organization.products.include?(@product2)
  end

  def test_status_values
    assert_equal STATUS_PENDING, 0
    assert_equal STATUS_DONE, 1
    assert_equal STATUS_CANCELLED, 2
  end


  def test_dependence_of_sale_item
    Product.any_instance.stubs(:amount_in_stock).returns(342)
    Sale.delete_all
    SaleItem.delete_all
    sale = create_sale()
    create_item(:product => @product1, :sale => sale, :amount => 10 )
    create_item(:product => @product2, :sale => sale, :amount => 1)
    sale.reload
    assert sale.destroy
    assert_equal 0, SaleItem.count
  end

  def test_dependence_of_ledger
    Product.any_instance.stubs(:amount_in_stock).returns(342)
    Sale.delete_all
    SaleItem.delete_all
    Ledger.delete_all
    sale = create_sale()
    amount  = 10
    create_item(:sale => sale, :product => @product1, :amount => amount )
    Ledger.create(:payment_method => Payment::MONEY, :owner => sale, :value => amount * @product1.sell_price, :date => Date.today )
    assert sale.destroy
    assert_equal 0, Ledger.count
  end

  def test_uniq_pending_sale
    Sale.delete_all
    sale1 = new_sale(:datetime => '2007-08-04', :salesman => @user)
    assert sale1.save!
    sale2 = new_sale(:datetime => '2007-08-04', :salesman => @user, :till => sale1.till)
    sale2.till = sale1.till
    assert !sale2.save
    assert sale2.errors.invalid?(:status)
    assert_equal 1, Sale.find(:all).length    
  end

  def test_total_value
    Product.any_instance.stubs(:amount_in_stock).returns(342)
    SaleItem.delete_all
    Sale.delete_all
    sale = create_sale(:datetime => '2007-08-04', :salesman => @user)
    item1 = create_item(:product => @product1, :amount => 10, :sale => sale )
    item2 = create_item(:product => @product2, :amount => 1, :sale => sale)
    sale.reload
    assert_equal 10 * @product1.sell_price + 1 * @product2.sell_price, sale.total_value
  end

  def test_relation_with_organization
    sale = create_sale(:organization => @organization)
    assert_equal @organization, sale.organization
  end

  def test_relation_with_customer
    customer = Customer.new(:name => 'João da Silva')
    sale = create_sale(:datetime => '2007-08-04')
    sale.customer = customer
    assert_equal customer, sale.customer        
  end

  def test_relation_with_user
    sale = create_sale(:salesman => @user)
    assert_equal @user, sale.salesman
  end

  def test_inclusion_of_status_on_pre_defined_status
    sale = create_sale
    sale.status = 4
    sale.valid?
    assert sale.errors.invalid?(:status)
  end

#TODO see it's usefull
#  def test_relation_with_payments
#    sale = Sale.create(:datetime => '2007-08-04', :organization_id => @organization.id, :user_id => @user.id)
#    pay = PaymentWithCash.new(:value => 50.00, :datetime => '2007-08-04', :received => true, :cash => 50.00)
#    sale.payments.concat(pay)
#    assert sale.payments.include?(pay)
#  end

  def test_relation_with_items
    Product.any_instance.stubs(:amount_in_stock).returns(342)
    sale = create_sale
    cat_prod = ProductCategory.create(:name => 'Category for testing', :organization_id => @organization.id)
    product = create_product
    item = create_item(:product => product, :amount => 2, :sale => sale)
    sale.reload
    assert sale.sale_items.include?(item)
  end
 
  def test_mandatory_field_date
    sale = create_sale()
    sale.datetime = nil
    sale.valid?
    assert sale.errors.invalid?(:datetime)
  end

  def test_mandatory_field_organization_id
    sale = create_sale()
    sale.organization = nil
    sale.valid?
    assert sale.errors.invalid?(:organization_id)
  end

  def test_mandatory_field_user_id
    sale = create_sale()
    sale.salesman = nil
    sale.valid?
    assert sale.errors.invalid?(:user_id)
  end

  def test_pendind
    Sale.delete_all
    sale = create_sale()
    assert_equal Sale.pending(sale.till), sale
  end

  def test_open
    sale = create_sale(:datetime => '2007-08-04', :organization_id => @organization.id, :user_id => @user.id) 
    sale.open?
    assert_equal STATUS_PENDING, sale.status
  end

  def test_cancelled?
    Sale.destroy_all
    sale = new_sale(:datetime => '2007-08-04', :organization_id => @organization.id, :user_id => @user.id) 
    assert sale.save
    assert sale.cancel!
    assert sale.cancelled?
  end

  def test_cancel!_when_cannot_be_canceled
    sale = create_sale(:datetime => '2007-08-04', :organization_id => @organization.id, :user_id => @user.id, :status => STATUS_DONE)
    assert !sale.cancel!
    assert sale.errors.invalid?(:satus)
  end

  def test_close!
    sale = create_sale(:datetime => '2007-08-04', :status => STATUS_PENDING)
    assert sale.save
    sale.close!
    assert sale.closed?
  end

  def test_close!_with_status_canceled
    sale = create_sale(:status => STATUS_CANCELLED)
    assert sale.save
    assert_raise sale.close!
  end

  def test_close!_with_balance_different_of_zero
    sale = create_sale()
    assert sale.save
    item = SaleItem.create(:product => @product1, :sale => sale, :amount => 10 )
    sale.close!
    sale.closed?
  end

  def test_cancel_destroy
    sale = create_sale()
    sale.destroy
    assert_raise ActiveRecord::RecordNotFound do
      Sale.find(sale.id)
    end
  end

  def test_successfully_cancel
    sale = create_sale()
    sale.cancel!
    assert_equal STATUS_CANCELLED, sale.status
  end

  def test_customers_products
    Product.any_instance.stubs(:amount_in_stock).returns(342)
    cat = CustomerCategory.create(:name => 'Category for testing', :organization_id => @organization.id)
    customer = Customer.create(:name => 'João da Silva', :birthday => '1984-08-15', :address => 'Rua Pará, nº 221, Pituba', :cpf => '85288242682', :organization_id => @organization.id, :email => 'customer', :category_id => cat.id)
    sale = create_sale()
    cat_prod = ProductCategory.create(:name => 'Category for testing', :organization_id => @organization.id)
    product = create_product
    item = create_item(:sale => sale, :product => product, :amount => 2)
    sale.reload
    sale.customer = customer
    assert cat_prod.save
    assert item.save!
    assert product.save
    assert sale.customers_products(["#{product.id}"], @organization).include?(customer)
  end

end
