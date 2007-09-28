require File.dirname(__FILE__) + '/../test_helper'
require 'stock_controller'

# Re-raise errors caught by the controller.
class StockController; def rescue_action(e) raise e end; end

class StockControllerTest < Test::Unit::TestCase

  fixtures :stocks, :system_actors, :products, :configurations, :system_actors, :ledger_categories, :bank_accounts

  under_organization :one

  def setup
    @controller = StockController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as("quentin")
    @product = Product.find(:first)
    @supplier = Supplier.find(:first)
    @ledger_category = LedgerCategory.find(:first)
  end

  def test_setup
    assert @product.valid?
    assert @supplier.valid?
    assert @ledger_category.valid?
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
    assert_kind_of Array, assigns(:stocks)
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
    Product.create!(:name => 'Some Product', :sell_price => '20', :unit => 'U', :organization_id => 1, :category_id => 1, :code => 1)
    Product.create!(:name => 'Another Product', :sell_price => '25', :unit => 'U', :organization_id => 1, :category_id => 1, :code => 2)
    Product.create!(:name => 'Product Three', :sell_price => '30', :unit => 'U', :organization_id => 1, :category_id => 1, :code => 3)
    get :list, :query => 'Another*'

    assert_not_nil assigns(:query)
    assert_not_nil assigns(:stocks)
    assert_kind_of Array, assigns(:stocks)
    assert_not_nil assigns(:stock_pages)
    assert_kind_of ActionController::Pagination::Paginator, assigns(:stock_pages)

    assert_equal 1, assigns(:stocks).size
  end
  
  def test_history
    get :history, :id => 1

    assert_not_nil assigns(:product)
    assert_equal 1, assigns(:product).id

    assert_not_nil assigns(:entries)
    assert_kind_of Array, assigns(:entries)

    assert_response :success
    assert_template 'history'
  end

  def test_new_with_product_id_parameter
    get :new, :product_id => @product.id

    assert_not_nil assigns(:stock)
    assert_not_nil assigns(:suppliers)
  
    assert_response :success
    assert_template 'new'
  end

  def test_new_without_product_id_parameter
    get :new

    assert_response :redirect
    assert_redirected_to :controller => 'products', :action => 'new'
  end



  def test_create_with_correct_parameters
    count = StockIn.count

    post :create, :product_id => @product.id, :stock => { :supplier => @supplier, :amount => 1, :price => 1.99, :validity => Date.today, :date => Date.today},  :ledger => {:category => @ledger_category, :payment_method => 'money' } 

    assert_response :redirect
    assert_redirected_to :action => 'history'
    assert_equal count + 1, StockIn.count
  end

  def test_create_with_wrong_parameters
    count = StockIn.count

    post :create, :product_id => @product.id

    assert_response :success
    assert_template 'new'
    assert_equal count, StockIn.count
    assert assigns(:ledger)
    assert assigns(:ledger_categories)
    assert assigns(:banks)
    assert assigns(:suppliers)
  end



  def test_create_fail
    count = StockIn.count

    post :create, :id => 1, :stock => {  }

    assert_equal count , StockIn.count
    assert_template 'new'
    assert_response :success
  end

  def test_edit
    get :edit, :id => 1, :product_id => 1
    assert_response :success
    assert_template 'edit' 
  end

  def test_update
    post :update, :product_id => 1, :id => 1, :stock => { :supplier_id => 3, :amount => 1, :price => 1.99, :purpose => 'sell', :date => '2007-01-01' }

    assert_response :redirect
    assert_redirected_to :action => 'history', :id => 1
  end

  def test_update_fails
    stock = StockIn.new
    stock.supplier = Supplier.find(3)
    stock.amount = 1
    stock.price = 2
    stock.purpose = 'sell'
    stock.product = Product.find(1)
    stock.date = '2006-04-01'
    assert stock.save
    post :update, :id => stock.id, :product_id => 1, :stock => {:price => 'bli'}
    assert_not_nil assigns(:stock)
    assert_not_nil assigns(:product)
    assert_template 'edit', :id => 1, :product_id => 1
  end

  def test_destroy
    post :destroy, :id => 1, :product_id => 1
    assert_response :redirect
    assert_redirected_to :action => 'history', :id => 1
  end

end
