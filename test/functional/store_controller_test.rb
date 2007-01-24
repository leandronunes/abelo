require File.dirname(__FILE__) + '/../test_helper'
require 'store_controller'

# Re-raise errors caught by the controller.
class StoreController; def rescue_action(e) raise e end; end

class StoreControllerTest < Test::Unit::TestCase

  include TestingUnderOrganization

  def setup
    @controller = StoreController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization_nickname = 'one'
    login_as("quentin")
  end

  # Replace this with your real tests.
  def test_index
    get :index
    assert_not_nil assigns(:categories)
    assert_template 'index'
  end

  def test_category
    get :category, :id => 1
    assert_template 'category'
    assert_not_nil assigns(:category)
    assert_kind_of ProductCategory, assigns(:category)
    assert_not_nil assigns(:sub_categories)
    assert_kind_of Array, assigns(:category)
  end

  def test_product
    get :product, :id => 1
    assert_template 'product'
    assert_not_nil assigns(:product)
    assert_kind_of Product, assigns(:product)
    assert_not_nil assigns(:category)
    assert_kind_of ProductCategory, assigns(:category)
  end

end
