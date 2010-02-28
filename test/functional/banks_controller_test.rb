require File.dirname(__FILE__) + '/../test_helper'
require 'banks_controller'

# Re-raise errors caught by the controller.
class BanksController; def rescue_action(e) raise e end; end

class BanksControllerTest < ActionController::TestCase

  under_organization :one

  def setup
    User.delete_all
    @user = create_user(:login => 'admin', :administrator => true)
    login_as('admin')
    @organization = create_organization
    @environment = create_environment(:is_default => true)
    @bank = Bank.create!(:name => 'The Name', :code => 'The Code')
  end

  def create_bank(params = {})
    Bank.create!(
      {
        :name => 'Some Name',
        :code => 'Some Code',
        :site => 'Some Site',
      }.merge(params)
      )
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

  def test_autocomplete_bank_name
    Bank.delete_all
    create_bank(:name => 'bank', :code => 'another code')
    create_bank(:name => 'another bank', :code => 'code')
    get :autocomplete_bank_name, :bank => { :name => 'another'}
    assert_not_nil assigns(:banks)
    assert_kind_of Array, assigns(:banks)
    assert_equal 1, assigns(:banks).length
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

  def test_create_wrong_params
    num_banks = Bank.count
    
    post :create, :bank => {}

    assert_response :success
    assert_template 'new'

    assert_equal num_banks, Bank.count   
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

  def test_update_with_wrong_params
    bank = Bank.new
    bank.name = 'Banco do Brasil'
    bank.code = 213324
    assert bank.save

    post :update, :id => bank.id, :bank => {:name => nil, :code => nil}

    assert_response :success
    assert_not_nil assigns(:bank)
    assert_template 'edit'
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
