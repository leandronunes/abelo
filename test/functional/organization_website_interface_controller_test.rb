require File.dirname(__FILE__) + '/../test_helper'
require 'organization_website_interface_controller'

# Re-raise errors caught by the controller.
class OrganizationWebsiteInterfaceController; def rescue_action(e) raise e end; end

class OrganizationWebsiteInterfaceControllerTest < Test::Unit::TestCase
  def setup
    @controller = OrganizationWebsiteInterfaceController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
