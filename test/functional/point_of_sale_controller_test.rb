require File.dirname(__FILE__) + '/../test_helper'
require 'point_of_sale_controller'

# Re-raise errors caught by the controller.
class PointOfSaleController; def rescue_action(e) raise e end; end

class PointOfSaleControllerTest < Test::Unit::TestCase

  fixtures :system_actors, :people, :products, :ledger_categories, :bank_accounts, :configurations

  under_organization :one

  def setup
    @controller = PointOfSaleController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @user = User.find_by_login('seu_ze')
    @organization = Organization.find_by_identifier('one')
    @product = Product.find(:first)
    @customer = @organization.customers.find(:first)
    @supervisor = User.create!("administrator"=>false, "login"=>"some", "email"=>"some@example.com", :password => 'test', :password_confirmation => 'test')
    Profile.create!(:name => 'Supervisor', :organization => @organization, :user => @supervisor, :template => 'sales_supervisor')
    @category = LedgerCategory.find(:all).detect{|c| c.is_sale?}
    login_as('seu_ze')
    @till = create_till
    @sale = Sale.new(@till) 
    @sale.save
  end

  def test_setup
    assert @organization.valid?
    assert @user.valid?
    assert @sale.valid?
    assert @till.valid?
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
    till
  end

  def create_sale
    till = create_till
    sale = Sale.new(till)
    sale.save
    sale
  end

  def create_sale_item(sale, params)
    s = SaleItem.new(sale, params)
    s.save!
  end

  def test_design_point_of_sale
    design = @controller.design_point_of_sale
    assert_kind_of DesignPointOfSale, design
  end


  def test_index_with_existing_till_open
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

  def test_create_coupon_open_sucessfully
    Sale.delete_all
    Till.destroy_all
    create_till 
    get :create_coupon_open
    assert_response :redirect
    assert_redirected_to :action => 'coupon_open'
    assert_equal 1, Sale.find(:all).length
  end

  def test_create_coupon_open_unsucessfully
    Sale.delete_all
    Till.destroy_all
    create_sale 
    get :create_coupon_open
    assert_response :success
    assert_template 'till_open'
    assert_equal 1, Sale.find(:all).length
  end

  def test_coupon_open
    Sale.delete_all
    Till.destroy_all
    create_sale 

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
    post :refresh_product, :product_code => @product.code
    assert_response :success
    assert_template nil
    javascript = @response.body.split("\n")
    assert_equal "Element.update(\"abelo_product_identification\", \"#{@product.name}\");", javascript[0]
    assert_equal "Element.update(\"abelo_value_product\", \"#{@product.sell_price}\");", javascript[1]
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
    num_items = @sale.items.length
    post :create_coupon_add_item, :id => @sale.id, :sale_item =>{ :product_code => @product.code, :amount => 2}
    assert_response :success
    assert_template '_table'
    assert assigns(:sale)
    assert assigns(:total)
    assert_not_nil assigns(:total_payment)
    assert assigns(:payments)
    @sale = Sale.find(@sale.id)
    assert_equal num_items + 1, @sale.items.length
  end

  def test_add_item_with_a_invalid_product_code
    num_items = @sale.items.length
    invalid_product_code = 100
    post :create_coupon_add_item, :id => @sale.id, :sale_item =>{ :product_code => invalid_product_code, :amount => 2}
    assert_response :success
    assert_template '_sale'
    assert assigns(:sale)
    assert assigns(:total)
    assert_not_nil assigns(:total_payment)
    assert_not_nil assigns(:payments)
    @sale = Sale.find(@sale.id)
    assert_equal num_items, @sale.items.length
  end

  def test_coupon_cancel_without_permissions
    Sale.delete_all
    Till.destroy_all
    sale = create_sale 
    User.create!("administrator"=>false, "login"=>"any_login", "email"=>"any_login@example.com", :password => 'test', :password_confirmation => 'test')
    post :create_coupon_cancel, :id => sale.id, :user => {:login => 'any_login', :password => 'test'}

    assert_response :redirect
    assert_redirected_to :action => 'cancel'
    assert_not_nil flash[:notice]
  end

  def test_cancel_open_coupon_with_supervisor_permissions
    Sale.delete_all
    Till.destroy_all
    sale = create_sale 
    post :create_coupon_cancel, :id => sale.id, :user => {:login => @supervisor.login, :password => @supervisor.password}

    assert_response :redirect
    assert_redirected_to :action => 'till_open'
  end

  def test_add_payment
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
    create_sale_item(@sale, :product_code => @product.code, :amount => 1)
    post :create_coupon_add_payment, :id => @sale.id, :ledger => {:payment_method => 'money', :category_id => @category, :value => (@sale.balance - 1) }
    assert_response :success
    assert_template 'add_payment'
    assert assigns(:ledger)
    assert assigns(:total)
    assert assigns(:total_payment)
    assert assigns(:sale)
    assert_equal num_payments + 1, assigns(:sale).ledgers.length
  end

  def test_coupon_add_payment_kind_of_check
    post :create_coupon_add_payment, :id => @sale.id, :ledger => {:payment_method => 'check', :category_id => @category, :value => (@sale.balance - 1) }
    assert_not_nil assigns(:banks)
  end

  def test_coupon_add_payment_where_balance_equal_to_zero
    num_payments = @sale.ledgers.length
    create_sale_item(@sale, :product_code => @product.code, :amount => 1)
    post :create_coupon_add_payment, :id => @sale.id, :ledger => {:payment_method => 'money', :category_id => @category, :value => @sale.balance }
    assert_response :redirect
    assert_redirected_to :action => 'till_open'
    assert_equal num_payments + 1, assigns(:sale).ledgers.length
  end

  def test_coupon_add_payment_greater_than_balance_value
    num_payments = @sale.ledgers.length
    create_sale_item(@sale, :product_code => @product.code, :amount => 1)
    post :create_coupon_add_payment, :id => @sale.id, :ledger => {:payment_method => 'money', :category_id => @category, :value => (@sale.balance + 1) }
    assert_response :redirect
    assert_redirected_to :action => 'change'
    assert_equal num_payments + 1, assigns(:sale).ledgers.length
  end
  def test_coupon_add_payment_with_wrong_parameters
    num_payments = @sale.ledgers.length
    create_sale_item(@sale, :product_code => @product.code, :amount => 1)
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
    assert_redirected_to :action => 'index'
  end


end
