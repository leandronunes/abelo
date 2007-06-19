require File.dirname(__FILE__) + '/../test_helper'
require 'commercial_proposal_sections_controller'

# Re-raise errors caught by the controller.
class CommercialProposalSectionsController; def rescue_action(e) raise e end; end

class CommercialProposalSectionsControllerTest < Test::Unit::TestCase

  fixtures :commercial_proposals, :commercial_proposal_sections
  under_organization :one
  
  def setup
    @controller = CommercialProposalSectionsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as("quentin")
  end

  def test_new
    get :new, :id => 1
    assert_not_nil assigns(:commercial_proposal_section)
    assert_not_nil assigns(:commercial_proposal_id)
    assert_response :success
    assert_template 'commercial_proposal_sections/new'
  end

  def test_add
    get :add, :commercial_proposal_section => {:name => 'Section for testing'}, :id => 1
    assert_not_nil assigns(:commercial_proposal)
    assert_not_nil assigns(:sections)
    assert_response :success
    assert_template '_list'
  end

  def test_edit
    get :edit, :id => 1, :commercial_proposal_id => 1
    assert_not_nil assigns(:commercial_proposal_section)
    assert_not_nil assigns(:commercial_proposal_id)
    assert_response :success
    assert_template 'commercial_proposal_sections/edit'
  end

  def test_update
    get :update, :id => 1, :commercial_proposal_id => 1
    assert_not_nil assigns(:commercial_proposal_section)
    assert_not_nil assigns(:commercial_proposal)
    assert_not_nil assigns(:sections)
    assert_response :success
    assert_template '_list'
  end

  def test_destroy
    post :destroy, :id => 1, :commercial_proposal_id => 1
    assert_response :success
    assert_template '_list'

    assert_raise(ActiveRecord::RecordNotFound) {
      CommercialProposalSection.find(1)
    }
  end
  

end
