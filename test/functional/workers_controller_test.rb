require File.dirname(__FILE__) + '/../test_helper'
require 'workers_controller'

# Re-raise errors caught by the controller.
class WorkersController; def rescue_action(e) raise e end; end

class WorkersControllerTest < Test::Unit::TestCase
  fixtures :workers

  include TestingUnderOrganization

  def setup
    @controller = WorkersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization_nickname = 'one'
    login_as('quentin')
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

    assert_not_nil assigns(:workers)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:worker)
    assert assigns(:worker).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:worker)
  end

  def test_create
    num_workers = Worker.count

    post :create, :worker => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_workers + 1, Worker.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:worker)
    assert assigns(:worker).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil Worker.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Worker.find(1)
    }
  end
end
