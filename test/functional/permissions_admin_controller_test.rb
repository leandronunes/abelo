require File.dirname(__FILE__) + '/../test_helper'
require 'permissions_admin_controller'

# Re-raise errors caught by the controller.
class PermissionsAdminController; def rescue_action(e) raise e end; end

class PermissionsAdminControllerTest < Test::Unit::TestCase

  under_organization :some 

  def setup
    @controller = PermissionsAdminController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @organization = create_organization(:identifier => 'some')
    @user = create_user
    login_as('admin')
  end

  def test_setup
    assert @user.valid?
    assert @organization.users.include?(@user)
  end

  def test_index
    get :index, :organization_id => @organization.id
    assert_response :success
    assert_template 'permissions_base/list'
  end

  def test_list
    get :list, :organization_id => @organization.id

    assert_response :success
    assert_template 'permissions_base/list'

    assert_not_nil assigns(:users)
  end

  def test_list_when_query_param_is_nil
    get :list, :organization_id => @organization.id
    
    assert_nil assigns(:query)
    assert_not_nil assigns(:organization)
    assert_not_nil assigns(:users)
    assert_kind_of Array, assigns(:users)
    assert_not_nil assigns(:user_pages)
    assert_kind_of ActionController::Pagination::Paginator, assigns(:user_pages)
  end

  def test_list_when_query_param_not_nil
    get :list,  :user => {:login => "*"}, :organization_id => @organization.id


    assert_not_nil @organization.users

    assert_not_nil assigns(:query)
    assert_not_nil assigns(:organization)
    assert_not_nil assigns(:users)
    assert_kind_of Array, assigns(:users)
    assert_not_nil assigns(:user_pages)
    assert_kind_of ActionController::Pagination::Paginator, assigns(:user_pages)

    assert !assigns(:users).empty?
  end

  def test_show
    get :show, :id => @user.id, :organization_id => @organization.id

    assert_response :success
    assert_template 'permissions_base/show'

    assert_not_nil assigns(:organization)
    assert_not_nil assigns(:user)
    assert assigns(:user).valid?
  end

  def test_new
    get :new, :organization_id => @organization.id

    assert_response :success
    assert_template 'permissions_base/new'

    assert_not_nil assigns(:user)
  end

  def test_create_correct_params
    num_users = User.count

    post :create, :user => {:login => "josias", :email => "t@example.com", :password => 'test', :password_confirmation => 'test', :template => 'financial'}, :organization_id => @organization.id

    assert_not_nil assigns(:user)
    assert Profile.locations_by_template('financial')
    assert_not_nil assigns(:user).profile_organization
    assert assigns(:user).template_valid

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_users + 1, User.count
  end

  def test_validates_profile_on_create
    post :create, :organization_id => @organization.id

    assert_not_nil assigns(:user)
    assert assigns(:user).validates_profile
  end


  def test_create_wrong_params
    num_user = User.count

    post :create, :user => {}, :organization_id => @organization.id

    assert_response :success
    assert_template 'permissions_base/new'

    assert_equal num_user, User.count
  end

  def test_edit
    get :edit, :id => @user.id, :organization_id => @organization.id

    assert_response :success
    assert_template 'permissions_base/edit'

    assert_not_nil assigns(:organization)
    assert_not_nil assigns(:user)
    assert assigns(:user).valid?
  end

  def test_update
    post :update, :id => @user.id, :user => {:login => 'test', :template => 'financial'}, :organization_id => @organization.id

    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_update_with_wrong_params
    post :update, :id => @user.id, :user => {:login => nil}, :organization_id => @organization.id

    assert_response :success
    assert_template 'permissions_base/edit'
  end

  def test_update_login
    new_login = 'test login'
    assert_not_equal new_login, @user.login
    user_id = @user.id
    post :update, :id => @user.id, :user => {:login => new_login, :template => 'financial'}, :organization_id => @organization.id
   
    assert_equal new_login, User.find(user_id).login
  end

  def test_update_email
    new_email = 'test@test.com'
    assert_not_equal new_email, @user.email
    user_id = @user.id
    post :update, :id => @user.id, :user => {:email => new_email, :template => 'financial'}, :organization_id => @organization.id   
    assert_equal new_email, User.find(user_id).email
  end

  def test_update_template
    new_template = 'financial'
    profile = @user.profile_by_organization(@organization)
    assert_not_equal new_template, profile.template
    profile_id = profile.id
    post :update, :id => @user.id, :user => {:template => new_template}, :organization_id => @organization.id
   
    assert_equal new_template, Profile.find(profile_id).template
  end


  def test_destroy
    count_profile = Profile.count
    count_user = User.count
    num_user_profiles = @user.profiles.length
    user_id = @user.id
    post :destroy, :id => @user.id, :organization_id => @organization.id
    assert_raise(ActiveRecord::RecordNotFound) do
      User.find(user_id)
    end
    assert_equal count_profile - num_user_profiles, Profile.count
    assert_equal count_user - 1, User.count
  end

end
