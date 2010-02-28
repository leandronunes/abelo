require File.dirname(__FILE__) + '/../test_helper'
require 'public_controller'

# Re-raise errors caught by the controller.
class PublicController; def rescue_action(e) raise e end; end

class PublicControllerTest < ActionController::TestCase

  def setup
    User.delete_all
    @organization = create_organization(:identifier => 'one')
    @environment = create_environment(:is_default => true)
    @user = create_user
    login_as(@user.login)
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'index' 
    count  = @user.organizations.length
    assert_not_nil assigns(:organizations)
    assert_equal count, assigns(:organizations).length
  end

  def test_edit_user
    get :edit_user
    
    assert_response :success
    assert_template 'edit_user'
    assert_not_nil assigns(:user)
    assert_equal @user, assigns(:user)
  end

  def test_update_user_successfully
    post :update_user
    
    assert_response :redirect
    assert_redirected_to :action => 'index'
    assert_not_nil assigns(:user)
    assert_equal @user, assigns(:user)
  end

  def test_update_user_unsuccessfully
    # The loginn is invalid
    post :update_user, :user => {:login => ''}
    
    assert_response :success
    assert_template 'edit_user'
    assert_not_nil assigns(:user)
    assert_equal @user, assigns(:user)
  end

  def test_post_only_on_update_user
    get :update_user
    
    assert_response :redirect
    assert_redirected_to :action => 'index'
  end

end
