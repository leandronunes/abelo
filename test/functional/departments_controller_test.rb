require File.dirname(__FILE__) + '/../test_helper'
require 'departments_controller'

# Re-raise errors caught by the controller.
class DepartmentsController; def rescue_action(e) raise e end; end

class DepartmentsControllerTest < Test::Unit::TestCase
  fixtures :departments
  under_organization :one

  def setup
    @controller = DepartmentsController.new
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

    assert_not_nil assigns(:departments)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:department)
    assert assigns(:department).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:department)
  end

  def test_create_correct_params
    num_departments = Department.count

    post :create, :department => {:name => 'Another Department', :organization_id => 1 }

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_departments + 1, Department.count
  end

  # The organization id do not exist
  def test_create_wrong_params
    invalid_organization_id = 1000
    assert !(Organization.find_all.collect{|o| o.id}.include? invalid_organization_id)
    num_departments = Department.count

    post :create, :department => {:name => 'Another Department', :organization_id => invalid_organization_id }

    assert_response :success
    assert_template  'new'

    assert_equal num_departments, Department.count
  end


  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:department)
    assert assigns(:department).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil Department.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Department.find(1)
    }
  end
end
