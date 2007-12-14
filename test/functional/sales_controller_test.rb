require File.dirname(__FILE__) + '/../test_helper'
require 'sales_controller'

# Re-raise errors caught by the controller.
class SalesController; def rescue_action(e) raise e end; end

class SalesControllerTest < Test::Unit::TestCase
  def setup
    @controller = SalesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
