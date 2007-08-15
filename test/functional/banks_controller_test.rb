require File.dirname(__FILE__) + '/../test_helper'
require 'banks_controller'

# Re-raise errors caught by the controller.
class BanksController; def rescue_action(e) raise e end; end

class BanksControllerTest < Test::Unit::TestCase
  fixtures :banks


  under_organization :admin #TODO see the better way to do that. This are admin controllers

  def setup
    @controller = BanksController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as('admin')
    @bank = Bank.create!(:name => 'The Name', :code => 'The Code')
  end

  def test_index
    get :index
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:banks)
  end

  def test_show
    get :show, :id => @bank.id

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

    post :create, :bank => {:name => 'Another Name', :code => 'Another Code'}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_banks + 1, Bank.count
  end

  def test_edit
    get :edit, :id => @bank.id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:bank)
    assert assigns(:bank).valid?
  end

  def test_update
    post :update, :id => @bank.id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @bank.id
  end

  def test_destroy
    assert_nothing_raised {
      Bank.find(@bank.id)
    }

    post :destroy, :id => @bank.id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Bank.find(@bank.id)
    }
  end
end
