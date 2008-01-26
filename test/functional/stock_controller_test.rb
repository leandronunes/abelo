require File.dirname(__FILE__) + '/../test_helper'
require 'stock_controller'

# Re-raise errors caught by the controller.
class StockController; def rescue_action(e) raise e end; end

class StockControllerTest < Test::Unit::TestCase

  fixtures :stocks, :system_actors, :products, :configurations, :system_actors, :ledger_categories, :bank_accounts, :categories

  under_organization :one

  def setup
    @controller = StockController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as("quentin")
    @product = Product.find(:first)
    @supplier = Supplier.find(:first)
    @ledger_category = LedgerCategory.find(:first)
    @product_category = ProductCategory.find(:first)
    @organization = Organization.find(:first)
  end

  def create_product(params = {})
    Product.create!({:name => 'product one', :sell_price => 2.0, :unit => 'kg', :organization => @organization, :category => @product_category}.merge(params))
  end

  def create_invoice
    Invoice.create!(:number => 3344, :serie => 33443, :issue_date => Date.today, :supplier => @supplier)
  end

  def create_stock(invoice)
    StockIn.create!(:supplier => @supplier, :amount => 1, :price => 1.99, :invoice => invoice, :product => @product)
  end

  def create_ledger(params = {})
    Ledger.create!({:bank_account => @organization.default_bank_account,:owner => @organization, 
           :category => @ledger_category, :date => Date.today, :value => 23434,
           :payment_method => Payment::MONEY}.merge(params) )
  end

  def test_autocomplete_product_name
    Product.delete_all
    create_product(:name => 'product one')
    create_product(:name => 'product test two')
    create_product(:name => 'product test twice')
    get :autocomplete_product_name, :product => { :name => 'test'}
    assert_not_nil assigns(:products)
    assert_kind_of Array, assigns(:products)
    assert_equal 2, assigns(:products).length
  end

  def test_setup
    assert @product.valid?
    assert @supplier.valid?
    assert @ledger_category.valid?
    assert @organization.valid?
    assert @product_category.valid?
    assert @organization.products.include?(@product)
  end

  def test_index
    get :index
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_list
    get :list
    assert_response :success
    assert_template 'list'
    assert_not_nil assigns(:stocks)
    assert_not_nil assigns(:stock_pages)
  end

  def test_list_when_query_param_is_nil
    get :list

    assert_nil assigns(:query)
    assert_not_nil assigns(:stocks)
    assert_kind_of Array, assigns(:stocks)
    assert_not_nil assigns(:stock_pages)
    assert_kind_of ActionController::Pagination::Paginator, assigns(:stock_pages)
  end

  def test_list_when_query_param_not_nil
    Product.delete_all
    create_product(:name => 'product one')
    create_product(:name => 'product test two')
    create_product(:name => 'product test twice')
    get :list, :query => '*test*'

    assert_not_nil assigns(:query)
    assert_not_nil assigns(:stocks)
    assert_kind_of Array, assigns(:stocks)
    assert_not_nil assigns(:stock_pages)
    assert_kind_of ActionController::Pagination::Paginator, assigns(:stock_pages)

    assert_equal 2, assigns(:stocks).length
  end
 
  def test_new
    get :new
    assert_response :redirect
    assert_redirected_to :controller => 'stock_in', :action => 'new'
  end

  def test_add
    get :add, :product_id => @product.id

    assert_not_nil assigns(:stock)
    assert_not_nil assigns(:suppliers)
    assert_not_nil assigns(:invoice)
  
    assert_response :success
    assert_template 'add'
  end

  def test_create_with_correct_parameters
    count_stock = StockIn.count
    count_invoice = Invoice.count

    post :create, :product_id => @product.id, :stock => { :supplier => @supplier, :amount => 1, :price => 1.99},  :invoice => {:number => 2323, :serie => 2323, :supplier_id => @supplier.id, :issue_date => Date.today } 

    assert_response :redirect
    assert_redirected_to :action => 'edit'
    assert_equal count_stock + 1, StockIn.count
    assert_equal count_invoice + 1, Invoice.count
  end

  def test_create_with_wrong_parameters
    count = StockIn.count

    post :create, :product_id => @product.id

    assert_response :success
    assert_template 'add'
    assert_equal count, StockIn.count
    assert assigns(:stock)
    assert assigns(:invoice)
    assert assigns(:suppliers)
  end

  def test_edit
    invoice = create_invoice
    stock = create_stock(invoice)
    get :edit, :invoice_id => invoice.id, :stock_id => stock.id

    assert_response :success
    assert_template 'edit'

    assert assigns(:invoice)
    assert assigns(:stock)
    assert assigns(:suppliers)
    assert assigns(:ledgers)
    assert assigns(:ledger)
  end

  def test_history
    get :history, :product_id => @product.id

    assert_not_nil assigns(:product)
    assert_not_nil assigns(:stocks)
    assert_kind_of Array, assigns(:stocks)

    assert_response :success
    assert_template 'history'
  end

  def test_history_with_wrong_product_id
    assert_raise( ActiveRecord::RecordNotFound){
      get :history, :product_id => nil
    }
  end

  ########################################################
  #  Test Invoice Payment Module On Stock Controller
  ########################################################

  def test_payment_details
     invoice = create_invoice
    get :payment_details, :payment_method => 'money', :id => invoice

    assert_not_nil assigns(:invoice)
    assert_not_nil assigns(:ledger)
    assert_not_nil assigns(:ledgers)
    assert_not_nil assigns(:banks)
    assert_not_nil assigns(:ledger_categories)
    assert assigns(:hide_sign)
    assert_response :success
    assert_template 'shared_payments/_payment_details'
  end

  def test_payment_details_without_payment_method
    invoice = create_invoice
    get :payment_details, :payment_method => nil, :id => invoice

    assert_response :success
    assert_template nil
  end

  def test_payment_details_of_money_payment_method
    invoice = create_invoice
    get :payment_details, :payment_method => Payment::MONEY, :id => invoice

    assert_equal Payment::MONEY, assigns(:ledger).payment_method
    assert_response :success
    assert_template 'shared_payments/_payment_details'
  end

  def test_payment_details_of_check_payment_method
    invoice = create_invoice
    get :payment_details, :payment_method => Payment::CHECK, :id => invoice

    assert_equal Payment::CHECK, assigns(:ledger).payment_method
    assert_response :success
    assert_template 'shared_payments/_payment_details'
  end

  def test_payment_details_of_debit_card_payment_method
    invoice = create_invoice
    get :payment_details, :payment_method => Payment::DEBIT_CARD, :id => invoice

    assert_equal Payment::DEBIT_CARD, assigns(:ledger).payment_method
    assert_response :success
    assert_template 'shared_payments/_payment_details'
  end

  def test_payment_details_of_credit_card_payment_method
    invoice = create_invoice
    get :payment_details, :payment_method => Payment::CREDIT_CARD, :id => invoice

    assert_equal Payment::CREDIT_CARD, assigns(:ledger).payment_method
    assert_response :success
    assert_template 'shared_payments/_payment_details'
  end

  def test_edit_payment
    invoice = create_invoice
    ledger = create_ledger(:owner => invoice)  
    get :edit_payment, :id => invoice.id, :ledger_id => ledger.id
    
    assert_response :success
    assert_template 'shared_payments/_edit_payment'

    assert assigns(:invoice)
    assert assigns(:ledger)
    assert assigns(:ledgers)
    assert assigns(:banks)
    assert assigns(:ledger_categories)
  end

  def test_update_payment_with_correct_params
    invoice = create_invoice
    ledger = create_ledger(:owner => invoice)  
    get :update_payment, :id => invoice.id, :ledger_id => ledger.id, :ledger => {:value => 323}
    
    assert_response :success
    assert_template 'shared_payments/_new_payment'

    assert assigns(:invoice)
    assert assigns(:ledger)
    assert assigns(:ledgers)
    assert assigns(:banks)
    assert assigns(:ledger_categories)
  end

  def test_add_payment_with_correct_params
    invoice = create_invoice
    get :add_payment, :id => invoice.id, :ledger => {:payment_method => 'money', :category => @ledger_category, :value => 343, :date => Date.today}
    
    assert_response :success
    assert_template 'shared_payments/_new_payment'

    assert assigns(:invoice)
    assert assigns(:ledger)
    assert_equal 0, assigns(:ledger).errors.length
    assert assigns(:ledgers)
    assert assigns(:banks)
    assert assigns(:ledger_categories)
  end

  def test_add_payment_with_wrong_params
    invoice = create_invoice
    # The date must be valid will hapen 1 (one) error
    get :add_payment, :id => invoice.id, :ledger => {:payment_method => 'money', :category => @ledger_category, :value => 343, :date => nil}
    
    assert_response :success
    assert_template 'shared_payments/_new_payment'

    assert assigns(:invoice)
    assert assigns(:ledger)
    assert_equal 1, assigns(:ledger).errors.length
    assert assigns(:ledgers)
    assert assigns(:banks)
    assert assigns(:ledger_categories)
  end

end
