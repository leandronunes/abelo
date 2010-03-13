require File.dirname(__FILE__) + '/../test_helper'
require 'ledgers_controller'

# Re-raise errors caught by the controller.
class LedgersController; def rescue_action(e) raise e end; end

class LedgersControllerTest < ActionController::TestCase
 
  include Status

  under_organization :one

  def setup
    @user = create_user(:login => 'admin', :administrator => true)
    login_as("admin")
    @organization =  create_organization
    @environment = create_environment(:is_default => true)
    @ledger_category = create_ledger_category(:name => 'Some Category', :type_of => 'I', :organization => @organization , :payment_methods => ['money'])
    @bank = create_bank
    @another_bank_account = create_bank_account
    @default_bank_account = create_bank_account(:is_default => true, :bank => @another_bank_account.bank)
  end

  def test_setup
    assert @another_bank_account.valid?
    assert @default_bank_account.valid?
    assert @default_bank_account.is_default
    assert @organization.valid?
    assert @organization.bank_accounts.include?(@default_bank_account)
    assert @organization.bank_accounts.include?(@another_bank_account)
    assert_equal 'one', @organization.identifier
  end

  def test_index
    get :index
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_object_needed_by_view_list_are_instanciated
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:ledgers)
    assert_not_nil assigns(:tags)
    assert_not_nil assigns(:chosen_accounts)
    assert_not_nil assigns(:chosen_categories)
    assert_not_nil assigns(:chosen_tags)
    assert_not_nil assigns(:bank_accounts)
    assert_not_nil assigns(:ledger_categories)
    assert_not_nil assigns(:tags)
    assert_not_nil assigns(:total_income)
    assert_not_nil assigns(:total_expense)
    assert_not_nil assigns(:geral_total_income)
    assert_not_nil assigns(:geral_total_expense)
  end

  def test_list_with_default_bank_account
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_equal [@another_bank_account], assigns(:chosen_accounts)
    assert_equal [assigns(:organization).default_bank_account], assigns(:chosen_accounts)
  end

  def test_list_without_default_bank_account
    get :list, :accounts => @another_bank_account.id

    assert_response :success
    assert_template 'list'

    assert_equal [@another_bank_account], assigns(:chosen_accounts)
  end


  def test_list_when_query_param_is_nil
    get :list

    assert_response :success
    assert_template 'list'

  end

  def test_list_when_query_param_not_nil
    Ledger.destroy_all
    create_money(:value => 34, :description => 'Some Description')
    create_money(:value => 50, :description => 'Another Some Description')
    assert_equal 2, Ledger.count 
    get :list, :ledger => {:description => 'Another'}

    assert_response :success
    assert_template 'list'
    assert_equal 1, assigns(:ledgers).length
  end


  def test_list_when_query_param_not_nil_again
    Ledger.destroy_all
    create_money(:value => 34, :description => 'Some Description')
    create_money(:value => 50, :description => 'Another Some Description')
    assert_equal 2, Ledger.count 
    get :list, :ledger => {:description => '*Description'}

    assert_response :success
    assert_template 'list'

    assert_equal 2, assigns(:ledgers).length
  end

  def test_display_table_with_default_bank_account
    post :display_financial_table, :accounts => @default_bank_account.id

    assert_response :success
    assert_template '_display_financial_table'
    
    assert_not_nil assigns(:chosen_accounts)
    assert_not_nil assigns(:chosen_categories)
    assert_not_nil assigns(:chosen_tags)
    assert_not_nil assigns(:bank_accounts)
    assert_not_nil assigns(:ledger_categories)
    assert_not_nil assigns(:tags)
    assert_not_nil assigns(:ledgers)
    assert_not_nil assigns(:total_income)
    assert_not_nil assigns(:total_expense)
    assert_not_nil assigns(:geral_total_income)
    assert_not_nil assigns(:geral_total_expense)
    assert_equal [assigns(:organization).default_bank_account], assigns(:chosen_accounts)
  end

  def test_display_table_without_default_bank_account
    post :display_financial_table, :accounts => @another_bank_account.id

    assert_response :success
    assert_template '_display_financial_table'

    assert_not_nil assigns(:chosen_accounts)
    assert_not_nil assigns(:chosen_categories)
    assert_not_nil assigns(:chosen_tags)
    assert_not_nil assigns(:bank_accounts)
    assert_not_nil assigns(:ledger_categories)
    assert_not_nil assigns(:tags)
    assert_not_nil assigns(:ledgers)
    assert_not_nil assigns(:total_income)
    assert_not_nil assigns(:total_expense)
    assert_not_nil assigns(:geral_total_income)
    assert_not_nil assigns(:geral_total_expense)
    assert_equal [@another_bank_account], assigns(:chosen_accounts)
  end

  def test_show
    @ledger = create_ledger
    get :show, :id => @ledger.id
    assert_response :success
    assert_template 'show'
    assert_not_nil assigns(:ledger)
    assert_not_nil assigns(:bank_accounts)
    assert_not_nil assigns(:ledger_categories)
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:ledger)
    assert_not_nil assigns(:ledger_categories)
    assert_not_nil assigns(:bank_accounts)
  end

  def test_create_successfully
    post :create, :ledger => {:description => 'Something', :category => @ledger_category, :value => '3', :date => Time.now, :bank_account => @another_bank_account, :payment_method => Payment::MONEY}

    assert_not_nil assigns(:ledger)
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_create_unsuccessfully
    #Don't pass the param date needed 
    post :create, :ledger => {:description => 'Something', :category_id => @ledger_category.id, :value => '3'}

    assert_not_nil assigns(:ledger)
    assert_not_nil assigns(:ledger_categories)
    assert_not_nil assigns(:periodicities)
    assert_not_nil assigns(:bank_accounts)
    assert_response :success
    assert_template 'new'
  end


  def test_edit_with_an_existing_ledger
    l = create_ledger
    assert l.valid?
    get :edit, :id => l.id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:ledger)
    assert_not_nil assigns(:ledger_categories)
    assert_not_nil assigns(:bank_accounts)
  end

#TODO put this test to works
#  def test_edit_without_an_existing_ledger
#    unexisting_ledger_id = 1000
#    assert_raise(ActiveRecord::RecordNotFound){Ledger.find(unexisting_ledger_id)}
#    get :edit, :id => unexisting_ledger_id
#
#    assert_response :success
#    assert_template 'shared/error'
#  end


  def test_update_successfully
    l = create_ledger
    assert l.valid?
    post :update, :id => l.id, :ledger => {:description => 'Something', :category_id => @ledger_category.id, :value => '3', :date => Time.now}

    assert_not_nil assigns(:ledger)
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_update_with_repeat_ledger_defined
    l = create_ledger
    post :update, :id => l.id, :ledger => {:schedule_repeat => true}

    assert_not_nil assigns(:ledger)
    assert_equal 3, assigns(:ledger).ledgers_scheduled.count
  end

  def test_update_unsuccessfully
    # Pass not category
    l = create_ledger
    assert l.valid?
    post :update, :id => l.id, :ledger => {:description => 'Something', :category_id => nil}

    assert_not_nil assigns(:ledger)
    assert_not_nil assigns(:ledger_categories)
    assert_not_nil assigns(:bank_accounts)
    assert_not_nil assigns(:periodicities)
    assert_response :success
    assert_template 'edit'
  end

  def test_update_description
    value = "another description"
    l = create_ledger
    assert l.valid?
    assert_not_equal value, l.description
    post :update, :id => l.id, :ledger => {:description => value}

    assert_equal value, assigns(:ledger).description
  end

  def test_update_category
    value = create_ledger_category
    l = create_ledger
    assert l.valid?
    assert_not_equal value.id, l.category.id
    post :update, :id => l.id, :ledger => {:category_id => value.id}

    assert_equal value.id, assigns(:ledger).category.id
  end

  def test_update_value
    value = '10,2'
    l = create_ledger
    assert l.valid?
    assert_not_equal value, l.value
    post :update, :id => l.id, :ledger => {:value => value}

    assert_equal '10.2', assigns(:ledger).value.to_s
  end

  def test_update_date
    value = Date.today - 4
    l = create_ledger
    assert l.valid?
    assert_not_equal value, l.date
    post :update, :id => l.id, :ledger => { :date => value}

    assert_equal value, assigns(:ledger).date
  end


  def test_update_interests_days
    value = 30
    l = create_ledger
    assert l.valid?
    assert_not_equal value, l.interests_days
    post :update, :id => l.id, :ledger => { :interests_days => value}

    assert_equal value, assigns(:ledger).interests_days
  end

  def test_update_parcel_number
    value = 4
    l = create_ledger
    assert l.valid?
    assert_not_equal value, l.parcel_number
    post :update, :id => l.id, :ledger => { :parcel_number => value}

    assert_equal value, assigns(:ledger).parcel_number
  end

  def test_update_status
    value = 3
    l = create_ledger
    assert l.valid?
    assert_not_equal value, l.status
    post :update, :id => l.id, :ledger => { :status => value}

    assert_equal value, assigns(:ledger).status
  end

  def test_update_number_of_parcels
    value =  5
    l = create_ledger
    assert l.valid?
    assert_not_equal value, l.number_of_parcels
    post :update, :id => l.id, :ledger => { :number_of_parcels => value}

    assert_equal value, assigns(:ledger).number_of_parcels
  end

  def test_update_operational
    value = true
    l = create_ledger
    assert l.valid?
    assert_not_equal value, l.operational
    post :update, :id => l.id, :ledger => { :operational => value}

    assert_equal value, assigns(:ledger).operational
  end

  def test_update_interests
    value = 2.3
    l = create_ledger
    assert l.valid?
    assert_not_equal value, l.interests
    post :update, :id => l.id, :ledger => { :interests => value}

    assert_equal value, assigns(:ledger).interests
  end

  def test_update_wihout_a_valid_ledger
    unexisting_ledger_id = 1000
    assert_raise(ActiveRecord::RecordNotFound){Ledger.find(unexisting_ledger_id)}
    assert_raise(ActiveRecord::RecordNotFound){ post :update, :id => unexisting_ledger_id}
  end


  def test_destroy_of_an_existing_ledger
    l = create_ledger
    assert l.valid?
   
    post :destroy, :id => l.id
    assert_response :success
    assert assigns(:chosen_accounts)
    assert assigns(:bank_accounts)
    assert assigns(:ledger_categories)
    assert assigns(:tags)
    assert assigns(:ledgers)
       
    assert_raise(ActiveRecord::RecordNotFound) {
      Ledger.find(l.id)
    }
  end

  def test_select_category
    get :select_category, :payment_method => 'money'

    assert_not_nil assigns(:ledger)
    assert_not_nil assigns(:banks)
    assert_not_nil assigns(:ledger_categories)
    assert_response :success
    assert_template 'shared_payments/_select_category'
  end

  def test_select_category_without_payment_method
    get :select_category, :payment_method => nil

    assert_response :success
    assert_template nil
  end


  def test_select_category_of_money_payment_method
    get :select_category, :payment_method => 'money'

    assert_equal Payment::MONEY, assigns(:ledger).payment_method
    assert_response :success
    assert_template 'shared_payments/_select_category'
  end

  def test_select_category_of_check_payment_method
    get :select_category, :payment_method => 'check'

    assert_equal Payment::CHECK, assigns(:ledger).payment_method
    assert_response :success
    assert_template 'shared_payments/_select_category'
  end

  def test_select_category_of_debit_card_payment_method
    get :select_category, :payment_method => 'debit_card'

    assert_equal Payment::DEBIT_CARD, assigns(:ledger).payment_method
    assert_response :success
    assert_template 'shared_payments/_select_category'
  end

  def test_select_category_of_credit_card_payment_method
    get :select_category, :payment_method => 'credit_card'

    assert_equal Payment::CREDIT_CARD, assigns(:ledger).payment_method
    assert_response :success
    assert_template 'shared_payments/_select_category'
  end

  def test_action_list_with_ledger_without_category
    Ledger.delete_all
    @ledger = Ledger.new( :organization => @organization, :payment_method => Payment::ADD_CASH, :owner =>  create_till)
    @ledger.date = Date.today
    @ledger.bank_account = @organization.default_bank_account
    @ledger.type_of = Payment::TYPE_OF_INCOME
    @ledger.owner = @organization
    @ledger.value = 10
    @ledger.save!
    get :list
    assert_response :success
    assert_template 'list'
  end

end
