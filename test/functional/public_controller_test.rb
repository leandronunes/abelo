require File.dirname(__FILE__) + '/../test_helper'
require 'public_controller'

# Re-raise errors caught by the controller.
class PublicController; def rescue_action(e) raise e end; end

class PublicControllerTest < Test::Unit::TestCase

  def setup
    @controller = PublicController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @user  = User.find_by_login('quentin')
    login_as('quentin')
  end

  def test_setup
    assert @user.valid?
    assert_equal 'quentin', @user.login
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
