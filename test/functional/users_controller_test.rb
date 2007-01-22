require File.dirname(__FILE__) + '/../test_helper'
require 'users_controller'

# Re-raise errors caught by the controller.
class UsersController; def rescue_action(e) raise e end; end

class UsersControllerTest < Test::Unit::TestCase

  fixtures :people

  def setup
    @controller = UsersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as("quentin")
  end

  def test_should_login_and_redirect
    post :login, :login => 'quentin', :password => 'test'
    assert session[:user]
    assert_response :redirect
  end

  def test_should_fail_login_and_not_redirect
    post :login, :login => 'quentin', :password => 'bad password'
    assert_nil session[:user]
    assert_response :success
  end

  def test_should_allow_signup
    assert_difference User, :count do
      create_user
      assert_response :redirect
    end
  end

  def test_should_require_login_on_signup
    assert_no_difference User, :count do
      create_user(:login => nil)
      assert assigns(:user).errors.on(:login)
      assert_response :success
    end
  end

  def test_should_require_password_on_signup
    assert_no_difference User, :count do
      create_user(:password => nil)
      assert assigns(:user).errors.on(:password)
      assert_response :success
    end
  end

  def test_should_require_password_confirmation_on_signup
    assert_no_difference User, :count do
      create_user(:password_confirmation => nil)
      assert assigns(:user).errors.on(:password_confirmation)
      assert_response :success
    end
  end

  def test_should_require_email_on_signup
    assert_no_difference User, :count do
      create_user(:email => nil)
      assert assigns(:user).errors.on(:email)
      assert_response :success
    end
  end

  def test_should_logout
    login_as :quentin
    get :logout
    assert_nil session[:user]
    assert_response :redirect
  end

  def test_should_remember_me
    post :login, :login => 'quentin', :password => 'test', :remember_me => "1"
    assert_not_nil @response.cookies["auth_token"]
  end

  def test_should_not_remember_me
    post :login, :login => 'quentin', :password => 'test', :remember_me => "0"
    assert_nil @response.cookies["auth_token"]
  end
  
  def test_should_delete_token_on_logout
    login_as :quentin
    get :logout
    assert_equal @response.cookies["auth_token"], []
  end

  # an administrator must be granted access to the user listing
  def test_index_form_administrator
    login_as :quentin
    get :index
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  # regular users must stay at the index
  def test_index_for_regular_user
    login_as :aaron
    get :index
    assert_template 'index'
  end

  def test_list
    login_as :quentin
    get :list
    assert_response :success
    assert_template 'list'
    assert_not_nil assigns(:users)
    assert_kind_of Array, assigns(:users)
  end

  def test_new
    login_as :quentin
    get :new
    assert_response :success
    assert_template 'new'
    assert_not_nil assigns(:user)
    assert_kind_of User, assigns(:user)
  end

  def test_create
    count = User.count
    login_as :quentin
    post :create, :user => { :login => 'testing_create', :password => 'test', :password_confirmation => 'test', :email => 'testing_create@example.com' }
    assert_response :redirect
    assert_redirected_to :action => 'list'
    assert_equal count + 1, User.count
  end

  def test_edit
    login_as :quentin
    get :edit, :id => 1
    assert_response :success
    assert_template 'edit'
    assert_not_nil assigns(:user)
    assert_kind_of User, assigns(:user)
  end

  def test_update
    login_as :quentin
    post :update, :id => 5, :user => { :login => 'larissa_updated'  } # larissa
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  # only uncomment if your ApplicationController has login_from_cookie as a
  # before_filter
  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
  # def test_should_login_with_cookie
  #   people(:quentin).remember_me
  #   @request.cookies["auth_token"] = cookie_for(:quentin)
  #   get :index
  #   assert @controller.send(:logged_in?)
  # end
  # def test_should_fail_cookie_login
  #   people(:quentin).remember_me
  #   people(:quentin).update_attribute :remember_token_expires_at, 5.minutes.ago.utc
  #   @request.cookies["auth_token"] = cookie_for(:quentin)
  #   get :index
  #   assert !@controller.send(:logged_in?)
  # end

  # def test_should_fail_cookie_login_2
  #   people(:quentin).remember_me
  #   @request.cookies["auth_token"] = auth_token('invalid_auth_token')
  #   get :index
  #   assert !@controller.send(:logged_in?)
  # end

  protected
    def create_user(options = {})
      post :signup, :user => { :login => 'quire', :email => 'quire@example.com', 
        :password => 'quire', :password_confirmation => 'quire' }.merge(options)
    end
    
    def auth_token(token)
      CGI::Cookie.new('name' => 'auth_token', 'value' => token)
    end
    
    def cookie_for(user)
      auth_token people(user).remember_token
    end
end
