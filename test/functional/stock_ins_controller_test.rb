require File.dirname(__FILE__) + '/../test_helper'
require 'stock_ins_controller'

# Re-raise errors caught by the controller.
class StockInsController; def rescue_action(e) raise e end; end

class StockInsControllerTest < Test::Unit::TestCase

  under_organization :some
  def setup
    @controller = StockInsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as("quentin")
    @organization = create_organization(:identifier => 'some')
    @bank_account = create_bank_account
    @product = create_product
    @supplier = create_supplier
    @ledger_category = create_ledger_category(:organization => @organization)
    @product_category ||= create_product_category(:organization => @organization)
    @invoice = create_invoice
    @stock_in = create_stock_in
  end

  def test_setup
    assert @product.valid?
    assert @supplier.valid?
    assert @ledger_category.valid?
    assert @organization.valid?
    assert @product_category.valid?
    assert @organization.products.include?(@product)
    assert @organization.suppliers.include?(@supplier)
    assert @invoice.valid?
    assert @stock_in.valid?
  end

  def test_autocomplete_supplier_name
    Supplier.destroy_all
    create_supplier(:name => 'test one', :cpf => '112.767.281-90')
    create_supplier(:name => 'test two', :cpf => '546.261.286-96')
    create_supplier(:name => 'another one', :cpf => '687.618.228-25')
    get :autocomplete_supplier_name, :supplier => {:name => 'test'}
    assert_response :success
    assert_template 'stock_base/autocomplete_supplier_name'
    assert_not_nil assigns(:suppliers)
    assert_kind_of Array, assigns(:suppliers)
    assert_equal 2, assigns(:suppliers).length
  end

  def test_autocomplete_product_name
    Product.destroy_all
    create_product(:name => 'product one')
    create_product(:name => 'product two')
    create_product(:name => 'another')
    get :autocomplete_product_name, :product => {:name => 'product'}
    assert_response :success
    assert_template 'stock_base/autocomplete_product_name'
    assert_not_nil assigns(:products)
    assert_kind_of Array, assigns(:products)
    assert_equal 2, assigns(:products).length
  end

  def test_index
    get :index
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_list
    get :list
    assert_response :success
    assert_template 'stock_base/list'
    assert_not_nil assigns(:stocks)
    assert_not_nil assigns(:title)
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
    create_product(:name => 'product two')
    create_product(:name => 'another')
    get :list, :query => 'product*'

    assert_not_nil assigns(:query)
    assert_not_nil assigns(:stocks)
    assert_kind_of Array, assigns(:stocks)
    assert_not_nil assigns(:stock_pages)
    assert_kind_of ActionController::Pagination::Paginator, assigns(:stock_pages)

    assert_equal 2, assigns(:stocks).length
  end

  def test_new
    get :new
    assert_response :success
    assert_template 'new'
    assert_not_nil assigns(:products)
    assert_not_nil assigns(:title)
    assert_not_nil assigns(:suppliers)
    assert_not_nil assigns(:stock)
  end

  def test_new_with_product_id_param
    get :new, :product_id => @product.id
    assert_response :redirect
    assert_redirected_to :action => 'add'
  end

  def test_add
    get :add, :product_id => @product.id
    assert_response :success
    assert_template 'add'
    assert_not_nil assigns(:stock)
    assert_not_nil assigns(:suppliers)
    assert_equal @product, assigns(:stock).product
  end

  def test_create
    count_stock = StockIn.count

    post :create, :stock => { :product_id => @product.id, :amount => 1, :date => Date.today, :supplier_id => @supplier, :price => 34}

    assert_response :redirect
    assert_redirected_to :action => 'edit'
    assert_equal count_stock + 1, StockIn.count
  end

  def test_create_with_wrong_params_of_add_action
    count_stock = StockIn.count

    # The amount cannot be nil
    post :create, :stock => { :product_id => @product.id, :amount => nil, :date => Date.today}, :product_id => @product.id

    assert_response :success
    assert_template 'add'
    assert_equal count_stock, StockIn.count
  end

  def test_create_with_wrong_parameters
    count_stock = StockIn.count
    # The amount cannot be nil
    post :create, :stock => { :product_id => @product.id, :amount => nil, :date => Date.today}

    assert_response :success
    assert_template 'new'
    assert_not_nil assigns(:stock)
    assert_not_nil assigns(:products)
    assert_not_nil assigns(:suppliers)
    assert_not_nil assigns(:stock).errors
    assert_equal count_stock, StockIn.count
  end

  def test_history
    get :history, :product_id => @product.id
    assert_response :success
    assert_template 'stock_base/history'
    assert_not_nil assigns(:stocks)
    assert_not_nil assigns(:product)
    assert_not_nil assigns(:title)
  end

  def test_destroy
    stock = create_stock_in
    stock_id = stock.id
    get :destroy, :id => stock.id
    assert_raise(ActiveRecord::RecordNotFound) {
      assert StockIn.find(stock_id)
    }

    assert_response :redirect
    assert_redirected_to :action => 'history'
  end

  def test_show
    stock = create_stock_in
    get :show, :id => stock.id
    assert_response :success
    assert_template 'stock_base/show'
    assert_not_nil assigns(:stock)
    assert_not_nil assigns(:title)
  end

  def test_edit
    stock = create_stock_in
    get :edit, :id => stock.id

    assert_response :success
    assert_template 'edit'

    assert assigns(:stock)
    assert assigns(:products)
    assert assigns(:suppliers)
    assert assigns(:payment_object)
    assert assigns(:ledgers)
    assert assigns(:ledger)
    assert assigns(:ledger_categories)
  end

  def test_update
    stock = create_stock_in
    post :update, :id => stock.id, :stock => { :date => Date.today  }

    assert_response :redirect
    assert_redirected_to :action => 'history'
  end

  def test_update_with_wrong_params
    # The date cannot be nil
    stock = create_stock_in
    post :update, :id => stock.id, :stock => { :date => nil }

    assert_response :success
    assert_template 'edit'

    assert assigns(:stock)
    assert assigns(:products)
    assert assigns(:suppliers)
    assert assigns(:payment_object)
    assert assigns(:ledgers)
    assert assigns(:ledger)
    assert assigns(:ledger_categories)
  end

  def test_update_date
    stock = create_stock_in
    stock.date = DateTime.now
    new_date = DateTime.now + 1

    post :update, :id => stock.id, :stock => { :date => new_date }

    assert_equal new_date.to_s, StockIn.find(stock.id).date.to_datetime.to_s
  end

  def test_update_product
    stock = create_stock_in
    stock.product_id = 1
    new_product_id = 2

    post :update, :id => stock.id, :stock => { :product_id => new_product_id }

    assert_equal new_product_id, StockIn.find(stock.id).product_id
  end

  def test_update_supplier_id
    stock = create_stock_in
    stock.supplier_id = 1
    stock.save
    new_supplier_id = 2

    post :update, :id => stock.id, :stock => { :supplier_id => new_supplier_id }

    assert_equal new_supplier_id, StockIn.find(stock.id).supplier_id
  end

  def test_update_amount
    stock = create_stock_in
    stock.amount = 1
    assert stock.save
    new_amount = 34

    post :update, :id => stock.id, :stock => { :amount => new_amount }

    assert_equal new_amount, StockIn.find(stock.id).amount
  end

  ########################################################
  #  Test Invoice Payment Module On StockIn Controller
  ########################################################

  def test_payment_details_without_payment_method_on_new_ledger_action
    stock_in = create_stock_in
    get :payment_details, :payment_method => nil, :id => stock_in, :is_new => 'true'

    assert_response :success
    assert_template 'shared_payments/_ledgers_and_new_on_table'
  end

  def test_payment_details_without_payment_method_on_edit_ledger_action
    stock_in = create_stock_in
    get :payment_details, :payment_method => nil, :id => stock_in, :is_new => false

    assert_response :success
    assert_template 'shared_payments/_ledgers_and_edit_on_table'
  end

  def test_payment_details_of_money_payment_method
    stock_in = create_stock_in
    get :payment_details, :payment_method => Payment::MONEY, :id => stock_in, :is_new => 'true'

    assert_equal Payment::MONEY, assigns(:ledger).payment_method
    assert_response :success
    assert_template 'shared_payments/_ledgers_and_new_on_table'
  end

  def test_payment_details_of_check_payment_method
    stock_in = create_stock_in
    get :payment_details, :payment_method => Payment::CHECK, :id => stock_in, :is_new => 'true'

    assert_equal Payment::CHECK, assigns(:ledger).payment_method
    assert_response :success
    assert_template 'shared_payments/_ledgers_and_new_on_table'
  end

  def test_payment_details_of_debit_card_payment_method
    stock_in = create_stock_in
    get :payment_details, :payment_method => Payment::DEBIT_CARD, :id => stock_in, :is_new => 'true'
  
    assert_equal Payment::DEBIT_CARD, assigns(:ledger).payment_method
    assert_response :success
    assert_template 'shared_payments/_ledgers_and_new_on_table'
  end
    
  def test_payment_details_of_credit_card_payment_method
    stock_in = create_stock_in
    get :payment_details, :payment_method => Payment::CREDIT_CARD, :id => stock_in, :is_new => 'true'
  
    assert_equal Payment::CREDIT_CARD, assigns(:ledger).payment_method
    assert_response :success
    assert_template 'shared_payments/_ledgers_and_new_on_table'
  end

  def test_edit_payment
    stock_in = create_stock_in
    ledger = create_ledger(:owner => stock_in)  
    get :edit_payment, :id => stock_in.id, :ledger_id => ledger.id
    
    assert_response :success
    assert_template 'shared_payments/_edit_payment'
    
    assert assigns(:payment_object)
    assert assigns(:ledger)
    assert assigns(:ledgers)
    assert assigns(:banks)
    assert assigns(:ledger_categories)
  end
  def test_payment_details
     stock_in = create_stock_in
    get :payment_details, :payment_method => 'money', :id => stock_in, :is_new => 'true'

    assert_not_nil assigns(:payment_object)
    assert_not_nil assigns(:ledger)
    assert_not_nil assigns(:ledgers)
    assert_not_nil assigns(:banks)
    assert_not_nil assigns(:ledger_categories)
    assert_response :success
    assert_template 'shared_payments/_ledgers_and_new_on_table'
  end

  def test_update_payment_with_correct_params
    stock_in = create_stock_in
    ledger = create_ledger(:owner => stock_in)
    get :update_payment, :id => stock_in.id, :ledger_id => ledger.id, :ledger => {:value => 323}

    assert_response :success
    assert_template 'shared_payments/_new_payment'

    assert assigns(:payment_object)
    assert assigns(:ledger)
    assert assigns(:ledgers)
    assert assigns(:banks)
    assert assigns(:ledger_categories)
  end

  def test_add_payment_with_correct_params
    stock_in = create_stock_in
    get :add_payment, :id => stock_in.id, :ledger => {:payment_method => 'money', :category => @ledger_category, :value => 343, :date => Date.today}

    assert_response :success
    assert_template 'shared_payments/_new_payment'

    assert assigns(:payment_object)
    assert assigns(:ledger)
    assert_equal 0, assigns(:ledger).errors.length
    assert assigns(:ledgers)
    assert assigns(:banks)
    assert assigns(:ledger_categories)
  end

  def test_add_payment_with_wrong_params
    stock_in = create_stock_in
    # The value coudld not be nil.
    get :add_payment, :id => stock_in.id, :ledger => {:payment_method => 'money', :category => @ledger_category, :value => nil}

    assert_response :success
    assert_template 'shared_payments/_new_payment'

    assert assigns(:payment_object)
    assert assigns(:ledger)
    assert_not_nil assigns(:ledger).errors
    assert assigns(:ledgers)
    assert assigns(:banks)
    assert assigns(:ledger_categories)
  end

end
