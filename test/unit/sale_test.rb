require File.dirname(__FILE__) + '/../test_helper'

class SaleTest < Test::Unit::TestCase

  fixtures :products, :banks, :ledger_categories

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :identifier => 'org')
    BankAccount.create!(:owner => @org, :account => 234, :bank_id => 1, :agency => 3434, :is_default => true )
    @user = User.create!("salt"=>"7e3041ebc2fc05a40c60028e2c4901a81035d3cd", "updated_at"=>nil, "crypted_password"=>"00742970dc9e6319f8019fd54864d3ea740f04b1", "type"=>"User", "remember_token_expires_at"=>nil, "id"=>"1", "administrator"=>false, "remember_token"=>nil, "login"=>"new_user", "email"=>"new_user@example.com", "created_at"=>"2007-07-14 18:03:29")
    @product1 = Product.find(1)
    @product2 = Product.find(2)
  end

  def test_setup
    assert @org.valid?
    assert @user.valid?
    assert @product1.valid?
    assert @product2.valid?
  end

  def test_dependence_of_sale_item
    Sale.delete_all
    SaleItem.delete_all
    sale = Sale.create(:date => '2007-08-04', :organization => @org, :salesman => @user)
    SaleItem.create(:product => @product1, :sale => sale, :amount => 10 )
    SaleItem.create(:product => @product2, :sale => sale, :amount => 1)
    assert sale.destroy
    assert_equal 0, SaleItem.count
  end

  def test_dependence_of_payment
    Sale.delete_all
    SaleItem.delete_all
    Payment.delete_all
    sale = Sale.create(:date => '2007-08-04', :organization => @org, :salesman => @user)
    amount = 10
    value = 2.0
    SaleItem.create(:product => @product1, :sale => sale, :amount => amount, :unitary_price => value )
    Money.create(:owner => sale, :value => amount * value, :date => Date.today )
    assert sale.destroy
    assert_equal 0, Payment.count
  end

  def test_dependence_of_ledger
    Sale.delete_all
    SaleItem.delete_all
    Payment.delete_all
    Ledger.delete_all
    sale = Sale.create(:date => '2007-08-04', :organization => @org, :salesman => @user)
    amount = 10
    value = 2.0
    SaleItem.create(:product => @product1, :sale => sale, :amount => amount, :unitary_price => value )
    Money.create(:owner => sale, :value => amount * value, :date => Date.today )
    assert sale.destroy
    assert_equal 0, Ledger.count
  end



  def test_uniq_pending_sale
    Sale.delete_all
    sale1 = Sale.create(:date => '2007-08-04', :organization => @org, :salesman => @user)
    sale2 = Sale.create(:date => '2007-08-04', :organization => @org, :salesman => @user)
    assert sale2.errors.invalid?(:status)
    assert_equal 1, Sale.find(:all).length    
  end

  def test_total_value
    SaleItem.delete_all
    Sale.delete_all
    sale = Sale.create(:date => '2007-08-04', :organization => @org, :salesman => @user)
    item1 = SaleItem.create(:product => @product1, :sale => sale, :amount => 10 )
    item2 = SaleItem.create(:product => @product2, :sale => sale, :amount => 1)
    assert_equal 10 * @product1.sell_price + 1 * @product2.sell_price, sale.total_value
  end

  def test_relation_with_organization
    sale = Sale.create(:date => '2007-08-04', :organization_id => @org.id, :user_id => @user.id)
    assert_equal @org, sale.organization
  end

  def test_relation_with_customer
    customer = Customer.new(:name => 'João da Silva')
    sale = Sale.create(:date => '2007-08-04', :organization_id => @org.id, :user_id => @user.id)
    sale.customer = customer
    assert_equal customer, sale.customer        
  end

  def test_relation_with_user
    sale = Sale.create(:date => '2007-08-04', :organization_id => @org.id, :salesman => @user)
    assert_equal @user, sale.salesman
  end

  def test_inclusion_of_status_on_pre_defined_status
    sale = Sale.create(:date => '2007-08-04', :organization => @org, :salesman => @user)
    sale.status = 4
    sale.valid?
    assert sale.errors.invalid?(:status)
  end

#TODO see it's usefull
#  def test_relation_with_payments
#    sale = Sale.create(:date => '2007-08-04', :organization_id => @org.id, :user_id => @user.id)
#    pay = PaymentWithCash.new(:value => 50.00, :date => '2007-08-04', :received => true, :cash => 50.00)
#    sale.payments.concat(pay)
#    assert sale.payments.include?(pay)
#  end

  def test_relation_with_items
    sale = Sale.create(:date => '2007-08-04', :organization_id => @org.id, :user_id => @user.id)
    cat_prod = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => cat_prod.id)
    item = SaleItem.create(:sale_id => sale.id, :product_id => product.id, :amount => 2)
    assert sale.items.include?(item)
  end
 
  def test_mandatory_field_date
    sale = Sale.create(:organization_id => @org.id, :user_id => @user.id)
    assert sale.errors.invalid?(:date)
  end

  def test_mandatory_field_organization_id
    sale = Sale.create(:date => '2007-08-04', :user_id => @user.id) 
    assert sale.errors.invalid?(:organization_id)
  end

  def test_mandatory_field_user_id
    sale = Sale.create(:date => '2007-08-04', :organization_id => @org.id) 
    assert sale.errors.invalid?(:user_id)
  end

  def test_pendind
    Sale.delete_all
    sale = Sale.create(:date => '2007-08-04', :organization_id => @org.id, :user_id => @user.id, :status => Sale::STATUS_OPEN) 
    assert_equal Sale.pending(@org, @user), sale
  end

  def test_open
    sale = Sale.create(:date => '2007-08-04', :organization_id => @org.id, :user_id => @user.id) 
    sale.open?
    assert_equal Sale::STATUS_OPEN, sale.status
  end

  def test_cancelled?
    Sale.delete_all
    sale = Sale.new(:date => '2007-08-04', :organization_id => @org.id, :user_id => @user.id) 
    assert sale.save
    assert sale.cancel!
    assert sale.cancelled?
  end

  def test_cancel_raises
    sale = Sale.create(:date => '2007-08-04', :organization_id => @org.id, :user_id => @user.id, :status => Sale::STATUS_CLOSED)
    assert_raise ArgumentError do
      sale.cancel!
    end
  end

  def test_cancel_destroy
    sale = Sale.create(:date => '2007-08-04', :organization_id => @org.id, :user_id => @user.id, :status => Sale::STATUS_OPEN)
    sale.destroy
    assert_raise ActiveRecord::RecordNotFound do
      Sale.find(sale.id)
    end
  end

  def test_cancel
    sale = Sale.create(:date => '2007-08-04', :organization_id => @org.id, :user_id => @user.id, :status => Sale::STATUS_OPEN)
    cat_prod = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => cat_prod.id)
    item = SaleItem.create(:sale_id => sale.id, :product_id => product.id, :amount => 2)
    sale.cancel!
    assert_equal Sale::STATUS_CANCELLED, sale.status
  end

  def test_customers_products
    cat = CustomerCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    customer = Customer.create(:name => 'João da Silva', :birthday => '1984-08-15', :address => 'Rua Pará, nº 221, Pituba', :cpf => '85288242682', :organization_id => @org.id, :email => 'customer', :category_id => cat.id)
    sale = Sale.create(:date => '2007-08-04', :organization_id => @org.id, :user_id => @user.id)
    cat_prod = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => cat_prod.id)
    item = SaleItem.create(:sale_id => sale.id, :product_id => product.id, :amount => 2)
    sale.customer = customer
    assert cat_prod.save
    assert item.save
    assert product.save
    assert sale.customers_products(["#{product.id}"], @org).include?(customer)
  end

end
