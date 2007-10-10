require File.dirname(__FILE__) + '/../test_helper'
require 'main_controller'

# Re-raise errors caught by the controller.
class MainController; def rescue_action(e) raise e end; end

class MainControllerTest < Test::Unit::TestCase

  fixtures :organizations, :environments, :profiles

  under_organization :one

  def setup
    @controller = MainController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as("quentin")
  end

  # Replace this with your real tests.
  def test_index
    get :index
    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:organization)
    assert_kind_of Organization, assigns(:organization)
  end

#TODO make this test
#  def test_access_between_organizations
#    get :index
#    assert_response :success
#    assert_template 'index'
#    
#    login_as("dani")
#    get :index
#    assert_response :success
#    assert_template 'users/access_denied'
#  end

end
