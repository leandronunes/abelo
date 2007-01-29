require File.dirname(__FILE__) + '/../test_helper'
require 'organizations_controller'

# Re-raise errors caught by the controller.
class OrganizationsController; def rescue_action(e) raise e end; end

class OrganizationsControllerTest < Test::Unit::TestCase

  fixtures :organizations
  
  def setup
    @controller = OrganizationsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
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

    assert_not_nil assigns(:organizations)
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:organization)
  end

  def test_create
    num_organizations = Organization.count

    post :create, :organization => {
      :name => 'Organization for testing organizations controller',
      :nickname => 'testing_organizations_controller',
      :cnpj => '78048802000169',
    }

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_organizations + 1, Organization.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:organization)
    assert assigns(:organization).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_destroy
    assert_not_nil Organization.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Organization.find(1)
    }
  end

  def test_uniqueness_of_fields
    num_organizations = Organization.count
    post :create, :organization => {
      :name => 'Organization for testing duplicated fields',
      :nickname => 'testing_duplicated_fields',
      :cnpj => '20419721000148',
    }
    assert_response :redirect
    assert_redirected_to :action => 'list'
    assert_equal num_organizations + 1, Organization.count

    num_organizations = Organization.count

    # testing duplicated name
    post :create, :organization => {
      :name => 'Organization for testing duplicated fields',
      :nickname => 'testing_duplicated_fields_different',
      :cnpj => '54341741000165',
    }
    assert_response :success
    assert_template 'new'
    assert_equal num_organizations, Organization.count

    # testing duplicated nickname
    post :create, :organization => {
      :name => 'Organization for testing duplicated fields, repeated nickname',
      :nickname => 'testing_duplicated_fields',
      :cnpj => '54341741000165',
    }
    assert_response :success
    assert_template 'new'
    assert_equal num_organizations, Organization.count

    # testing duplicated cnpj
    post :create, :organization => {
      :name => 'Organization for testing duplicated fields, repeated cnpj',
      :nickname => 'testing_duplicated_fields_different',
      :cnpj => '20419721000148',
    }
    assert_response :success
    assert_template 'new'
    assert_equal num_organizations, Organization.count


  end

end
