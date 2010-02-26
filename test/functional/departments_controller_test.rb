require File.dirname(__FILE__) + '/../test_helper'
require 'departments_controller'

# Re-raise errors caught by the controller.
class DepartmentsController; def rescue_action(e) raise e end; end

class DepartmentsControllerTest < ActionController::TestCase

  under_organization :one

#  fixtures :departments, :organizations, :configurations

  def setup
    @user = create_user(:login => 'admin', :administrator => true)
    login_as("admin")
    @organization = Organization.find_by_identifier('one')
    @environment = create_environment(:is_default => true)
  end

  def create_department(params)
    Department.create!(
      { 
        :name => 'test department',
        :organization => @organization,
      }.merge(params)
    )
  end

  def test_autocomplete_department_name
    Department.delete_all
    create_department(:name => 'test department')
    create_department(:name => 'another department')
    get :autocomplete_department_name, :department => { :name => 'test'}
    assert_not_nil assigns(:departments)
    assert_kind_of Array, assigns(:departments)
    assert_equal 1, assigns(:departments).length
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

  def test_list_when_query_param_is_nil
    create_department(:organization => @organization)
    get :list

    assert_nil assigns(:query)
    assert_not_nil assigns(:departments)
    assert_kind_of Array, assigns(:departments)
  end

  def test_list_when_query_param_not_nil
    Department.delete_all
    create_department(:organization => @organization, :name => 'Some Department')
    create_department(:organization => @organization, :name => 'Another Some Department')
    create_department(:organization => @organization, :name => 'Department')
    get :list, :query => 'Another*'

    assert_not_nil assigns(:query)
    assert_not_nil assigns(:departments)
    assert_kind_of Array, assigns(:departments)

    assert_equal 1, assigns(:departments).size

  end

  def test_show
    department = create_department(:organization => @organization)
    get :show, :id => department.id

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
    num_departments = Department.count

    post :create, :department => {}

    assert_response :success
    assert_template  'new'

    assert_equal num_departments, Department.count
  end


  def test_edit
    department = create_department(:organization => @organization)
    get :edit, :id => department.id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:department)
    assert assigns(:department).valid?
  end

  def test_update
    department = create_department(:organization => @organization)
    post :update, :id => department.id
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  #TODO need complement this test 
  def test_update_with_wrong_params
    department = Department.new
    department.name = 'Test Department'
    department.organization_id = 1
    assert department.save

    post :update, :id => department.id , :department => {:name => nil}
    assert_response :success
    assert_not_nil assigns(:department)
    assert_template 'edit'
  end

  def test_destroy
    department = create_department(:organization => @organization)
    department_id = department.id
    assert_not_nil Department.find(department_id)

    post :destroy, :id => department_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Department.find(department_id)
    }
  end

  #######################
  # Permissions tests
  #######################
#  ['index', 'list', 'show', 'autocomplete_name', 'department_tabs', 'new', 'edit', 'create', 'update' ].each do |action|
#    define_method("test_dont_have_permission_on_#{action}") do 
#      RoleAssignment.destroy_all
#      Role.destroy_all
#      r = Role.create!(:name => 'Some', :permissions => ['none'])
#      RoleAssignment.create!(:accessor => @user, :role => r, :resource => @organization)
#   
#      get action.to_sym
#      assert_response :success
#      assert_template 'access_denied.rhtml'
#    end
#  end

end
