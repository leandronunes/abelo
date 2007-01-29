require File.dirname(__FILE__) + '/../test_helper'
require 'main_controller'

# Re-raise errors caught by the controller.
class MainController; def rescue_action(e) raise e end; end

class MainControllerTest < Test::Unit::TestCase

  include TestingUnderOrganization

  def setup
    @controller = MainController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization_nickname = 'one'
    login_as("quentin")
  end

  # Replace this with your real tests.
  def test_got_organization
    get :index
    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:organization)
    assert_kind_of Array, assigns(:organization)
  end
end
