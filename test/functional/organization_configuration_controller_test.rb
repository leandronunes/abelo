require File.dirname(__FILE__) + '/../test_helper'
require 'organization_configuration_controller'

# Re-raise errors caught by the controller.
class OrganizationConfigurationController; def rescue_action(e) raise e end; end

class OrganizationConfigurationControllerTest < ActionController::TestCase

  under_organization :one

  def setup
    User.delete_all
    @user = create_user(:login => 'admin', :administrator => true)
    login_as('admin')
    @organization = create_organization(:identifier => 'one')
    @environment = create_environment(:is_default => true)
  end

  # Replace this with your real tests.
  def test_flunk
    flunk "Make these tests"
  end
end
