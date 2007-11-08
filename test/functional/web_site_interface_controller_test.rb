require File.dirname(__FILE__) + '/../test_helper'
require 'web_site_interface_controller'

# Re-raise errors caught by the controller.
class WebSiteInterfaceController; def rescue_action(e) raise e end; end

class WebSiteInterfaceControllerTest < Test::Unit::TestCase
  def setup
    @controller = WebSiteInterfaceController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
