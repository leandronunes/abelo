require File.dirname(__FILE__) + '/../test_helper'
require 'document_items_controller'

# Re-raise errors caught by the controller.
class DocumentItemsController; def rescue_action(e) raise e end; end

class DocumentItemsControllerTest < Test::Unit::TestCase

  fixtures :document_items, :documents, :document_sections
  under_organization :one

  def setup
    @controller = DocumentItemsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as("quentin")
  end

  def test_new
    get :new, :id => 1, :document_id => 1
    assert_not_nil assigns(:commercial_section_id)
    assert_not_nil assigns(:document_id)
    assert_response :success
    assert_template 'document_items/_new'
  end

  def test_add
    get :add, :document_item => {:quantity => 5, :unitary_value => 2.0, :product_id => 1, :document_section_id => 1}, :id => 1, :document_id => 1
    assert_not_nil assigns(:document)
    assert_not_nil assigns(:sections)
    assert_response :success
    assert_template 'document_sections/_list'
  end

  def test_edit
    get :edit, :document_item => {:quantity => 5, :unitary_value => 2.0, :product_id => 1, :document_section_id => 1}, :id => 1, :document_id => 1
    assert_not_nil assigns(:document_item)
    assert_not_nil assigns(:document_id)
    assert_response :success
    assert_template 'document_items/_edit'
  end

  def test_update
    get :update, :id => 1, :document_id => 1
    assert_not_nil assigns(:document_item)
    assert_not_nil assigns(:document)
    assert_not_nil assigns(:sections)
    assert_response :success
    assert_template 'document_sections/_list'
  end

  def test_destroy
    post :destroy, :id => 1, :document_id => 1
    assert_response :success
    assert_template 'document_sections/_list'

    assert_raise(ActiveRecord::RecordNotFound) {
      DocumentItem.find(1)
    }
  end

end
