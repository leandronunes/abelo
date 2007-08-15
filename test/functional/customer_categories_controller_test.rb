require File.dirname(__FILE__) + '/../test_helper'
require 'categories_controller'

# Re-raise errors caught by the controller.
class CategoriesController; def rescue_action(e) raise e end; end

class CustomerCategoriesControllerTest < Test::Unit::TestCase
  
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

  def test_list
    get :list, :category_type => 'customer'

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:categories)
    assigns(:categories).each do |category|
      assert_kind_of CustomerCategory, category
    end
    assert_not_nil assigns(:category_type)
  end

  def test_new
    get :new, :category_type => 'customer'

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:category)
  end

  def test_create_top_level
    num_customer_categories = @organization.customer_categories.count

    post :create, :category_type => 'customer', :category => { :name => 'Top level test category' }

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_customer_categories + 1, @organization.customer_categories.count
  end

  def test_create_child
    num_customer_categories = @organization.customer_categories.count

    post :create, :category => { :name => 'Top level test category', :parent_id => 1 }, :category_type => 'customer'

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_customer_categories + 1, @organization.customer_categories.count
  end

  def test_edit
    customer = @organization.customer_categories.find(:first)
    get :edit, :id => customer.id, :category_type => 'customer'

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:category)
    assert_kind_of CustomerCategory, assigns(:category)
    assert assigns(:category).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_destroy
    customer_destroy = @organization.customer_categories.find(:first)
    assert_not_nil customer_destroy

    post :destroy, :id => customer_destroy.id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      @organization.customer_categories.find(1)
    }
  end
end
