require File.dirname(__FILE__) + '/../test_helper'
require 'tracker_organization_controller'

# Re-raise errors caught by the controller.
class TrackerOrganizationController; def rescue_action(e) raise e end; end

class TrackerOrganizationControllerTest < ActionController::TestCase

  under_organization :one

  def setup
    User.delete_all
    @user = create_user(:login => 'admin', :administrator => true)
    login_as("admin")
    @organization = create_organization(:identifier => 'one')
    @environment = create_environment(:is_default => true)
  end

  def test_setup
    assert @organization.valid?
  end
#FIXME Correct this test
#  def test_only_who_is_from_the_organization_has_access
#    login_as('aaron')
#    assert_raise(RuntimeError){get :index}
#    assert_raise(RuntimeError){get :list}
#    assert_raise(RuntimeError){get :draw}
#  end
#
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
