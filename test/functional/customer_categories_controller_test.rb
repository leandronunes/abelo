require File.dirname(__FILE__) + '/../test_helper'
require 'categories_controller'

# Re-raise errors caught by the controller.
class CategoriesController; def rescue_action(e) raise e end; end

class CustomerCategoriesControllerTest < Test::Unit::TestCase

  include TestingUnderOrganization

  fixtures :categories, :organizations, :configurations

  def setup
    @controller = CategoriesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization_nickname = 'one'
    @organization = Organization.find_by_identifier 'one'
    @organization.configuration = Configuration.find(1)
    @cust_cat = CustomerCategory.find(:first)
    login_as("quentin")
  end

  def test_index
    get :index
    assert_response :redirect
    assert_redirected_to :action => 'list', :category_type => 'customer'
  end

  def test_autocomplete_name
    CustomerCategory.delete_all
    cust_cat = CustomerCategory.create(:name => 'Category for testing', :organization => @organization)
    get :autocomplete_name, :category => { :name => 'test'}, :category_type => 'customer'
    assert_not_nil assigns(:categories)
    assert_kind_of Array, assigns(:categories)
    assert_equal 1, assigns(:categories).length
  end
 
  def test_list_query_nil
    get :list, :category_type => 'customer'

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:categories)
    assigns(:categories).each do |category|
      assert_kind_of CustomerCategory, category
    end
    assert_not_nil assigns(:category_type)
    assert_equal "customer", assigns(:category_type)
    assert_nil assigns(:query)
  end

  def test_list_query_not_nil
    CustomerCategory.delete_all
    CustomerCategory.create(:name => 'customer testing', :organization => @organization)
    get :list, :category_type => 'customer', :category => {'name' => 'customer*'}
    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:categories)
    assigns(:categories).each do |category|
      assert_kind_of CustomerCategory, category
    end
    assert_not_nil assigns(:category_type)
    assert_equal "customer", assigns(:category_type)
    assert_not_nil assigns(:query)
    assert !assigns(:categories).empty?
  end

  def test_show
    get :show, :id => @cust_cat.id, :category_type => 'customer'
    assert_response :success
    assert_template 'show'
    assert_not_nil assigns(:category)
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

  def test_create_not_save
    post :create, :category_type => 'customer', :category => {}
    assert_response :success
    assert_template 'new'
  end

  def test_edit
    get :edit, :id => @cust_cat.id, :category_type => 'customer'

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:category)
    assert_kind_of CustomerCategory, assigns(:category)
    assert assigns(:category).valid?
  end

  def test_update
    post :update, :id => @cust_cat.id
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_update_fails
    cust_cat = CustomerCategory.new
    cust_cat.name = 'Category for testing'
    cust_cat.organization = @organization
    assert cust_cat.save
    post :update, :id => cust_cat.id, :category => {:name => ''}, :category_type => 'customer'
    assert_response :success
    assert_template 'edit'
  end

  def test_destroy
    category_destroy = @organization.customer_categories.find(:first)
    assert_not_nil category_destroy

    post :destroy, :id => category_destroy.id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      @organization.customer_categories.find(1)
    }
  end
end
