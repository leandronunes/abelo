require File.dirname(__FILE__) + '/../../test_helper'
require 'reports/budgeted_vs_spent_controller'

# Re-raise errors caught by the controller.
class Reports::BudgetedVsSpentController; def rescue_action(e) raise e end; end

class Reports::BudgetedVsSpentControllerTest < Test::Unit::TestCase
  def setup
    @controller = Reports::BudgetedVsSpentController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
