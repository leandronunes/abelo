require File.dirname(__FILE__) + '/../test_helper'
require 'cash_flows_controller'

# Re-raise errors caught by the controller.
class CashFlowsController; def rescue_action(e) raise e end; end

class CashFlowsControllerTest < Test::Unit::TestCase
  include TestingUnderOrganization

  fixtures :cash_flows

  def setup
    @controller = CashFlowsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization_nickname = 'one'
    @organization = Organization.find_by_nickname 'one'
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

    assert_not_nil assigns(:cash_flows)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:cash_flow)
    assert assigns(:cash_flow).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:cash_flow)
  end

  def test_create
    num_cash_flows = CashFlow.count

    post :create, :cash_flow => {:specification_id => 1, :date => '11-05-2007', :historical_id => 1, :value => 10.0, :organization_id => 1}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_cash_flows + 1, CashFlow.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:cash_flow)
    assert assigns(:cash_flow).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil CashFlow.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      CashFlow.find(1)
    }
  end

  def test_extract_period
    get :extract_period, :option => 'day'
    assert_response :success
    assert_template '_extract_period'
    assert_not_nil assigns(:option)
  end

  def test_generate_extract_fails
    get :generate_extract
    assert_response :success
    assert_template 'generate_extract'
    assert_not_nil assigns(:notice)
  end

  def test_generate_extract_simplified_for_day
    get :generate_extract, :extract => 'simplified', :option => 'day', :date => {:day => '11', :month => '5', :year => '2007'}
    assert_response :success
    assert_template 'generate_extract'
    assert_nil assigns(:notice)
    assert_not_nil assigns(:extract)
    
    assert_not_nil assigns(:operational_entrances)
    assert_not_nil assigns(:operational_entrances_detailed)
    assert_kind_of Array, assigns(:operational_entrances)
    assigns(:operational_entrances).each do |oe|
      assert_kind_of Historical, oe
      assert_equal true, oe.operational
      assert_equal TypeTransaction::CREDIT, oe.type_of
    end
    assigns(:operational_entrances_detailed).each do |oed|
      assert_kind_of CashFlow, oed
      assert_equal '2007-05-11', oed.date.to_s
    end

    assert_not_nil assigns(:operational_exits)
    assert_not_nil assigns(:operational_exits_detailed)
    assert_kind_of Array, assigns(:operational_exits)
    assigns(:operational_exits).each do |oe|
      assert_kind_of Historical, oe
      assert_equal true, oe.operational
      assert_equal TypeTransaction::DEBIT, oe.type_of
    end
    assigns(:operational_exits_detailed).each do |oed|
      assert_kind_of CashFlow, oed
      assert_equal '2007-05-11', oed.date.to_s
    end
    
    assert_not_nil assigns(:not_operational_entrances)
    assert_not_nil assigns(:not_operational_entrances_detailed)
    assert_kind_of Array, assigns(:not_operational_entrances)
    assigns(:not_operational_entrances).each do |noe|
      assert_kind_of Historical, noe
      assert_equal false, noe.operational
      assert_equal TypeTransaction::CREDIT, noe.type_of
    end
    assigns(:not_operational_entrances_detailed).each do |oed|
      assert_kind_of CashFlow, oed
      assert_equal '2007-05-11', oed.date.to_s
    end
    
    assert_not_nil assigns(:not_operational_exits)
    assert_not_nil assigns(:not_operational_exits_detailed)
    assert_kind_of Array, assigns(:not_operational_exits)
    assigns(:not_operational_exits).each do |noe|
      assert_kind_of Historical, noe
      assert_equal false, noe.operational
      assert_equal TypeTransaction::DEBIT, noe.type_of
    end
    assigns(:not_operational_exits_detailed).each do |oed|
      assert_kind_of CashFlow, oed
      assert_equal '2007-05-11', oed.date.to_s
    end

    assert_not_nil assigns(:balance)
    assert_equal -4904.5, assigns(:balance)
  end

  def test_generate_extract_simplified_for_month
    get :generate_extract, :extract => 'simplified', :option => 'month', :date => {:month => '5'}
    assert_response :success
    assert_template 'generate_extract'
    assert_nil assigns(:notice)
    assert_not_nil assigns(:extract)
    
    assert_not_nil assigns(:operational_entrances)
    assert_not_nil assigns(:operational_entrances_detailed)
    assert_kind_of Array, assigns(:operational_entrances)
    assigns(:operational_entrances).each do |oe|
      assert_kind_of Historical, oe
      assert_equal true, oe.operational
      assert_equal TypeTransaction::CREDIT, oe.type_of
    end
    assigns(:operational_entrances_detailed).each do |oed|
      assert_kind_of CashFlow, oed
      assert_equal '5', oed.date.month.to_s
    end

    assert_not_nil assigns(:operational_exits)
    assert_not_nil assigns(:operational_exits_detailed)
    assert_kind_of Array, assigns(:operational_exits)
    assigns(:operational_exits).each do |oe|
      assert_kind_of Historical, oe
      assert_equal true, oe.operational
      assert_equal TypeTransaction::DEBIT, oe.type_of
    end
    assigns(:operational_exits_detailed).each do |oed|
      assert_kind_of CashFlow, oed
      assert_equal '5', oed.date.month.to_s
    end
    
    assert_not_nil assigns(:not_operational_entrances)
    assert_not_nil assigns(:not_operational_entrances_detailed)
    assert_kind_of Array, assigns(:not_operational_entrances)
    assigns(:not_operational_entrances).each do |noe|
      assert_kind_of Historical, noe
      assert_equal false, noe.operational
      assert_equal TypeTransaction::CREDIT, noe.type_of
    end
    assigns(:not_operational_entrances_detailed).each do |oed|
      assert_kind_of CashFlow, oed
      assert_equal '5', oed.date.month.to_s
    end
    
    assert_not_nil assigns(:not_operational_exits)
    assert_not_nil assigns(:not_operational_exits_detailed)
    assert_kind_of Array, assigns(:not_operational_exits)
    assigns(:not_operational_exits).each do |noe|
      assert_kind_of Historical, noe
      assert_equal false, noe.operational
      assert_equal TypeTransaction::DEBIT, noe.type_of
    end
    assigns(:not_operational_exits_detailed).each do |oed|
      assert_kind_of CashFlow, oed
      assert_equal '5', oed.date.month.to_s
    end

    assert_not_nil assigns(:balance)
    assert_equal -4904.5, assigns(:balance)
  end

  def test_generate_extract_simplified_for_year
    get :generate_extract, :extract => 'simplified', :option => 'year', :date => {:year => '2007'}
    assert_response :success
    assert_template 'generate_extract'
    assert_nil assigns(:notice)
    assert_not_nil assigns(:extract)
    
    assert_not_nil assigns(:operational_entrances)
    assert_not_nil assigns(:operational_entrances_detailed)
    assert_kind_of Array, assigns(:operational_entrances)
    assigns(:operational_entrances).each do |oe|
      assert_kind_of Historical, oe
      assert_equal true, oe.operational
      assert_equal TypeTransaction::CREDIT, oe.type_of
    end
    assigns(:operational_entrances_detailed).each do |oed|
      assert_kind_of CashFlow, oed
      assert_equal '2007', oed.date.year.to_s
    end

    assert_not_nil assigns(:operational_exits)
    assert_not_nil assigns(:operational_exits_detailed)
    assert_kind_of Array, assigns(:operational_exits)
    assigns(:operational_exits).each do |oe|
      assert_kind_of Historical, oe
      assert_equal true, oe.operational
      assert_equal TypeTransaction::DEBIT, oe.type_of
    end
    assigns(:operational_exits_detailed).each do |oed|
      assert_kind_of CashFlow, oed
      assert_equal '2007', oed.date.year.to_s
    end
    
    assert_not_nil assigns(:not_operational_entrances)
    assert_not_nil assigns(:not_operational_entrances_detailed)
    assert_kind_of Array, assigns(:not_operational_entrances)
    assigns(:not_operational_entrances).each do |noe|
      assert_kind_of Historical, noe
      assert_equal false, noe.operational
      assert_equal TypeTransaction::CREDIT, noe.type_of
    end
    assigns(:not_operational_entrances_detailed).each do |oed|
      assert_kind_of CashFlow, oed
      assert_equal '2007', oed.date.year.to_s
    end
    
    assert_not_nil assigns(:not_operational_exits)
    assert_not_nil assigns(:not_operational_exits_detailed)
    assert_kind_of Array, assigns(:not_operational_exits)
    assigns(:not_operational_exits).each do |noe|
      assert_kind_of Historical, noe
      assert_equal false, noe.operational
      assert_equal TypeTransaction::DEBIT, noe.type_of
    end
    assigns(:not_operational_exits_detailed).each do |oed|
      assert_kind_of CashFlow, oed
      assert_equal '2007', oed.date.year.to_s
    end

    assert_not_nil assigns(:balance)
    assert_equal -4904.5, assigns(:balance)
  end

end
