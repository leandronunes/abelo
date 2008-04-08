require File.dirname(__FILE__) + '/../test_helper'
require 'tracker_organization_controller'

# Re-raise errors caught by the controller.
class TrackerOrganizationController; def rescue_action(e) raise e end; end

class TrackerOrganizationControllerTest < Test::Unit::TestCase

  under_organization :some

  def setup
    Organization.destroy_all
    @controller = TrackerOrganizationController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as("quentin")
    @organization = create_organization(:identifier => 'some')
  end

  def test_setup
    assert @organization.valid?
  end

  def test_only_who_is_from_the_organization_has_access
    login_as('aaron')
    assert_raise(RuntimeError){get :index}
    assert_raise(RuntimeError){get :list}
    assert_raise(RuntimeError){get :draw}
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list' 
  end

  def test_list
    get :list
    assert_not_nil assigns(:tracker)
    assert_response :success
    assert_template 'list'
  end

  def test_draw  
    get :draw
    assert_response :success  
  end
end
