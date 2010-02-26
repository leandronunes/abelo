require File.dirname(__FILE__) + '/../test_helper'
require 'document_sections_controller'

# Re-raise errors caught by the controller.
class DocumentSectionsController; def rescue_action(e) raise e end; end

class DocumentSectionsControllerTest < ActionController::TestCase

  under_organization :one

  def test_index
    flunk 'make it works'
  end

#  def setup
#    @user = create_user(:login => 'admin', :administrator => true)
#    login_as("admin")
#    @organization = Organization.find_by_identifier('one')
#    @environment = create_environment(:is_default => true)
#    create
#  end
#
#  def test_new
#    get :new, :id => 1
#    assert_not_nil assigns(:document_section)
#    assert_not_nil assigns(:document_id)
#    assert_response :success
#    assert_template '_new'
#  end
#
#  def test_add
#    get :add, :document_section => {:name => 'Section for testing'}, :id => 1
#    assert_not_nil assigns(:document)
#    assert_not_nil assigns(:sections)
#    assert_response :success
#    assert_template '_list'
#  end
#
#  def test_edit
#    get :edit, :id => 1, :document_id => 1
#    assert_not_nil assigns(:document_section)
#    assert_not_nil assigns(:document_id)
#    assert_response :success
#    assert_template 'document_sections/edit'
#  end
#
#  def test_update
#    get :update, :id => 1, :document_id => 1
#    assert_not_nil assigns(:document_section)
#    assert_not_nil assigns(:document)
#    assert_not_nil assigns(:sections)
#    assert_response :success
#    assert_template '_list'
#  end
#
#  def test_destroy
#    post :destroy, :id => 1, :document_id => 1
#    assert_response :success
#    assert_template '_list'
#
#    assert_raise(ActiveRecord::RecordNotFound) {
#      DocumentSection.find(1)
#    }
#  end
#  
#
end
