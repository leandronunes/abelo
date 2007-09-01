require File.dirname(__FILE__) + '/../test_helper'
require 'ledgers_controller'

# Re-raise errors caught by the controller.
class LedgersController; def rescue_action(e) raise e end; end

class LedgersControllerTest < Test::Unit::TestCase
  fixtures :ledgers, :ledger_categories, :configurations, :bank_accounts
 
  under_organization :one

  def setup
    @controller = LedgersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as("quentin")
    @ledger_category = LedgerCategory.create!(:name => 'Some Category', :type_of => 'I', :organization_id => 1 )
    @another_bank_account = BankAccount.find(2)
  end

  def test_setup
    assert @another_bank_account.valid?
  end

  def test_index
    get :index
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_object_needed_by_view_are_instanciated
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:ledgers)
    assert_not_nil assigns(:ledger_pages)
    assert_not_nil assigns(:tags)
    assert_not_nil assigns(:bank_account)
  end

  def test_list_with_default_bank_account
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_equal @another_bank_account, assigns(:bank_account)
    assert_equal assigns(:organization).default_bank_account, assigns(:bank_account)
  end

  def test_list_without_default_bank_account
    get :list, :bank_account => @another_bank_account.id

    assert_response :success
    assert_template 'list'

    assert_equal @another_bank_account, assigns(:bank_account)
  end


  def test_list_when_query_param_is_nil
    get :list

    assert_response :success
    assert_template 'list'

    assert_equal assigns(:ledgers).length, assigns(:organization).ledgers_by_bank_account.length
  end

  def test_list_when_query_param_not_nil
    Ledger.delete_all
    l = CreditLedger.new(:date => Date.today, :value => 34, :description => 'Some Description', :bank_account => @another_bank_account, :category => @ledger_category, :operational => false, :is_foreseen => false)
    l.save!
    l = DebitLedger.new(:date => Date.today, :value => 50, :description => 'Another Some Description', :bank_account => @another_bank_account, :category => @ledger_category, :operational => false, :is_foreseen => false)
    l.save!
    
    get :list, :bank_account => @another_bank_account.id, :ledger => {:description => 'Another'}

    assert_response :success
    assert_template 'list'

    assert_equal 1, assigns(:ledgers).length


    get :list, :bank_account => @another_bank_account.id, :ledger => {:description => 'Description'}

    assert_response :success
    assert_template 'list'

    assert_equal 2, assigns(:ledgers).length
  end

  def test_display_table_with_default_bank_account
    post :display_table

    assert_response :success
    assert_template '_display_table'
    
    assert_not_nil assigns(:bank_account)
    assert_not_nil assigns(:tags)
    assert_not_nil assigns(:ledger_pages)
    assert_not_nil assigns(:ledgers)
    assert_equal assigns(:organization).default_bank_account, assigns(:bank_account)    
  end

  def test_display_table_without_default_bank_account
    post :display_table, :bank_account => @another_bank_account.id

    assert_response :success
    assert_template '_display_table'

    assert_not_nil assigns(:bank_account)
    assert_not_nil assigns(:tags)
    assert_not_nil assigns(:ledger_pages)
    assert_not_nil assigns(:ledgers)
    assert_equal @another_bank_account, assigns(:bank_account)
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:ledger)
    assert_not_nil assigns(:ledger_categories)
    assert_not_nil assigns(:bank_accounts)
  end

  def test_get_periodicity_informations_when_value_param_is_true
    post :get_periodicity_informations, :value => 'true'
   
    assert_response :success
    assert_template '_get_periodicity_informations'

    assert_not_nil assigns(:ledger)
    assert_not_nil assigns(:periodicities)
  end

  def test_get_periodicity_informations_when_value_param_is_different_of_true
    post :get_periodicity_informations
   
    assert_response :success
    assert_template nil

  end


  def test_get_interval_informations_when_value_param_is_true
    post :get_interval_informations, :value => 'true'
   
    assert_response :success
    assert_template '_get_interval_informations'

    assert_not_nil assigns(:ledger)
  end

  def test_get_interval_informations_when_value_param_is_different_of_true
    post :get_interval_informations
   
    assert_response :success
    assert_template nil

  end



  def test_create_successfully
    post :create, :ledger => {:description => 'Something', :category => @ledger_category, :value => '3', :date => Time.now, :bank_account => @another_bank_account}

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


#  def test_edit
#    l = Ledger.find(1)
#    assert l.valid?
#    get :edit, :id => l.id
#
#    assert_response :success
#    assert_template 'edit'
#
#    assert_not_nil assigns(:ledger)
#    assert_not_nil assigns(:ledger_categories)
#    assert_not_nil assigns(:tags)
#    assert_not_nil assigns(:budgets)
#  end
#
#  def test_update_successfully
#    l = Ledger.find(1)
#    assert l.valid?
#    post :update, :id => l.id, :ledger => {:description => 'Something', :category_id => @ledger_category.id, :value => '3', :date => Time.now}
#
#    assert_not_nil assigns(:ledger)
#    assert_response :redirect
#    assert_redirected_to :action => 'list'
#  end
#
#  def test_update_successfully_with_param_value_with_comma
#    l = Ledger.find(1)
#    assert l.valid?
#    post :update, :id => l.id, :ledger => {:description => 'Something', :category_id => @ledger_category.id, :value => '4,3', :date => Time.now}
#
#    assert_not_nil assigns(:ledger)
#    assert_equal 4.3, assigns(:ledger).value 
#  end
#
#  def test_update_unsuccessfully
#    #Pass a worng param to value
#    l = Ledger.find(1)
#    assert l.valid?
#    post :update, :id => l.id, :ledger => {:description => 'Something', :category_id => @ledger_category.id, :value => 'a'}
#
#    assert_not_nil assigns(:ledger)
#    assert_not_nil assigns(:tags)
#    assert_not_nil assigns(:budgets)
#    assert_response :success
#    assert_template 'edit'
#  end
#
#  def test_update_description
#    value = "another description"
#    l = Ledger.find(1)
#    assert l.valid?
#    assert_not_equal value, l.description
#    post :update, :id => l.id, :ledger => {:description => value}
#
#    assert_equal value, assigns(:ledger).description
#  end
#
#  def test_update_category
#    value = @ledger_category
#    l = Ledger.find(1)
#    assert l.valid?
#    assert_not_equal value, l.category
#    post :update, :id => l.id, :ledger => {:category_id => value.id}
#
#    assert_equal value, assigns(:ledger).category
#  end
#
#  def test_update_value
#    value = '10.2'
#    l = Ledger.find(1)
#    assert l.valid?
#    assert_not_equal value, l.value
#    post :update, :id => l.id, :ledger => {:value => value}
#
#    assert_equal value.to_s, assigns(:ledger).value.to_s
#  end
#
#  def test_update_date
#    value = Date.today - 4
#    l = Ledger.find(1)
#    assert l.valid?
#    assert_not_equal value, l.date
#    post :update, :id => l.id, :ledger => { :date => value}
#
#    assert_equal value, assigns(:ledger).date
#  end
#
#
#  def test_update_interests_days
#    value = 30
#    l = Ledger.find(1)
#    assert l.valid?
#    assert_not_equal value, l.interests_days
#    post :update, :id => l.id, :ledger => { :interests_days => value}
#
#    assert_equal value, assigns(:ledger).interests_days
#  end
#
#  def test_update_parcel_number
#    value = 4
#    l = Ledger.find(1)
#    assert l.valid?
#    assert_not_equal value, l.parcel_number
#    post :update, :id => l.id, :ledger => { :parcel_number => value}
#
#    assert_equal value, assigns(:ledger).parcel_number
#  end
#
#  def test_update_is_foreseen
#    value = true
#    l = Ledger.find(1)
#    assert l.valid?
#    assert_not_equal value, l.is_foreseen
#    post :update, :id => l.id, :ledger => { :is_foreseen => value}
#
#    assert_equal value, assigns(:ledger).is_foreseen
#  end
#
#  def test_update_number_of_parcels
#    value =  5
#    l = Ledger.find(1)
#    assert l.valid?
#    assert_not_equal value, l.number_of_parcels
#    post :update, :id => l.id, :ledger => { :number_of_parcels => value}
#
#    assert_equal value, assigns(:ledger).number_of_parcels
#  end
#
#  def test_update_operational
#    value = true
#    l = Ledger.find(1)
#    assert l.valid?
#    assert_not_equal value, l.operational
#    post :update, :id => l.id, :ledger => { :operational => value}
#
#    assert_equal value, assigns(:ledger).operational
#  end
#
#  def test_update_organization_id
#    value = Organization.find(2)
#    assert value.valid?
#    l = Ledger.find(1)
#    assert l.valid?
#    assert_not_equal value, l.organization
#    post :update, :id => l.id, :ledger => { :organization_id => value.id}
#
#    assert_equal value, assigns(:ledger).organization
#  end
#
#  def test_update_interests
#    value = 2.3
#    l = Ledger.find(1)
#    assert l.valid?
#    assert_not_equal value, l.interests
#    post :update, :id => l.id, :ledger => { :interests => value}
#
#    assert_equal value, assigns(:ledger).interests
#  end
#
#
#  def test_destroy
#    l = Ledger.find(1)
#    assert l.valid?
#   
#    post :destroy, :id => l.id
#    assert_response :success
#
#    assert_raise(ActiveRecord::RecordNotFound) {
#      Ledger.find(l.id)
#    }
#  end

end
