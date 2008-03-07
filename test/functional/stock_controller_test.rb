require File.dirname(__FILE__) + '/../test_helper'
require 'stock_controller'
require File.dirname(__FILE__) + '/invoice_payment_test'


# Re-raise errors caught by the controller.
class StockController; def rescue_action(e) raise e end; end

class StockControllerTest < Test::Unit::TestCase

  under_organization :some
 
  ########################################################
  #  Test Invoice Payment Module On Stock Controller
  ########################################################
  include InvoicePaymentTest

  def setup
    @controller = StockController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as("quentin")
    @organization = create_organization(:identifier => 'some')
    @bank_account = create_bank_account
    @product = create_product()
    @supplier = create_supplier
    @ledger_category = create_ledger_category(:organization => @organization)
    @product_category ||= create_product_category(:organization => @organization)
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

  def test_new_with_produt_id_params
    get :new, :product_id => @product.id
    assert_response :redirect
    assert_redirected_to :action => 'add'
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
    stock = create_stock_in(:invoice => invoice)
    get :edit, :invoice_id => invoice.id, :stock_id => stock.id

    assert_response :success
    assert_template 'edit'

    assert assigns(:invoice)
    assert assigns(:stock)
    assert assigns(:suppliers)
    assert assigns(:ledgers)
    assert assigns(:ledger)
  end

  def test_update_successfully
    invoice = create_invoice(:organization => @organization)
    stock = create_stock_in(:invoice => invoice)
    get :update, :invoice_id => invoice.id, :stock_id => stock.id, :invoice => {:number => '32'}, :stock => {:amount => 12}

    assert_response :redirect
    assert_redirected_to :action => 'history'
    assert assigns(:invoice)
    assert assigns(:stock)
  end

  def test_update_unsuccessfully
    invoice = create_invoice
    stock = create_stock_in(:invoice => invoice)
    get :update, :invoice_id => invoice.id, :stock_id => stock.id, :invoice => {:number => '32'}, :stock => {:amount => nil}

    assert_response :success
    assert_template 'edit'
    assert assigns(:invoice)
    assert assigns(:stock)
    assert assigns(:ledger)
    assert assigns(:ledgers)
    assert assigns(:ledger_categories)
    assert assigns(:banks)
    assert assigns(:suppliers)
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
end
