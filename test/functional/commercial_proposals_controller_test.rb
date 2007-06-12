require File.dirname(__FILE__) + '/../test_helper'
require 'commercial_proposals_controller'

# Re-raise errors caught by the controller.
class CommercialProposalsController; def rescue_action(e) raise e end; end

class CommercialProposalsControllerTest < Test::Unit::TestCase
  fixtures :commercial_proposals, :departments
  under_organization :one
  
  def setup
    @controller = CommercialProposalsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as("quentin")
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

    assert_not_nil assigns(:commercial_proposals)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:commercial_proposal)
    assert_valid assigns(:commercial_proposal)
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:commercial_proposal)
    assert_not_nil assigns(:departments)
    assert_kind_of Array, assigns(:departments)
    assigns(:departments).each do |d|
      assert d.valid?
    end
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:commercial_proposal)
    assert_not_nil assigns(:departments)
    assert_kind_of Array, assigns(:departments)
    assigns(:departments).each do |d|
      assert d.valid?
    end
  end

  def test_create_correct_params
    num_commercial_proposals = CommercialProposal.count

    post :create, :commercial_proposal => {:organization_id => 1, :name => 'Any Name', :department_ids => [1,2] }

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_commercial_proposals + 1, CommercialProposal.count
  end

  def test_create_wrong_params
    num_commercial_proposals = CommercialProposal.count

    post :create, :commercial_proposal => {:organization_id => 1 }

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:departments)
    assert_kind_of Array, assigns(:departments)
    assigns(:departments).each do |d|
      assert d.valid?
    end

    assert_equal num_commercial_proposals, CommercialProposal.count
  end


  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:commercial_proposal)
    assert_not_nil assigns(:departments)
    assert_kind_of Array, assigns(:departments)
    assigns(:departments).each do |d|
      assert_valid d
    end
    assert_valid assigns(:commercial_proposal)
  end

  def test_update_correct_params
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_update_wrong_params
    count = CommercialProposal.count
    cp = CommercialProposal.new
    cp.name = "Any Name"
    cp.organization_id=2
    assert cp.save
    assert_equal count + 1, CommercialProposal.count
    post :update, :id => cp.id, :commercial_proposal => {:organization_id => 1}

    assert_response :success
    assert_template 'edit'
    assert_not_nil assigns(:departments)
    assert_kind_of Array, assigns(:departments)
    assigns(:departments).each do |d|
      assert d.valid?
    end

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

  def test_choose_template
    get :choose_template
    assert_response :success
    assert_template 'choose_template'
  end

  def test_new_from_template
    get :new_from_template, :id => 1
    assert_response :success
  end

end
