require File.dirname(__FILE__) + '/../test_helper'
require 'ledger_categories_controller'

# Re-raise errors caught by the controller.
class LedgerCategoriesController; def rescue_action(e) raise e end; end

class LedgerCategoriesControllerTest < Test::Unit::TestCase

  under_organization :one
  
  fixtures :ledger_categories , :organizations, :configurations

  def setup
    @controller = LedgerCategoriesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization = Organization.find_by_identifier('one')
    @ledger_category = LedgerCategory.find(:first)
    login_as('quentin')
  end

  def test_setup
    assert @ledger_category.valid?
    assert @organization.valid?
  end

  def test_autocomplete
    LedgerCategory.delete_all
    LedgerCategory.create!(:type_of => 'I', :name => 'some  category', :organization => @organization, :payment_methods => ['money'])
    LedgerCategory.create!(:type_of => 'I', :name => 'another category', :organization => @organization, :payment_methods => ['money'])
    post :autocomplete_name, :category => {:name => 'category' }
    assert_not_nil assigns(:categories)
    assert_equal 2, assigns(:categories).length
    assert_response :success
    assert_template 'autocomplete_name'
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

    assert_not_nil assigns(:categories)
    assert_kind_of Array, assigns(:categories)
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:category)
    assert_kind_of LedgerCategory, assigns(:category)
  end

  def test_create_with_correct_params 
    post :create, :category => {:type_of => 'I', :name => 'another category', :payment_methods => ['money']}

    assert_not_nil assigns(:category)
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_create_with_incorrect_params
    #Is expect type_of be different of nil
    post :create, :category => {:type_of => nil, :name => 'another category'}

    assert_not_nil assigns(:category)
    assert_response :success
    assert_template 'new'
  end

  def test_edit
    get :edit, :id => @ledger_category.id

    assert_not_nil assigns(:category)
    assert_response :success
    assert_template 'edit'
  end

  def test_update_with_correct_params
    post :update, :id => @ledger_category.id, :category => {:name => 'some name'}

    assert_not_nil assigns(:category)
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_update_name
    @ledger_category.name = 'One name'
    assert @ledger_category.save
    post :update, :id => @ledger_category.id, :category => {:name => 'some name'}

    assert_equal 'some name', assigns(:category).name
  end

  def test_update_interests
    @ledger_category.interests = 2.3
    assert @ledger_category.save
    post :update, :id => @ledger_category.id, :category => {:interests =>  5.6}

    assert_equal 5.6, assigns(:category).interests
  end

  def test_update_interests_days
    @ledger_category.interests_days = 2
    assert @ledger_category.save
    post :update, :id => @ledger_category.id, :category => {:interests_days => 6}

    assert_equal 6, assigns(:category).interests_days
  end

  def test_update_number_of_parcels
    @ledger_category.number_of_parcels = 5
    assert @ledger_category.save
    post :update, :id => @ledger_category.id, :category => {:number_of_parcels => 7}

    assert_equal 7, assigns(:category).number_of_parcels
  end

  def test_update_is_operational
    @ledger_category.is_operational = false
    assert @ledger_category.save
    post :update, :id => @ledger_category.id, :category => {:is_operational => true}

    assert_equal true, assigns(:category).is_operational
  end
  
  def test_update_is_store
    @ledger_category.is_store = false
    assert @ledger_category.save
    post :update, :id => @ledger_category.id, :category => {:is_store => true }

    assert_equal true , assigns(:category).is_store
  end

  def test_update_type_of
    @ledger_category.type_of = 'I'
    assert @ledger_category.save
    post :update, :id => @ledger_category.id, :category => {:type_of => 'O' }

    assert_equal 'O', assigns(:category).type_of
  end

  def test_update_with_incorrect_params
    post :update, :id => @ledger_category.id, :category => {:name => nil}

    assert_not_nil assigns(:category)
    assert_response :success
    assert_template 'edit'
  end

  def test_destroy_successfully
    get :destroy, :id => @ledger_category.id
    
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_destroy_unsuccessfully
    Ledger.delete_all
    Ledger.create_ledger!(:owner => @organization, :value => 10, :date => Date.today, :category => @ledger_category, :bank_account_id => BankAccount.find(:first), :payment_method => 'money')

    get :destroy, :id => @ledger_category.id

    assert_response :redirect
    assert_redirected_to :action => 'list'
    assert_not_nil flash[:notice]
  end


end
