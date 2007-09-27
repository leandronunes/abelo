require File.dirname(__FILE__) + '/../test_helper'
require 'periodicities_controller'

# Re-raise errors caught by the controller.
class PeriodicitiesController; def rescue_action(e) raise e end; end

class PeriodicitiesControllerTest < Test::Unit::TestCase
  fixtures :periodicities, :configurations, :organizations

  under_organization :one

  def setup
    @controller = PeriodicitiesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization = Organization.find_by_identifier 'one'
    @first_id = periodicities(:one).id
    login_as("quentin")
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

    post :create, :periodicity => {:name => 'CreateP', :number_of_days => '30'}

    assert_redirected_to :action => 'list'
    assert_equal num_periodicities + 1, Periodicity.count
  end

  def test_edit
    Periodicity.delete_all
    Periodicity.create!(:name => 'Month', :number_of_days => '30', :organization_id => @organization  )
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:periodicity)
    assert assigns(:periodicity).valid?
  end

  def test_update
    post :update, :id => 1, :periodicity => {:name => 'Month', :number_of_days => '30', :organization_id => @organization }
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
