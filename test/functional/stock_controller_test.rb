require File.dirname(__FILE__) + '/../test_helper'
require 'stock_controller'

# Re-raise errors caught by the controller.
class StockController; def rescue_action(e) raise e end; end

class StockControllerTest < Test::Unit::TestCase

  include TestingUnderOrganization

  def setup
    @controller = StockController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization_nickname = 'one'
  end

  def test_index
    get :index
    assert_template 'index'
    assert_not_nil assigns(:products)
  end
end
