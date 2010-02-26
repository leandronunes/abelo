require File.dirname(__FILE__) + '/../test_helper'
require 'categories_controller'

# Re-raise errors caught by the controller.
class CategoriesController; def rescue_action(e) raise e end; end

class CategoriesControllerTest < ActionController::TestCase

  under_organization :one

  def setup
    @user = create_user(:login => 'admin', :administrator => true)
    login_as("admin")
    @organization = Organization.find_by_identifier('one')
    @environment = create_environment(:is_default => true)
    @supp_cat = create_supplier_category(:organization => @organization)
  end

  def test_index
    get :index
    assert_response :redirect
    assert_redirected_to :action => 'list', :category_type => 'customer'
  end

  def test_autocomplete_category_name
    SupplierCategory.delete_all
    supp_cat = SupplierCategory.create(:name => 'Category for testing', :organization => @organization)
    get :autocomplete_category_name, :category => { :name => 'test'}, :category_type => 'supplier'
    assert_not_nil assigns(:categories)
    assert_kind_of Array, assigns(:categories)
    assert_equal 1, assigns(:categories).length
  end
 
  def test_list_query_nil
    get :list, :category_type => 'supplier'

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:categories)
    assigns(:categories).each do |category|
      assert_kind_of SupplierCategory, category
    end
    assert_not_nil assigns(:category_type)
    assert_equal "supplier", assigns(:category_type)
    assert_nil assigns(:query)
  end

  def test_list_query_not_nil
    get :list, :category_type => 'supplier', :category => {'name' => 'supplie*'}
    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:categories)
    assigns(:categories).each do |category|
      assert_kind_of SupplierCategory, category
    end
    assert_not_nil assigns(:category_type)
    assert_equal "supplier", assigns(:category_type)
    assert_not_nil assigns(:query)
#    assert !assigns(:categories).empty?
  end

  def test_show
    get :show, :id => @supp_cat.id, :category_type => 'supplier'
    assert_response :success
    assert_template 'show'
    assert_not_nil assigns(:category)
    assert_not_nil assigns(:category_type)
  end

  def test_new
    get :new, :category_type => 'supplier'

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:category)
  end

  def test_create_top_level
    num_supplier_categories = @organization.supplier_categories.count

    post :create, :category_type => 'supplier', :category => { :name => 'Top level test category' }

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_supplier_categories + 1, @organization.supplier_categories.count
  end

  def test_create_child
    num_supplier_categories = @organization.supplier_categories.count

    post :create, :category => { :name => 'Top level test category', :parent_id => 1 }, :category_type => 'supplier'

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_supplier_categories + 1, @organization.supplier_categories.count
  end

  def test_create_not_save
    post :create, :category_type => 'supplier', :category => {}
    assert_response :success
    assert_template 'new'
  end

  def test_edit
    get :edit, :id => @supp_cat.id, :category_type => 'supplier'

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:category)
    assert_kind_of SupplierCategory, assigns(:category)
    assert assigns(:category).valid?
  end

  def test_update
    post :update, :id => @supp_cat.id
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_update_fails
    supp_cat = SupplierCategory.new
    supp_cat.name = 'Category for testing'
    supp_cat.organization = @organization
    assert supp_cat.save
    post :update, :id => supp_cat.id, :category => {:name => ''}, :category_type => 'supplier'
    assert_response :success
    assert_template 'edit'
  end

  def test_destroy
    category_destroy = @organization.supplier_categories.find(:first)
    assert_not_nil category_destroy

    post :destroy, :id => category_destroy.id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      @organization.supplier_categories.find(1)
    }
  end
end
