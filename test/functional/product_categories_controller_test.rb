require File.dirname(__FILE__) + '/../test_helper'
require 'categories_controller'

# Re-raise errors caught by the controller.
class CategoriesController; def rescue_action(e) raise e end; end

class ProductCategoriesControllerTest < Test::Unit::TestCase

  include TestingUnderOrganization

  fixtures :categories, :organizations

  def setup
    @controller = CategoriesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization_nickname = 'one'
    @organization = Organization.find_by_nickname 'one'
    login_as("quentin")
  end

  def test_index
    get :index
    assert_response :redirect
    assert_redirected_to :action => 'list', :category_type => 'product'
  end

  def test_list
    get :list, :category_type => 'product'

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:categories)
    assert_not_nil assigns(:category_type)
  end

  def test_new
    get :new, :category_type => 'product'

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:category)
  end

  def test_create_top_level
    num_product_categories = @organization.product_categories.count

    post :create, :category_type => 'product', :category => { :name => 'Top level test category' }

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_product_categories + 1, @organization.product_categories.count
  end

  def test_create_child
    num_product_categories = @organization.product_categories.count

    post :create, :category => { :name => 'Top level test category', :parent_id => 1 }, :category_type => 'product'

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_product_categories + 1, @organization.product_categories.count
  end

  def test_edit
    get :edit, :id => 1, :category_type => 'product'

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:category)
    assert assigns(:category).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'
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
