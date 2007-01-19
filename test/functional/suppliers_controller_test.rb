require File.dirname(__FILE__) + '/../test_helper'
require 'suppliers_controller'

# Re-raise errors caught by the controller.
class SuppliersController; def rescue_action(e) raise e end; end

class SuppliersControllerTest < Test::Unit::TestCase

  include TestingUnderOrganization

  fixtures :suppliers

  def setup
    @controller = SuppliersController.new
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

    assert_not_nil assigns(:suppliers)
    assert_kind_of Array, assigns(:suppliers)
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:supplier)
    assert_kind_of Supplier, assigns(:supplier)
    assert_equal @organization, assigns(:supplier).organization
  end

  def test_create
    num_suppliers = Supplier.count

    post :create, :supplier => { :name => 'A supplier for testing the suppliers_controller', :organization_id => 1, :cnpj => '58521833000188' }

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_suppliers + 1, Supplier.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:supplier)
    assert assigns(:supplier).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_destroy
    assert_not_nil Supplier.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Supplier.find(1)
    }
  end
end
