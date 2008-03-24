require File.dirname(__FILE__) + '/../test_helper'
require 'tracker_controller'

# Re-raise errors caught by the controller.
class TrackerController; def rescue_action(e) raise e end; end

class TrackerControllerTest < Test::Unit::TestCase

  under_organization :admin #TODO see the better way to do that. This are admin controllers

  def setup
    @controller = TrackerController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as('admin')
  end

  def test_truth
    assert true
  end
end
