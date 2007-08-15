require File.dirname(__FILE__) + '/../test_helper'
require 'point_of_sale_controller'

# Re-raise errors caught by the controller.
class PointOfSaleController; def rescue_action(e) raise e end; end

class PointOfSaleControllerTest < Test::Unit::TestCase

  fixtures :sales, :organizations, :sale_items, :system_actors, :people, :products

  include TestingUnderOrganization

  def setup
    @controller = PointOfSaleController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization_nickname = 'one'
    login_as('seu_ze')
  end

  # Replace this with your real tests.
  def test_index
    get :index
    assert_response :redirect 
    assert_redirected_to :action => 'main'
#TODO complete this test
  end

#TODO make this test
#  def test_new
#    count = Sale.count
#    post :new
#    assert_response :redirect
#    assert Sale.find(:all).last.id > 0
#    assert_redirected_to :action => 'main', :id => Sale.find(:all).last.id
#    assert_equal User.find_by_login('seu_ze'), Sale.find(:all).last.user
#    assert_equal count + 1, Sale.count
#  end

  def test_main
    get :main, :id => 1
    assert_response :success
    assert_template 'main'
    assert_not_nil assigns(:sale)
    assert_kind_of Sale, assigns(:sale)
  end

  def test_set_customer
    assert_nil Sale.find(2).customer
    post :set_customer, :id => 2, :customer_id => 1
    assert_response :success
    assert_equal Customer.find(1), Sale.find(2).customer
  end

  def test_change_customer
    assert_equal Customer.find(1), Sale.find(1).customer
    post :set_customer, :id => 1, :customer_id => 2
    assert_response :success
    assert_equal Customer.find(2), Sale.find(1).customer
  end

  def test_add_item
    count = SaleItem.count
    post :add_item, :id => 1, :product_id => 1, :ammount => 5
    assert_response :success
    assert_equal count + 1, SaleItem.count
  end

  def test_cancel
    post :cancel, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'index'
  end

  def test_close
    get :close, :id => 1
    assert_response :redirect
    assert_not_nil assigns(:sale) 
    assert_redirected_to :action => 'index'
  end

end
