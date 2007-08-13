require File.dirname(__FILE__) + '/../test_helper'
require 'stock_controller'

# Re-raise errors caught by the controller.
class StockController; def rescue_action(e) raise e end; end

class StockControllerTest < Test::Unit::TestCase

  include TestingUnderOrganization

  fixtures :organizations, :products, :stock_entries, :system_actors

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
    assert_not_nil assigns(:products)
  end
#TODO make this test
#  def test_history
#    get :history, :id => 1
#
#    assert_not_nil assigns(:product)
#    assert_equal 1, assigns(:product).id
#
#    assert_not_nil assigns(:entries)
#    assert_kind_of Array, assigns(:entries)
#
#    assert_response 200
#    assert_template 'history'
#  end

  def test_new_entry
    get :new_entry, :id => 1

    assert_not_nil assigns(:product)
    assert_equal 1, assigns(:product).id

    assert_not_nil assigns(:entry)
    assert_kind_of StockEntry, assigns(:entry)
  
    assert_response 200
    assert_template 'new_entry'
  end
#TODO make this test
#  def test_add_entry_ok
#    count = StockIn.count
#
#    post :add_entry, :id => 1, :entry => { :supplier_id => 1, :ammount => 1, :price => 1.99, :purpose => 'sell', :date => '2007-01-01' }
#
#    assert_redirected_to :action => 'history', :id => 1
#    assert_equal count + 1, StockIn.count
#  end

  def test_add_entry_fail
    count = StockIn.count

    post :add_entry, :id => 1, :entry => {  }

    assert_equal count , StockIn.count
    assert_template 'new_entry'
    assert_response 200
  end

end
