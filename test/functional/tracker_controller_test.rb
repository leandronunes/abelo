require File.dirname(__FILE__) + '/../test_helper'
require 'tracker_controller'

# Re-raise errors caught by the controller.
class TrackerController; def rescue_action(e) raise e end; end

class TrackerControllerTest < Test::Unit::TestCase

  under_organization :admin #TODO see the better way to do that. This are admin controllers

  def setup
    @controller = TrackerController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as('admin')
    @organization = create_organization
  end

  def test_setup
    assert @organization.valid?
  end

  def test_only_admin_has_access
    login_as('aaron')
    assert_raise(RuntimeError){get :index}
    assert_raise(RuntimeError){get :show}
    assert_raise(RuntimeError){get :edit}
    assert_raise(RuntimeError){get :update}
  end

  def test_index
    get :index
    assert_response :redirect
    assert_redirected_to :action => 'show'
  end

  def test_show
    get :show, :organization_id => @organization

    assert_not_nil assigns(:tracker)

    assert_response :success
    assert_template 'show'
  end

  def test_edit
    get :edit, :organization_id => @organization

    assert_response :success
    assert_template 'edit'
    assert assigns(:tracker)
  end

  def test_successfully_update
    post :update, :organization_id => @organization, :tracker => {:available_points => 100}

    assert_response :redirect
    assert_redirected_to :action => 'show'
  end

  def test_unsuccessfully_update
    post :update, :organization_id => @organization, :tracker => {:available_points => 'x'}

    assert_response :redirect
    assert_redirected_to :action => 'edit'
  end
  
end
