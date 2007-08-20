require File.dirname(__FILE__) + '/../test_helper'
require 'bank_accounts_controller'

# Re-raise errors caught by the controller.
class BankAccountsController; def rescue_action(e) raise e end; end

class BankAccountsControllerTest < Test::Unit::TestCase
  fixtures :bank_accounts

  def setup
    @controller = BankAccountsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = bank_accounts(:first).id
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

    assert_not_nil assigns(:bank_accounts)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:bank_account)
    assert assigns(:bank_account).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:bank_account)
  end

  def test_create
    num_bank_accounts = BankAccount.count

    post :create, :bank_account => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_bank_accounts + 1, BankAccount.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:bank_account)
    assert assigns(:bank_account).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      BankAccount.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      BankAccount.find(@first_id)
    }
  end
end
