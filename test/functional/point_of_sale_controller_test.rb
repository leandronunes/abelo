require File.dirname(__FILE__) + '/../test_helper'
require 'point_of_sale_controller'

# Re-raise errors caught by the controller.
class PointOfSaleController; def rescue_action(e) raise e end; end

class PointOfSaleControllerTest < Test::Unit::TestCase

  include TestingUnderOrganization

  def setup
    @controller = PointOfSaleController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization_nickname = 'one'
    login_as('seu_ze')
  end

  # Replace this with your real tests.
  def test_index
    get :index
    assert_response :success
    assert_template 'index'
  end
end
