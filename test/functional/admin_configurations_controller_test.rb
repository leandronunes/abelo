require File.dirname(__FILE__) + '/../test_helper'
require 'admin_configurations_controller'

# Re-raise errors caught by the controller.
class AdminConfigurationsController; def rescue_action(e) raise e end; end

class AdminConfigurationsControllerTest < Test::Unit::TestCase
  def setup
    @controller = AdminConfigurationsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
