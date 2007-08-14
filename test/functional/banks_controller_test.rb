require File.dirname(__FILE__) + '/../test_helper'
require 'banks_controller'

# Re-raise errors caught by the controller.
class BanksController; def rescue_action(e) raise e end; end

class BanksControllerTest < Test::Unit::TestCase
  fixtures :banks

  def setup
    @controller = BanksController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = banks(:first).id
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

    assert_not_nil assigns(:banks)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:bank)
    assert assigns(:bank).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:bank)
  end

  def test_create
    num_banks = Bank.count

    post :create, :bank => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_banks + 1, Bank.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:bank)
    assert assigns(:bank).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Bank.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Bank.find(@first_id)
    }
  end
end
