require File.dirname(__FILE__) + '/../test_helper'
require 'bank_accounts_controller'

# Re-raise errors caught by the controller.
class BankAccountsController; def rescue_action(e) raise e end; end

class BankAccountsControllerTest < Test::Unit::TestCase
  fixtures :bank_accounts, :banks, :configurations, :organizations

  under_organization :one

  def setup
    @controller = BankAccountsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as("quentin")
    @organization = Organization.find_by_identifier('one')
    @bank_account = BankAccount.find(:first)
    @bank = Bank.find(:first)
  end

  def test_setup
    assert @organization.valid?
    assert @bank_account.valid?
    assert @bank.valid?
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

    assert_not_nil assigns(:bank_accounts)
  end

  def test_object_needed_by_view_list_are_instanciated
    get :list

    assert_response :success
    assert_template 'list'

    assert_nil assigns(:query)
    assert_not_nil assigns(:bank_accounts)
    assert_not_nil assigns(:bank_account_pages)
  end

  def test_list_when_query_param_is_nil
    get :list

    assert_response :success
    assert_template 'list'

    assert_equal assigns(:bank_accounts).length, assigns(:organization).bank_accounts.length
  end

  def test_list_when_query_param_not_nil
    BankAccount.delete_all
    b = BankAccount.new(:bank => Bank.find(:first), :owner => @organization, :account => '233222', :agency => '111')
    b.save!
    b = BankAccount.new(:bank => Bank.find(:first), :owner => @organization, :account => '43344', :agency => '333')
    b.save!

    get :list, :query => '*22*'

    assert_response :success
    assert_template 'list'

    assert_equal 1, assigns(:bank_accounts).length


    get :list, :query => '*33*'

    assert_response :success
    assert_template 'list'

    assert_equal 2, assigns(:bank_accounts).length
  end

  def test_show_with_an_existing_bank_account
    bank_account = BankAccount.find(:first)
    get :show, :id => bank_account.id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:bank_account)
    assert assigns(:bank_account).valid?
  end

  def test_show_without_an_unexist_bank_account
    unexisting_ledger_id = 1000
    assert_raise(ActiveRecord::RecordNotFound){BankAccount.find(unexisting_ledger_id)}
    get :show, :id => unexisting_ledger_id

    assert_response :success
    assert_template 'shared/not_found'
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:bank_account)
    assert_not_nil assigns(:banks)
  end

  def test_create_with_correct_params
    num_bank_accounts = BankAccount.count

    post :create, :bank_account => {:bank => @bank, :account => 333, :agency => 234}

    assert_response :redirect
    assert_redirected_to :action => 'list'
    assert_not_nil assigns(:bank_account)   

    assert_equal num_bank_accounts + 1, BankAccount.count
  end

  def test_create_without_correct_params
    num_bank_accounts = BankAccount.count

    # The bank cannot be nil on bank account model
    post :create, :bank_account => {:bank => nil, :account => 333, :agency => 234}

    assert_response :success
    assert_template 'new'
    assert_not_nil assigns(:bank_account)   
    assert_not_nil assigns(:banks)   

    assert_equal num_bank_accounts, BankAccount.count
  end

  def test_edit_with_an_existing_bank_account
    get :edit, :id => @bank_account

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:bank_account)
    assert_not_nil assigns(:banks)
    assert assigns(:bank_account).valid?
  end

  def test_edit_with_an_unexist_bank_account
    unexisting_bank_account_id = 1000
    assert_raise(ActiveRecord::RecordNotFound){BankAccount.find(unexisting_bank_account_id)}
    get :edit, :id => unexisting_bank_account_id

    assert_response :success
    assert_template 'shared/not_found'
  end

  def test_update_with_an_existing_bank_account_and_correct_params
    post :update, :id => @bank_account.id, :bank_account => {:bank => @bank }
    assert_response :redirect
    assert_redirected_to :action => 'list'
    assert_not_nil assigns(:bank_account)
  end

  def test_update_with_an_existing_bank_account_and_wrong_params
    # Tha bank cannot be nil on bank account model
    post :update, :id => @bank_account.id, :bank_account => {:bank => nil }
    assert_response :success
    assert_template 'edit'
    assert_not_nil assigns(:bank_account)
    assert_not_nil assigns(:banks)
  end

  def test_update_with_an_unexist_bank_account
    unexisting_bank_account_id = 1000
    assert_raise(ActiveRecord::RecordNotFound){BankAccount.find(unexisting_bank_account_id)}
    post :update, :id => unexisting_bank_account_id, :bank_account => {:bank => @bank }
    assert_response :success
    assert_template 'shared/not_found'
  end


  def test_destroy_with_an_existing_bank_account
    assert_nothing_raised {
      BankAccount.find(@bank_account)
    }

    post :destroy, :id => @bank_account.id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      BankAccount.find(@bank_account.id)
    }
  end

  def test_destroy_with_an_unexist_bank_account
    unexisting_bank_account_id = 1000
    assert_raise(ActiveRecord::RecordNotFound){BankAccount.find(unexisting_bank_account_id)}

    post :destroy, :id => unexisting_bank_account_id
    assert_response :success
    assert_template 'shared/not_found'

  end
end
