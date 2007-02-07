require File.dirname(__FILE__) + '/../test_helper'
require 'customer_categories_controller'

# Re-raise errors caught by the controller.
class CustomerCategoriesController; def rescue_action(e) raise e end; end

class CustomerCategoriesControllerTest < Test::Unit::TestCase
  
  include TestingUnderOrganization
  
  fixtures :customer_categories, :organizations

  def setup
    @controller = CustomerCategoriesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization_nickname = 'one'
    @organization = Organization.find_by_nickname 'one'
    login_as("quentin")
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

    assert_not_nil assigns(:customer_categories)
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:customer_category)
  end

  def test_create_top_level
    num_customer_categories = @organization.customer_categories.count

    post :create, :customer_category => { :name => 'Top level test category' }

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_customer_categories + 1, @organization.customer_categories.count
  end

  def test_create_child
    num_customer_categories = @organization.customer_categories.count

    post :create, :customer_category => { :name => 'Top level test category', :parent_id => 1 }

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_customer_categories + 1, @organization.customer_categories.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:customer_category)
    assert assigns(:customer_category).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_destroy
    assert_not_nil @organization.customer_categories.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      @organization.customer_categories.find(1)
    }
  end
end
