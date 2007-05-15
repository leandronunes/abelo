require File.dirname(__FILE__) + '/../test_helper'
require 'cash_flows_controller'

# Re-raise errors caught by the controller.
class CashFlowsController; def rescue_action(e) raise e end; end

class CashFlowsControllerTest < Test::Unit::TestCase
  fixtures :cash_flows

  def setup
    @controller = CashFlowsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:cash_flows)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:cash_flow)
    assert assigns(:cash_flow).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:cash_flow)
  end

  def test_create
    num_cash_flows = CashFlow.count

    post :create, :cash_flow => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_cash_flows + 1, CashFlow.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:cash_flow)
    assert assigns(:cash_flow).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil CashFlow.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      CashFlow.find(1)
    }
  end
end
