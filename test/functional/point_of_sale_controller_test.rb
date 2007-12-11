require File.dirname(__FILE__) + '/../test_helper'
require 'point_of_sale_controller'

# Re-raise errors caught by the controller.
class PointOfSaleController; def rescue_action(e) raise e end; end

class PointOfSaleControllerTest < Test::Unit::TestCase

  fixtures :sales, :sale_items, :system_actors, :people, :products, :ledger_categories, :bank_accounts, :configurations

  under_organization :one

  def setup
    @controller = PointOfSaleController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @user = User.find_by_login('seu_ze')
    @organization = Organization.find_by_identifier('one')
    @product = Product.find(:first)
    @sale = Sale.find(:first)
    @customer = Customer.find(:first)
    @supervisor = User.create!("administrator"=>false, "login"=>"some", "email"=>"some@example.com", :password => 'test', :password_confirmation => 'test')
    Profile.create!(:name => 'Supervisor', :organization => @organization, :user => @supervisor, :template => 'sales_supervisor')
    @category = LedgerCategory.find(:all).detect{|c| c.is_sale?}
    login_as('seu_ze')
  end

  def test_setup
    assert @organization.valid?
    assert @user.valid?
    assert @sale.valid?
    assert @organization.sales.include?(@sale)
    assert @product.valid?
    assert @organization.products.include?(@product)
    assert @customer.valid?
    assert @organization.customers.include?(@customer)
    assert @category.valid?
  end

  def create_till
    till = Till.new(@organization, @user, nil)
    till.save
  end

  def test_design_point_of_sale
    design = @controller.design_point_of_sale
    assert_kind_of DesignPointOfSale, design
  end

  def test_autocomplete_customer
    Customer.delete_all
    category = CustomerCategory.create!(:name => 'Another Category', :organization => @organization)
    Customer.create!(:name => 'new customer', :organization => @organization,  :email => 'teste@teste', :category => category, :cpf => '95511118427')
    Customer.create!(:name => 'another', :email => 'another@teste', :organization => @organization, :category => category, :cpf => '17396855128')
    assert_equal 2, Customer.count

    get :autocomplete_customer, :id =>  @sale.id, :sale => { :customer_identifier => '955'}
    assert_not_nil assigns(:customers)
    assert_kind_of Array, assigns(:customers)
    assert_equal 1, assigns(:customers).length
  end

  def test_index
    get :index
    assert_response :success 
    assert_template 'index'
  end

  def test_index_with_existing_till
    Till.destroy_all
    create_till
    get :index
    assert_response :redirect
    assert_redirected_to :action => 'till_open'
  end

  def test_open_till_whithout_till
    Till.destroy_all
    get :open_till
    assert_response :success 
    assert_template 'open_till'
    assert_not_nil assigns(:cash)
  end

  def test_open_till_with_existing_till
    Till.destroy_all
    create_till
    get :open_till
    assert_response :redirect
    assert_redirected_to :action => 'till_open'
  end

  def test_access_create_till_open_only_with_post_method
    get :create_till_open
    assert :redirect
    assert_redirected_to :action => 'index'

    post :create_till_open
    assert :success
  end
  
  def test_create_till_open
    PrinterCommand.destroy_all
    post :create_till_open
    assert_response :redirect
    assert_redirected_to :action => 'till_open'
    assert_equal 0, PrinterCommand.count, 'You cannot add printer command without a printer configured'
  end

  def test_create_till_open_with_cash
    PrinterCommand.destroy_all
    post :create_till_open, :cash => {:value => 12}
    assert_response :redirect
    assert_redirected_to :action => 'till_open'
    assert_equal 0, PrinterCommand.count, 'You cannot add printer command without a printer configured'
  end

  def test_till_open
    Till.destroy_all
    create_till
    post :till_open
    assert_response :success
    assert_template 'till_open'
  end

  def test_add_cash
    get :add_cash
    assert_response :success
    assert_template 'add_cash'
    assert assigns(:cash)
  end

  def test_create_add_cash_successfully
    Till.destroy_all
    create_till
    PrinterCommand.destroy_all
    get :create_add_cash, :cash => {:value => 12}
    assert_response :redirect
    assert_redirected_to :action => 'till_open'
    assert_not_nil assigns(:cash)
    assert_equal 12, assigns(:cash).value
    assert_equal 0, PrinterCommand.count, 'You cannot add printer command without a printer configured'
  end

  def test_create_add_cash_unsuccessfully
    Till.destroy_all
    create_till
    # The method expect a value different of nil
    get :create_add_cash, :cash => {:value => nil}
    assert_response :success
    assert_template 'add_cash'
  end

  def test_remove_cash
    get :remove_cash
    assert_response :success
    assert_template 'remove_cash'
    assert assigns(:cash)
  end

  def test_create_remove_cash_successfully
    Till.destroy_all
    create_till
    PrinterCommand.destroy_all
    get :create_remove_cash, :cash => {:value => 12}
    assert_response :redirect
    assert_redirected_to :action => 'till_open'
    assert assigns(:cash)
    assert_equal -12, assigns(:cash).value
    assert_equal 0, PrinterCommand.count, 'You cannot add printer command without a printer configured'
  end

  def test_create_remove_cash_unsuccessfully
    Till.destroy_all
    create_till
    # The method expect a value different of nil
    get :create_remove_cash, :cash => {:value => nil}
    assert_response :success
    assert_template 'remove_cash'
  end

  def test_create_close_till
    Till.destroy_all
    create_till
    PrinterCommand.destroy_all
    get :create_close_till
    assert_response :redirect
    assert_redirected_to :action => 'index'
    assert_equal 0, PrinterCommand.count, 'You cannot add printer command without a printer configured'
  end


#FIXME Stop the tests here
 
  def test_coupon_open_with_new_sale
    Sale.delete_all
 
    get :coupon_open
    assert_response :success
    assert_template 'coupon_open'
    assert_equal 1, Sale.find(:all).length
    assert_not_nil assigns(:sale)
    assert_not_nil assigns(:sale_item)
    assert_not_nil assigns(:total)
    assert_not_nil assigns(:total_payment)
    assert_not_nil assigns(:payments)
  end

  def test_coupon_open_with_pending_sale
    Sale.delete_all
    sale = Sale.create!(:date => '2007-08-04', :organization => @organization, :salesman => @user)
 
    get :coupon_open
    assert_response :success
    assert_template 'coupon_open'
    assert_not_nil assigns(:sale)
    assert_not_nil assigns(:sale_item)
    assert_not_nil assigns(:total)
    assert_not_nil assigns(:total_payment)
    assert_not_nil assigns(:payments)
  end

  def test_refresh_product_with_a_valid_product_code
    post :refresh_product, :id => @sale.id, :product_code => @product.code
    assert_response :success
    assert_template '_product_info'
    assert assigns(:product)
    assert assigns(:sale)
    assert assigns(:sale_item)
  end

  def test_refresh_product_with_a_invalid_product_code
    Product.delete_all
    post :refresh_product, :id => @sale.id, :product_code => 1
    assert_response :success
    assert_template '_product_info'
    assert_nil assigns(:product)
    assert assigns(:sale)
    assert assigns(:sale_item)
  end

  def test_add_item_with_a_valid_product_code
    num_items = @sale.items.length
    post :coupon_add_item, :id => @sale.id, :sale_item =>{ :product_code => @product.code, :amount => 2}
    assert_response :success
    assert_template '_sale'
    assert assigns(:sale)
    assert assigns(:total)
    assert_not_nil assigns(:total_payment)
    assert_not_nil assigns(:payments)
    @sale = Sale.find(@sale.id)
    assert_equal num_items + 1, @sale.items.length
  end

  def test_add_item_with_a_invalid_product_code
    num_items = @sale.items.length
    invalid_product_code = 100
    post :coupon_add_item, :id => @sale.id, :sale_item =>{ :product_code => invalid_product_code, :amount => 2}
    assert_response :success
    assert_template '_sale'
    assert assigns(:sale)
    assert assigns(:total)
    assert_not_nil assigns(:total_payment)
    assert_not_nil assigns(:payments)
    @sale = Sale.find(@sale.id)
    assert_equal num_items, @sale.items.length
  end

  def test_cancel_without_permissions
    get :cancel , :id => @sale.id

    assert_response :success
    assert_template 'cancel'

    assert assigns(:sale)
    assert assigns(:total)
    assert_not_nil assigns(:total_payment)
    assert_not_nil assigns(:payments)
    assert_not_nil flash[:notice]
  end

  def test_coupon_cancel_without_permissions
    User.create!("administrator"=>false, "login"=>"any_login", "email"=>"any_login@example.com", :password => 'test', :password_confirmation => 'test')
    post :cancel , :id => @sale.id, :user => {:login => 'some', :password => 'test'}

    assert_response :success
    assert_template 'cancel'

    assert assigns(:sale)
    assert assigns(:total)
    assert_not_nil assigns(:total_payment)
    assert_not_nil assigns(:payments)
    assert_not_nil flash[:notice]
  end

  def test_cancel_open_coupon_with_supervisor_permissions
    Sale.delete_all
    sale = Sale.create!(:date => '2007-08-04', :organization => @organization, :salesman => @user)
    post :coupon_cancel , :id => sale.id, :user => {:login => @supervisor.login, :password => @supervisor.password}

    assert_response :redirect
    assert_redirected_to :action => 'index'
  end

  def test_coupon_cancel_when_the_coupon_is_closed
    Sale.delete_all
    sale = Sale.create(:date => '2007-08-04', :organization => @organization, :salesman => @user)
    sale.cancel!
    assert sale.save
    post :coupon_cancel, :id => sale.id, :user => {:login => @supervisor.login, :password => @supervisor.password}
    assert_response :success
    assert_template 'cancel'
    assert assigns(:total)
    assert_not_nil assigns(:total_payment)
    assert_not_nil assigns(:payments)
  end
  
  def test_payment
    get :payment, :id => @sale.id
    assert_response :success
    assert_template 'payment'
    assert_not_nil assigns(:sale)
    assert_not_nil assigns(:total)
    assert_not_nil assigns(:total_payment)
    assert_not_nil assigns(:payments)
    assert_not_nil assigns(:ledger)
    assert_not_nil assigns(:ledger_categories)
    assert_equal @sale.balance, assigns(:ledger).value
  end


  def test_save_customer
    post :save_customer, :id => @sale.id, :customer_id => @customer
    assert_response :redirect
    assert_redirected_to :action => 'payment'
    assert_equal @customer, Sale.find(@sale.id).customer
  end

  def test_customer_is_nil
    post :save_customer, :id => @sale.id
    assert_response :redirect
    assert_redirected_to :action => 'payment'
    assert_nil Sale.find(@sale.id).customer
  end

  def test_select_category
    get :select_category, :payment_method => 'money'

    assert_not_nil assigns(:ledger)
    assert_not_nil assigns(:banks)
    assert_not_nil assigns(:ledger_categories)
    assert assigns(:hide_sign)
    assert_response :success
    assert_template 'shared_payments/_select_category'
  end

  def test_select_category_without_payment_method
    get :select_category, :payment_method => nil

    assert_response :success
    assert_template nil
  end


  def test_select_category_of_money_payment_method
    get :select_category, :payment_method => 'money'

    assert_kind_of Money, assigns(:ledger)
    assert_response :success
    assert_template 'shared_payments/_select_category'
  end

  def test_select_category_of_check_payment_method
    get :select_category, :payment_method => 'check'

    assert_kind_of Check, assigns(:ledger)
    assert_response :success
    assert_template 'shared_payments/_select_category'
  end

  def test_select_category_of_debit_card_payment_method
    get :select_category, :payment_method => 'debit_card'

    assert_kind_of DebitCard, assigns(:ledger)
    assert_response :success
    assert_template 'shared_payments/_select_category'
  end

  def test_select_category_of_credit_card_payment_method
    get :select_category, :payment_method => 'credit_card'

    assert_kind_of CreditCard, assigns(:ledger)
    assert_response :success
    assert_template 'shared_payments/_select_category'
  end

  def test_coupon_add_payment_to_pay_all_sale
    num_payments = @sale.ledgers.length
    post :coupon_add_payment, :id => @sale.id, :ledger => {:payment_method => 'money', :category_id => @category, :value => @sale.balance }
    assert_response :redirect
    assert_redirected_to :action => 'coupon_close'
    assert assigns(:ledger)
    assert assigns(:sale)
    assert_equal num_payments + 1, assigns(:sale).ledgers.length
  end

  def test_coupon_add_payment_without_complete_the_sale_value
    num_payments = @sale.ledgers.length
    post :coupon_add_payment, :id => @sale.id, :ledger => {:payment_method => 'money', :category_id => @category, :value => (@sale.balance - 1) }
    assert_response :redirect
    assert_redirected_to :action => 'payment'
    assert assigns(:ledger)
    assert assigns(:sale)
    assert_equal num_payments + 1, assigns(:sale).ledgers.length
  end

  def test_coupon_add_payment_with_wrong_params
    num_payments = @sale.ledgers.length
    # The value must not be nil
    post :coupon_add_payment, :id => @sale.id, :ledger => {:payment_method => 'money', :category_id => @category, :value => nil }
    assert_response :success
    assert_template 'payment'
    assert assigns(:ledger)
    assert assigns(:ledger_categories)
    assert assigns(:total)
    assert assigns(:total_payment)
    assert assigns(:payments)
    assert assigns(:banks)
    assert assigns(:sale)
    assert_equal num_payments, assigns(:sale).ledgers.length
  end

  def test_coupon_close
    get :coupon_close, :id => @sale.id

    assert_response :redirect
    assert_redirected_to :action => 'index'
  end


end
