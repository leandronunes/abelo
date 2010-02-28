require File.dirname(__FILE__) + '/../test_helper'
require 'sales_controller'

# Re-raise errors caught by the controller.
class SalesController; def rescue_action(e) raise e end; end

class SalesControllerTest < ActionController::TestCase

  def setup
    User.delete_all
    @organization = create_organization(:identifier => 'one')
    @environment = create_environment(:is_default => true)
    @user = create_user
    login_as(@user.login)
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
