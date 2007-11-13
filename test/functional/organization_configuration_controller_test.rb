require File.dirname(__FILE__) + '/../test_helper'
require 'organization_configuration_controller'

# Re-raise errors caught by the controller.
class OrganizationConfigurationController; def rescue_action(e) raise e end; end

class OrganizationConfigurationControllerTest < Test::Unit::TestCase
  def setup
    @controller = OrganizationConfigurationController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
