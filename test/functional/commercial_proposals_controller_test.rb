require File.dirname(__FILE__) + '/../test_helper'
require 'commercial_proposals_controller'

# Re-raise errors caught by the controller.
class CommercialProposalsController; def rescue_action(e) raise e end; end

class CommercialProposalsControllerTest < Test::Unit::TestCase
  fixtures :commercial_proposals

  def setup
    @controller = CommercialProposalsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
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

    assert_not_nil assigns(:commercial_proposals)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:commercial_proposal)
    assert assigns(:commercial_proposal).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:commercial_proposal)
  end

  def test_create
    num_commercial_proposals = CommercialProposal.count

    post :create, :commercial_proposal => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_commercial_proposals + 1, CommercialProposal.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:commercial_proposal)
    assert assigns(:commercial_proposal).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil CommercialProposal.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      CommercialProposal.find(1)
    }
  end
end
