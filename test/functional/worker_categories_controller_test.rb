require File.dirname(__FILE__) + '/../test_helper'
require 'categories_controller'

# Re-raise errors caught by the controller.
class CategoriesController; def rescue_action(e) raise e end; end

class WorkerCategoriesControllerTest < Test::Unit::TestCase

  include TestingUnderOrganization

  fixtures :categories, :organizations, :configurations

  def setup
    @controller = CategoriesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization_nickname = 'one'
    @organization = Organization.find_by_nickname 'one'
    @organization.configuration = Configuration.find(1)
    @worker_cat = WorkerCategory.find(:first)
    login_as("quentin")
  end

  def test_index
    get :index
    assert_response :redirect
    assert_redirected_to :action => 'list', :category_type => 'customer'
  end

  def test_autocomplete_name
    WorkerCategory.delete_all
    worker_cat = WorkerCategory.create(:name => 'Category for testing', :organization => @organization)
    get :autocomplete_name, :category => { :name => 'test'}, :category_type => 'worker'
    assert_not_nil assigns(:categories)
    assert_kind_of Array, assigns(:categories)
    assert_equal 1, assigns(:categories).length
  end
 
  def test_list_query_nil
    get :list, :category_type => 'worker'

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:categories)
    assigns(:categories).each do |category|
      assert_kind_of WorkerCategory, category
    end
    assert_not_nil assigns(:category_type)
    assert_equal "worker", assigns(:category_type)
    assert_nil assigns(:query)
  end

  def test_list_query_not_nil
    get :list, :category_type => 'worker', :category => {'name' => 'worker*'}
    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:categories)
    assigns(:categories).each do |category|
      assert_kind_of WorkerCategory, category
    end
    assert_not_nil assigns(:category_type)
    assert_equal "worker", assigns(:category_type)
    assert_not_nil assigns(:query)
    assert !assigns(:categories).empty?
  end

  def test_list_error
    get :list, :category_type => 'bli', :category => {'name' => 'worker*'}    
    assert_response :success
  end

  def test_show
    get :show, :id => @worker_cat.id, :category_type => 'worker'
    assert_response :success
    assert_template 'show'
    assert_not_nil assigns(:category)
    assert_not_nil assigns(:category_type)
  end

  def test_new
    get :new, :category_type => 'worker'

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:category)
  end

  def test_new_fails
    get :new, :category_type => 'bli'
    assert_response :success
  end
  
  def test_create_top_level
    num_worker_categories = @organization.worker_categories.count

    post :create, :category_type => 'worker', :category => { :name => 'Top level test category' }

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_worker_categories + 1, @organization.worker_categories.count
  end

  def test_create_child
    num_worker_categories = @organization.worker_categories.count

    post :create, :category => { :name => 'Top level test category', :parent_id => 1 }, :category_type => 'worker'

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_worker_categories + 1, @organization.worker_categories.count
  end

  def test_create_not_save
    post :create, :category_type => 'worker', :category => {}
    assert_response :success
    assert_template 'new'
  end

  def test_create_category_not_exist
    post :create, :category_type => 'bli', :category => { :name => 'Top level test category' }
    assert_response :success
  end

  def test_edit
    get :edit, :id => @worker_cat.id, :category_type => 'worker'

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:category)
    assert_kind_of WorkerCategory, assigns(:category)
    assert assigns(:category).valid?
  end

  def test_update
    post :update, :id => @worker_cat.id
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_update_fails
    worker_cat = WorkerCategory.new
    worker_cat.name = 'Category for testing'
    worker_cat.organization = @organization
    assert worker_cat.save
    post :update, :id => worker_cat.id, :category => {:name => ''}, :category_type => 'worker'
    assert_response :success
    assert_template 'edit'
  end

  def test_destroy
    category_destroy = @organization.worker_categories.find(:first)
    assert_not_nil category_destroy

    post :destroy, :id => category_destroy.id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      @organization.worker_categories.find(1)
    }
  end
end
