require File.dirname(__FILE__) + '/../test_helper'
require 'categories_controller'

# Re-raise errors caught by the controller.
class CategoriesController; def rescue_action(e) raise e end; end

class CategoriesControllerTest < ActionController::TestCase

  under_organization :one

  def setup
    User.delete_all
    @organization = create_organization(:identifier => 'one')
    @environment = create_environment(:is_default => true)
    @user = create_user
    login_as(@user.login)
    @product_category = create_product_category(:organization => @organization)
  end

  def test_index
    get :index
    assert_response :redirect
    assert_redirected_to :action => 'list', :category_type => 'customer'
  end

  def test_autocomplete_category_name
    ProductCategory.delete_all
    cat_prod = ProductCategory.create(:name => 'Category for testing', :organization => @organization)
    get :autocomplete_category_name, :category => { :name => 'test'}, :category_type => 'product'
    assert_not_nil assigns(:categories)
    assert_kind_of Array, assigns(:categories)
    assert_equal 1, assigns(:categories).length
  end
 
  def test_list_query_nil
    get :list, :category_type => 'product'

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:categories)
    assigns(:categories).each do |category|
      assert_kind_of ProductCategory, category
    end
    assert_not_nil assigns(:category_type)
    assert_equal "product", assigns(:category_type)
    assert_nil assigns(:query)
  end

  def test_list_query_not_nil
    get :list, :category_type => 'product', :category => {'name' => 'product*'}
    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:categories)
    assigns(:categories).each do |category|
      assert_kind_of ProductCategory, category
    end
    assert_not_nil assigns(:category_type)
    assert_equal "product", assigns(:category_type)
    assert_not_nil assigns(:query)
    assert !assigns(:categories).empty?
  end

  def test_show
    get :show, :id => @product_category.id, :category_type => 'product'
    assert_response :success
    assert_template 'show'
    assert_not_nil assigns(:category)
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

  def test_create_not_save
    post :create, :category_type => 'product', :category => {}
    assert_response :success
    assert_template 'new'
  end

  def test_edit
    get :edit, :id => @product_category.id, :category_type => 'product'

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:category)
    assert_kind_of ProductCategory, assigns(:category)
    assert assigns(:category).valid?
  end

  def test_update
    post :update, :id => @product_category.id
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_update_fails
    cat_prod = ProductCategory.new
    cat_prod.name = 'Category for testing'
    cat_prod.organization = @organization
    assert cat_prod.save
    post :update, :id => cat_prod.id, :category => {:name => ''}, :category_type => 'product'
    assert_response :success
    assert_template 'edit'
  end

  def test_destroy
    category_destroy = create_product_category(:name => 'another category')
    assert_not_nil category_destroy
    category_destroy_id = category_destroy.id

    post :destroy, :id => category_destroy.id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      @organization.product_categories.find(category_destroy_id)
    }
  end
end
