require File.dirname(__FILE__) + '/../test_helper'
require 'budgets_controller'

# Re-raise errors caught by the controller.
class BudgetsController; def rescue_action(e) raise e end; end

class BudgetsControllerTest < Test::Unit::TestCase
  fixtures :budgets

  def setup
    @controller = BudgetsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = budgets(:first).id
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

    assert_not_nil assigns(:budgets)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:budget)
    assert assigns(:budget).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:budget)
  end

  def test_create
    num_budgets = Budget.count

    post :create, :budget => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_budgets + 1, Budget.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:budget)
    assert assigns(:budget).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Budget.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Budget.find(@first_id)
    }
  end
end
