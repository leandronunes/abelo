require File.dirname(__FILE__) + '/../test_helper'
require 'point_of_sale_controller'

# Re-raise errors caught by the controller.
class PointOfSaleController; def rescue_action(e) raise e end; end

class PointOfSaleControllerTest < ActionController::TestCase

  under_organization :one

  def setup
    Organization.destroy_all
    Till.destroy_all
    Sale.destroy_all
    Printer.destroy_all
    User.delete_all
    @organization = create_organization(:identifier => 'one')
    @environment = create_environment(:is_default => true)
    @user = create_user
    login_as(@user.login)
    
    @bank = create_bank
    @bank_account = create_bank_account
    @product_category = create_product_category
    @unit = create_unit
    @product = create_product
#    @supplier = create_supplier
#    @customer = create_customer
#    @supervisor = User.create!("administrator"=>false, "login"=>"some", "email"=>"some@example.com", :password => 'test', :password_confirmation => 'test')
#    Profile.create!(:name => 'Supervisor', :organization => @organization, :user => @supervisor, :template => 'sales_supervisor')
    @ledger_category = create_ledger_category(:is_sale => true)
    @printer = create_printer
    @till = create_till(:printer => @printer)
    @sale = Sale.new(:till => @till) 
    @sale.save!
  end


  def test_setup
    assert @organization.valid?
    assert @user.valid?
    assert @sale.valid?
    assert @till.valid?
    assert @organization.sales.include?(@sale)
#    assert @product.valid?
#    assert @organization.products.include?(@product)
#    assert @customer.valid?
#    assert @organization.customers.include?(@customer)
#    assert @category.valid?
  end

  def test_design_point_of_sale
    design = @controller.design_point_of_sale
    assert_kind_of DesignPointOfSale, design
  end


  def test_index_with_existing_till_open
    till = mock
    till.stubs(:nil?).returns(false)
    Till.stubs(:load).returns(till)
    get :index
    assert_response :redirect
    assert_redirected_to :action => 'till_open'
  end

  def test_index_without_open_till
    Till.destroy_all
    get :index
    assert_response :success
    assert_template 'index'
  end

  def test_open_till_whithout_till
    Till.destroy_all
    get :open_till
    assert_response :success 
    assert_template 'open_till'
    assert_not_nil assigns(:cash)
  end

  def test_open_till_with_existing_till
    till = mock()
    till.stubs(:nil?).returns(false)
    Till.stubs(:load).returns(till)
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
  
  def test_create_till_open_with_existing_till
    Till.stubs(:load).returns(@till)
    post :create_till_open
    assert_response :redirect
    assert_redirected_to :action => 'till_open'
  end

  def test_create_till_open
    Till.destroy_all
    post :create_till_open
    assert_response :redirect
    assert_redirected_to :action => 'till_open'
    assert_equal 1, Till.count
  end

  def test_create_till_open_with_cash
    Ledger.destroy_all
    Till.stubs(:load).returns(@till)
    post :create_till_open, :cash => {:value => 12}
    assert_response :redirect
    assert_redirected_to :action => 'till_open'
    assert_equal 1, Ledger.count
  end

  def test_till_open
    sale = mock() 
    Sale.expects(:pending).returns(sale)
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
    Till.stubs(:load).returns(@till)
    PrinterCommand.destroy_all
    get :create_add_cash, :cash => {:value => 12}
    assert_response :redirect
    assert_redirected_to :action => 'till_open'
    assert_not_nil assigns(:cash)
    assert_equal 12, assigns(:cash).value
    assert_equal 0, PrinterCommand.count, 'You cannot add printer command without a printer configured'
  end

  def test_create_add_cash_unsuccessfully
    Till.stubs(:load).returns(@till)
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
    Till.stubs(:load).returns(@till)
    PrinterCommand.destroy_all
    get :create_remove_cash, :cash => {:value => 12}
    assert_response :redirect
    assert_redirected_to :action => 'till_open'
    assert assigns(:cash)
    assert_equal -12, assigns(:cash).value
    assert_equal 0, PrinterCommand.count, 'You cannot add printer command without a printer configured'
  end

  def test_create_remove_cash_unsuccessfully
    Till.stubs(:load).returns(@till)
    # The method expect a value different of nil
    get :create_remove_cash, :cash => {:value => nil}
    assert_response :success
    assert_template 'remove_cash'
  end

  def test_create_close_till
    Till.stubs(:load).returns(@till)
    PrinterCommand.destroy_all
    get :create_close_till
    assert_response :redirect
    assert_redirected_to :action => 'index'
    assert_equal 0, PrinterCommand.count, 'You cannot add printer command without a printer configured'
  end

  def test_create_coupon_open_sucessfully
    Till.stubs(:load).returns(@till)
    Sale.destroy_all
    get :create_coupon_open
    assert_response :redirect
    assert_redirected_to :action => 'coupon_open'
    assert_equal 1, Sale.find(:all).length
  end

  def test_create_coupon_open_unsucessfully
    PrinterCommand.stubs(:get_computer_id).returns(@printer.computer_id)
    get :create_coupon_open
    assert_response :success
    assert_template 'till_open'
    assert_equal 1, Sale.find(:all).length
  end

  def test_coupon_open
    Till.stubs(:load).returns(@till)
    get :coupon_open
    assert_response :success
    assert_template 'coupon_open'
    assert_not_nil assigns(:sale)
    assert_not_nil assigns(:sale_item)
    assert_not_nil assigns(:payments)
  end

  def test_refresh_product_with_a_valid_product_code
    product = mock()
    product.stubs(:name).returns('some name')
    product.stubs(:sell_price).returns(23)
    Product.expects(:find_by_code).with('2312').returns(product)
    post :refresh_product, :product_code => '2312'
    assert_response :success
    assert_template nil
    javascript = @response.body.split("\n")
    assert_equal "Element.update(\"abelo_product_identification\", \"#{product.name}\");", javascript[0]
    assert_equal "Element.update(\"abelo_value_product\", \"#{product.sell_price}\");", javascript[1]
    assert assigns(:product)
  end

  def test_refresh_product_with_a_invalid_product_code
    Product.delete_all
    post :refresh_product, :id => @sale.id, :product_code => 1
    assert_response :success
    assert_template nil
    javascript = @response.body.split("\n")
    assert javascript[0].match(/Element.update\("abelo_product_identification"/)
    assert_nil assigns(:product)
  end

  def test_add_item_with_a_valid_product_code
    Sale.expects(:pending).returns(@sale)
    Product.any_instance.stubs(:amount_in_stock).returns(34)
    num_items = @sale.sale_items.length
    post :create_coupon_add_item, :id => @sale.id, :sale_item =>{ :product_code => @product.code, :amount => 2}
    assert_response :success
    assert_template '_table'
    assert assigns(:sale)
    assert assigns(:total)
    assert_not_nil assigns(:total_payment)
    assert assigns(:payments)
    @sale = Sale.find(@sale.id)
    assert_equal num_items + 1, @sale.sale_items.length
  end

  def test_add_item_with_a_invalid_product_code
    num_items = @sale.sale_items.length
    Sale.expects(:pending).returns(@sale)
    invalid_product_code = 100
    post :create_coupon_add_item, :id => @sale.id, :sale_item =>{ :product_code => invalid_product_code, :amount => 2}
    assert_response :success
    assert_template '_sale'
    assert assigns(:sale)
    assert assigns(:total)
    assert_not_nil assigns(:total_payment)
    assert_not_nil assigns(:payments)
    @sale = Sale.find(@sale.id)
    assert_equal num_items, @sale.sale_items.length
  end

  def test_coupon_cancel_without_permissions
    Till.stubs(:load).returns(@till)
    User.create!("administrator"=>false, "login"=>"any_login", "email"=>"any_login@example.com", :password => 'test', :password_confirmation => 'test')
    post :create_coupon_cancel, :id => @sale.id, :user => {:login => 'any_login', :password => 'test'}

    assert_response :redirect
    assert_redirected_to :action => 'cancel'
    assert_not_nil flash[:notice]
  end

  def test_cancel_open_coupon_with_supervisor_permissions
    Till.stubs(:load).returns(@till)
    User.any_instance.stubs(:allowed_to?).returns(true)
    post :create_coupon_cancel, :id => @sale.id, :user => {:login => 'some', :password => 'some'}

    assert_response :redirect
    assert_redirected_to :action => 'till_open'
  end

  def test_add_payment
    Sale.expects(:pending).returns(@sale)
    get :add_payment
    assert_response :success
    assert_template 'add_payment'
    assert_not_nil assigns(:sale)
    assert_not_nil assigns(:total)
    assert_not_nil assigns(:total_payment)
    assert_not_nil assigns(:payments)
    assert_not_nil assigns(:ledger)
    assert_not_nil assigns(:ledger_categories)
    assert_equal @sale.balance, assigns(:ledger).value
  end

  def test_select_customer
    post :select_customer, :customer_id => @customer
    assert_response :redirect
    assert_redirected_to :action => 'add_payment'
    assert_equal @customer, Sale.find(@sale.id).customer
  end

  def test_select_nil_customer
    post :select_customer, :customer_id => nil
    assert_response :redirect
    assert_redirected_to :action => 'add_payment'
    assert_nil Sale.find(@sale.id).customer
  end

  def test_search_customer
    post :search_customer, :search => ''
    assert_not_nil assigns(:customers)
    assert_equal assigns(:customers).length, @organization.customers.length, "All customers of organization were expected"

#TODO see why dind't works
#    post :search_customer, :search => @customer.name
#    assert_not_nil assigns(:customers)
#    assert_equal 1, assigns(:customers).length, "Only the customer %s was expected" % @customer.name

  end

  def test_popup_customer
    post :popup_customer
    assert_response :success
    assert_template 'popup_customer'
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

    assert_equal Payment::MONEY, assigns(:ledger).payment_method
    assert_response :success
    assert_template 'shared_payments/_select_category'
  end

  def test_select_category_of_check_payment_method
    get :select_category, :payment_method => 'check'

    assert_equal Payment::CHECK, assigns(:ledger).payment_method
    assert_response :success
    assert_template 'shared_payments/_select_category'
  end

  def test_select_category_of_debit_card_payment_method
    get :select_category, :payment_method => 'debit_card'

    assert_equal Payment::DEBIT_CARD, assigns(:ledger).payment_method
    assert_response :success
    assert_template 'shared_payments/_select_category'
  end

  def test_select_category_of_credit_card_payment_method
    get :select_category, :payment_method => 'credit_card'

    assert_equal Payment::CREDIT_CARD, assigns(:ledger).payment_method
    assert_response :success
    assert_template 'shared_payments/_select_category'
  end

  def test_coupon_add_payment_without_complete_the_sale_value
    num_payments = @sale.ledgers.length
    Sale.any_instance.stubs(:balance).returns(10)
    Till.stubs(:load).returns(@till)
    post :create_coupon_add_payment, :id => @sale.id, :ledger => {:payment_method => 'money', :category_id => @ledger_category, :value => (@sale.balance - 1) }
    assert_response :success
    assert_template 'add_payment'
    assert assigns(:ledger)
    assert assigns(:total)
    assert assigns(:total_payment)
    assert assigns(:sale)
    assert_equal num_payments + 1, assigns(:sale).ledgers.length
  end

  def test_coupon_add_payment_kind_of_check
    Till.stubs(:load).returns(@till)
    post :create_coupon_add_payment, :id => @sale.id, :ledger => {:payment_method => 'check', :category_id => @ledger_category, :value => (@sale.balance - 1) }
    assert_not_nil assigns(:banks)
  end

  def test_coupon_add_payment_where_balance_equal_to_zero
    num_payments = @sale.ledgers.length
    Sale.any_instance.stubs(:balance).returns(0)
    Till.stubs(:load).returns(@till)
    post :create_coupon_add_payment, :id => @sale.id, :ledger => {:payment_method => 'money', :category_id => @ledger_category, :value => 10 }
    assert_response :redirect
    assert_redirected_to :action => 'till_open'
    assert_equal num_payments + 1, assigns(:sale).ledgers.length
  end

  def test_coupon_add_payment_greater_than_balance_value
    num_payments = @sale.ledgers.length
    Till.stubs(:load).returns(@till)
    post :create_coupon_add_payment, :id => @sale.id, :ledger => {:payment_method => 'money', :category_id => @ledger_category, :value => (@sale.balance + 1) }
    assert_response :redirect
    assert_redirected_to :action => 'change'
    assert_equal num_payments + 2, assigns(:sale).ledgers.length
  end
  def test_coupon_add_payment_with_wrong_parameters
    num_payments = @sale.ledgers.length
    Sale.any_instance.stubs(:balance).returns(10)
    Till.stubs(:load).returns(@till)
    post :create_coupon_add_payment, :id => @sale.id, :ledger => {:payment_method => 'money', :category_id => @category, :value => nil }
    assert_response :success
    assert_template 'add_payment'
    assert assigns(:ledger)
    assert assigns(:total)
    assert assigns(:total_payment)
    assert assigns(:sale)
    assert_equal num_payments, assigns(:sale).ledgers.length
  end

  def test_coupon_close
    get :coupon_close, :id => @sale.id

    assert_response :redirect
    assert_redirected_to :action => 'till_open'
  end


end
