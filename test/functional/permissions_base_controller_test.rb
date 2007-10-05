require File.dirname(__FILE__) + '/../test_helper'
require 'permissions_base_controller'

# Re-raise errors caught by the controller.
class PermissionsBaseController; def rescue_action(e) raise e end; end

class PermissionsBaseControllerTest < Test::Unit::TestCase

  def setup
    @controller = PermissionsBaseController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
