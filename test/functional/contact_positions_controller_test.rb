require File.dirname(__FILE__) + '/../test_helper'
require 'contact_positions_controller'

# Re-raise errors caught by the controller.
class ContactPositionsController; def rescue_action(e) raise e end; end

class ContactPositionsControllerTest < Test::Unit::TestCase

  include TestingUnderOrganization

  fixtures :contact_positions, :organizations

  def setup
    @controller = ContactPositionsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization_nickname = 'one'
    @organization = Organization.find_by_nickname 'one'
    login_as('quentin')
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

    assert_not_nil assigns(:contact_positions)
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:contact_position)
  end

  def test_create
    num_contact_positions = ContactPosition.count

    post :create, :contact_position => { :name => 'Test position' }

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_contact_positions + 1, ContactPosition.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:contact_position)
    assert assigns(:contact_position).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_destroy
    assert_not_nil @organization.contact_positions.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      ContactPosition.find(1)
    }
  end
end
