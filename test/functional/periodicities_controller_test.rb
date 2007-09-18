require File.dirname(__FILE__) + '/../test_helper'
require 'periodicities_controller'

# Re-raise errors caught by the controller.
class PeriodicitiesController; def rescue_action(e) raise e end; end

class PeriodicitiesControllerTest < Test::Unit::TestCase
  fixtures :periodicities

  def setup
    @controller = PeriodicitiesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = periodicities(:first).id
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

    assert_not_nil assigns(:periodicities)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:periodicity)
    assert assigns(:periodicity).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:periodicity)
  end

  def test_create
    num_periodicities = Periodicity.count

    post :create, :periodicity => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_periodicities + 1, Periodicity.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:periodicity)
    assert assigns(:periodicity).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Periodicity.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Periodicity.find(@first_id)
    }
  end
end
