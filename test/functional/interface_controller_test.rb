require File.dirname(__FILE__) + '/../test_helper'
require 'interface_controller'

# Re-raise errors caught by the controller.
class InterfaceController; def rescue_action(e) raise e end; end

class InterfaceControllerTest < ActionController::TestCase

  under_organization :one

  def setup
    @user = create_user(:login => 'admin', :administrator => true)
    login_as("admin")
    @organization = Organization.find_by_identifier('one')
    @environment = create_environment(:is_default => true)
  end

  # Replace this with your real tests.
  def test_flunk
    flunk "Make these tests"
  end
end
