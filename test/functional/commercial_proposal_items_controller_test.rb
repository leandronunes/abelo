require File.dirname(__FILE__) + '/../test_helper'
require 'commercial_proposal_items_controller'

# Re-raise errors caught by the controller.
class CommercialProposalItemsController; def rescue_action(e) raise e end; end

class CommercialProposalItemsControllerTest < Test::Unit::TestCase

  fixtures :commercial_proposal_items, :commercial_proposals, :commercial_proposal_sections
  under_organization :one

  def setup
    @controller = CommercialProposalItemsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as("quentin")
  end

  def test_new
    get :new, :id => 1, :commercial_proposal_id => 1
    assert_not_nil assigns(:commercial_section_id)
    assert_not_nil assigns(:commercial_proposal_id)
    assert_response :success
    assert_template 'commercial_proposal_items/_new'
  end

  def test_add
    get :add, :commercial_proposal_item => {:quantity => 5, :unitary_value => 2.0, :product_id => 1, :commercial_proposal_section_id => 1}, :id => 1, :commercial_proposal_id => 1
    assert_not_nil assigns(:commercial_proposal)
    assert_not_nil assigns(:sections)
    assert_response :success
    assert_template 'commercial_proposal_sections/_list'
  end

  def test_edit
    get :edit, :commercial_proposal_item => {:quantity => 5, :unitary_value => 2.0, :product_id => 1, :commercial_proposal_section_id => 1}, :id => 1, :commercial_proposal_id => 1
    assert_not_nil assigns(:commercial_proposal_item)
    assert_not_nil assigns(:commercial_proposal_id)
    assert_response :success
    assert_template 'commercial_proposal_items/_edit'
  end

  def test_update
    get :update, :id => 1, :commercial_proposal_id => 1
    assert_not_nil assigns(:commercial_proposal_item)
    assert_not_nil assigns(:commercial_proposal)
    assert_not_nil assigns(:sections)
    assert_response :success
    assert_template 'commercial_proposal_sections/_list'
  end

  def test_destroy
    post :destroy, :id => 1, :commercial_proposal_id => 1
    assert_response :success
    assert_template 'commercial_proposal_sections/_list'

    assert_raise(ActiveRecord::RecordNotFound) {
      CommercialProposalItem.find(1)
    }
  end

end
