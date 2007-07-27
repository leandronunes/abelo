require File.dirname(__FILE__) + '/../test_helper'
require 'permissions_controller'

# Re-raise errors caught by the controller.
class PermissionsController; def rescue_action(e) raise e end; end

class PermissionsControllerTest < Test::Unit::TestCase

  include TestingUnderOrganization
  fixtures :organizations

  def setup
    @controller = PermissionsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization_nickname = 'one'
    login_as('quentin')
  end

  def test_index
    get :index
    assert_not_nil assigns(:profiles)
    assert_kind_of Array, assigns(:profiles)
    assert_template 'index'
  end

  def test_select_template
    get :select_template, :id => 3
    assert_not_nil assigns(:user_profile)
    assert_kind_of Profile, assigns(:user_profile)
    assert_response :success
    assert_template 'select_template'
  end

  def test_update_template_success
    post :update_template, :id => 3, :user_profile => { :template => 'read_only' }
    assert_response :redirect
    assert_redirected_to :action => 'index'
    assert_equal 'read_only', Profile.find(3).template
    post :update_template, :id => 3, :user_profile => { :template => 'full_access' }
    assert_response :redirect
    assert_redirected_to :action => 'index'
    assert_equal 'full_access', Profile.find(3).template
  end

  def test_new_with_template
    get :new_with_template
    assert_response :success
    assert_template 'new_with_template'
    assert_not_nil assigns(:user_profile)
    assert_kind_of Profile, assigns(:user_profile)
  end

  def test_create_with_template_failed
    post :create_with_template, :user_profile => { }
    assert_response :success
    assert_template 'new_with_template'
  end

  def test_create_with_template
    count = Profile.count
    post :create_with_template, :id => 3, :user_profile => { :user_id => 4, :template => 'full_access' }
    assert_response :redirect
    assert_redirected_to :action => 'index'
    assert_equal count + 1, Profile.count
  end

  def test_destroy
    count = Profile.count
    assert count > 0
    post :destroy, :id => 3
    assert_raise(ActiveRecord::RecordNotFound) do
      Profile.find(3)
    end
    assert_equal count - 1, Profile.count
  end

end
