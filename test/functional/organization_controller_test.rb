require File.dirname(__FILE__) + '/../test_helper'
require 'organization_controller'

# Re-raise errors caught by the controller.
class OrganizationController; def rescue_action(e) raise e end; end

class OrganizationControllerTest < Test::Unit::TestCase
  fixtures :addresses

  under_organization :one

  def setup
    @controller = OrganizationController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization = Organization.find_by_identifier 'one'
    login_as("quentin")
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:organization)
    assert_kind_of Organization, assigns(:organization)
  end

  def test_update
    @organization.presentation = nil
    @organization.save
    presentation = 'something'
    post :update, :organization => {:presentation => presentation}
    assert_response :redirect
    assert_redirected_to :action => 'index' 
    assert_equal presentation, Organization.find(@organization.id).presentation
  end

  def test_edit_address
    get :edit_address
    assert_response :success
    assert_template 'edit_address'
    assert_not_nil assigns(:address)
    assert_not_nil assigns(:countries)
    assert_kind_of Array, assigns(:countries)
    assert_not_nil assigns(:states)
    assert_kind_of Array, assigns(:states)
    assert_not_nil assigns(:cities)
    assert_kind_of Array, assigns(:cities)
  end

  def test_update_address
    new_number = 23
    post :update_address, :address => {:number => new_number}
    assert_response :redirect
    assert_redirected_to :action => 'address'
  end

  def test_update_address_unsuccessfully
    # The country cannot be nil
    post :update_address, :address => {:country_id => nil}
    assert_response :success
    assert_template 'edit_address'
    assert_not_nil assigns(:countries)
    assert_kind_of Array, assigns(:countries)
    assert_not_nil assigns(:states)
    assert_kind_of Array, assigns(:states)
    assert_not_nil assigns(:cities)
    assert_kind_of Array, assigns(:cities)
  end


end
