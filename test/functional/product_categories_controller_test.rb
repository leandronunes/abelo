require File.dirname(__FILE__) + '/../test_helper'
require 'product_categories_controller'

# Re-raise errors caught by the controller.
class ProductCategoriesController; def rescue_action(e) raise e end; end

class ProductCategoriesControllerTest < Test::Unit::TestCase

  include TestingUnderOrganization

  fixtures :product_categories

  def setup
    @controller = ProductCategoriesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization_nickname = 'one'
    @organization = Organization.find_by_nickname 'one'
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:product_categories)
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:product_category)
  end

  def test_create_top_level
    num_product_categories = @organization.product_categories.count

    post :create, :product_category => { :name => 'Top level test category' }

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_product_categories + 1, @organization.product_categories.count
  end

  def test_create_child
    num_product_categories = @organization.product_categories.count

    post :create, :product_category => { :name => 'Top level test category', :parent_id => 1 }

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_product_categories + 1, @organization.product_categories.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:product_category)
    assert assigns(:product_category).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil @organization.product_categories.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      @organization.product_categories.find(1)
    }
  end
end
