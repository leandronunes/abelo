require File.dirname(__FILE__) + '/../test_helper'
require 'stock_controller'

# Re-raise errors caught by the controller.
class StockController; def rescue_action(e) raise e end; end

class StockControllerTest < Test::Unit::TestCase

  include TestingUnderOrganization

  fixtures :organizations, :stock_entries, :system_actors, :products

  def setup
    @controller = StockController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization_nickname = 'one'
    login_as("quentin")
  end

  def test_index
    get :index
    assert_template 'index'
    assert_nil assigns(:search_param)
    assert_not_nil assigns(:products)
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

  def test_new
    get :new, :id => 1

    assert_not_nil assigns(:product)
    assert_equal 1, assigns(:product).id

    assert_not_nil assigns(:entry)
    assert_kind_of StockEntry, assigns(:entry)
  
    assert_response :success
    assert_template 'new'
  end

  def test_create
    count = StockIn.count

    post :create, :id => 1, :entry => { :supplier_id => 3, :ammount => 1, :price => 1.99, :purpose => 'sell', :date => '2007-01-01' }

    assert_redirected_to :action => 'history', :id => 1
    assert_equal count + 1, StockIn.count
  end

  def test_create_fail
    count = StockIn.count

    post :create, :id => 1, :entry => {  }

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
    post :update, :product_id => 1, :id => 1, :entry => { :supplier_id => 3, :ammount => 1, :price => 1.99, :purpose => 'sell', :date => '2007-01-01' }

    assert_response :redirect
    assert_redirected_to :action => 'history', :id => 1
  end

  def test_update_fails
    entry = StockIn.new
    entry.supplier = Supplier.find(3)
    entry.ammount = 1
    entry.price = 2
    entry.purpose = 'sell'
    entry.product = Product.find(1)
    entry.date = '2006-04-01'
    assert entry.save
    post :update, :id => entry.id, :product_id => 1, :entry => {:price => 'bli'}
    assert_not_nil assigns(:entry)
    assert_not_nil assigns(:product)
    assert_template 'edit', :id => 1, :product_id => 1
  end

  def test_destroy
    post :destroy, :id => 1, :product_id => 1
    assert_response :redirect
    assert_redirected_to :action => 'history', :id => 1
  end

end
