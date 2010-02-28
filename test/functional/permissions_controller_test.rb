require File.dirname(__FILE__) + '/../test_helper'
require 'permissions_controller'

# Re-raise errors caught by the controller.
class PermissionsController; def rescue_action(e) raise e end; end

class PermissionsControllerTest < ActionController::TestCase

  under_organization :one

  def setup
    User.delete_all
    @organization = create_organization(:identifier => 'one')
    @environment = create_environment(:is_default => true)
    @user = create_user
    login_as(@user.login)
  end

  def test_setup
    assert @user.valid?
    assert @organization.users.include?(@user)
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'permissions_base/list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'permissions_base/list'

    assert_not_nil assigns(:users)
  end

  def test_list_when_query_param_is_nil
    get :list

    assert_nil assigns(:query)
    assert_not_nil assigns(:organization)
    assert_not_nil assigns(:users)
    assert_kind_of Array, assigns(:users)
  end

  def test_list_when_query_param_not_nil
    create_user(:login => "zzzzzzzzzzzzz")
    create_user(:login => "jose")
    create_user(:login => "tadeu")
    get :list, :query => '*zzz*'

    assert_not_nil assigns(:query)
    assert_not_nil assigns(:users)
    assert_kind_of Array, assigns(:users)

    assert_equal 1, assigns(:users).size
  end

  def test_show
    get :show, :id => @user.id

    assert_response :success
    assert_template 'permissions_base/show'

    assert_not_nil assigns(:organization)
    assert_not_nil assigns(:user)
    assert assigns(:user).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'permissions_base/new'

    assert_not_nil assigns(:user)
  end

  def test_create_correct_params
    num_users = User.count

    post :create, :user => {:login => "josias", :email => "t@example.com", :password => 'test', :password_confirmation => 'test', :template => 'financial'}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_users + 1, User.count
  end

  def test_validates_profile_on_create
    post :create

    assert_not_nil assigns(:user)
    assert assigns(:user).validates_profile
  end


  def test_create_wrong_params
    num_user = User.count

    post :create, :user => {}

    assert_response :success
    assert_template 'permissions_base/new'

    assert_equal num_user, User.count
  end

  def test_edit
    get :edit, :id => @user.id

    assert_response :success
    assert_template 'permissions_base/edit'

    assert_not_nil assigns(:organization)
    assert_not_nil assigns(:user)
    assert assigns(:user).valid?
  end

  def test_update
    post :update, :id => @user.id, :user => {:login => 'test', :template => 'financial'}

    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_update_with_wrong_params
    post :update, :id => @user.id, :user => {:login => nil}

    assert_response :success
    assert_template 'permissions_base/edit'
  end

  def test_update_login
    new_login = 'test login'
    assert_not_equal new_login, @user.login
    user_id = @user.id
    post :update, :id => @user.id, :user => {:login => new_login, :template => 'financial' }
    
    assert_equal new_login, User.find(user_id).login
  end

  def test_update_email
    new_email = 'test@test.com'
    assert_not_equal new_email, @user.email
    user_id = @user.id
    post :update, :id => @user.id, :user => {:email => new_email, :template => 'financial'}
    
    assert_equal new_email, User.find(user_id).email
  end

  def test_update_template
    new_template = 'financial'
    profile = @user.profile_by_organization(@organization)
    assert_not_equal new_template, profile.template
    profile_id = profile.id
    post :update, :id => @user.id, :user => {:template => new_template}
   
    assert_equal new_template, Profile.find(profile_id).template
  end


  def test_destroy
    count_profile = Profile.count
    count_user = User.count
    num_user_profiles = @user.profiles.length
    user_id = @user.id
    post :destroy, :id => @user.id
    assert_raise(ActiveRecord::RecordNotFound) do
      User.find(user_id)
    end
    assert_equal count_profile - num_user_profiles, Profile.count
    assert_equal count_user - 1, User.count
  end

end
