require File.dirname(__FILE__) + '/../test_helper'
require 'ledger_categories_controller'

# Re-raise errors caught by the controller.
class LedgerCategoriesController; def rescue_action(e) raise e end; end

class LedgerCategoriesControllerTest < Test::Unit::TestCase

  under_organization :one
  
  fixtures :ledger_categories , :organizations

  def setup
    @controller = LedgerCategoriesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as('quentin')
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



end
