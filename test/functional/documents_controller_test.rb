require File.dirname(__FILE__) + '/../test_helper'
require 'documents_controller'

# Re-raise errors caught by the controller.
class DocumentsController; def rescue_action(e) raise e end; end

class DocumentsControllerTest < Test::Unit::TestCase
  fixtures :documents, :departments, :document_sections, :organizations, :departments_documents, :document_items
  under_organization :one

  def setup
    @controller = DocumentsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as("quentin")
  end

  def test_used_fixtures_on_this_test
    assert Organization.find(1).valid?
    assert Document.find(1).valid?
    assert Department.find(1).valid?
  end

  def test_autocomplete_name_for_document_without_model
    Document.destroy_all
    document = Document.new(:name => 'document', :is_model => false, :organization_id => 1, :department_ids => [1])
    assert document.save
    get :autocomplete_name, :document => {:name => 'document'}
    assert_not_nil assigns(:documents)
    assert assigns(:documents).include?(document)
  end

  def test_autocomplete_name_for_model
    Document.destroy_all
    model = Document.create(:name => 'Model', :is_model => true, :organization_id => 1, :department_ids => [1])
    get :autocomplete_name, :document => {:name => 'Model'}, :models_list => true
    assert_not_nil assigns(:documents)
    assert assigns(:documents).include?(model)
  end

  def test_autocomplete_name_for_document_with_model
    Document.destroy_all
    model = Document.create(:name => 'Model', :is_model => true, :organization_id => 1, :department_ids => [1])
    document = Document.create(:name => 'document', :is_model => false, :organization_id => 1, :department_ids => [1], :document_model_id => model.id)
    get :autocomplete_name, :document => {:name => 'document'}, :document_model_id => model.id, :models_list => true
    assert_not_nil assigns(:documents)
    assert Organization.find(1).documents_by_model(model).include?(document)
#    assert assigns(:documents).include?(document)
  end

  def test_index
    get :index
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_list_documents_with_model
    Document.destroy_all
    model = Document.create(:name => 'Model', :is_model => true, :organization_id => 1, :department_ids => [1])
    document_with_model = Document.create(:name => 'Document', :is_model => false, :organization_id => 1, :department_ids => [1], :document_model_id => model.id)

    get :list, :document_model_id => 1 

    assert_response :success
    assert_template 'list', :document_model_id => model.id

    assert_not_nil assigns(:documents)
    assert_not_nil assigns(:document_pages)
    assert_not_nil assigns(:title)
    assert Organization.find(1).documents_by_model(model).include?(document_with_model)
#   assert assigns(:documents).include?(document_with_model)
  end

  def test_list_models
    document_model_id = 1
    d = Document.find(document_model_id)
    assert d.valid?
    assert d.is_model?

    get :list, :document_model => document_model_id

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:documents)
    assert_not_nil assigns(:document_pages)
    assert_not_nil assigns(:title)
  end

#  def test_if_list_of_documents_are_based_on_document_model_passed
#    document_model_id = 1
#    d = Document.find(document_model_id)
#    assert d.valid?
#    assert d.is_model?
#
#    get :list, :document_model => d.id
#
#    assert_equal assigns(:organization).documents_by_model(d), assigns(:documents)
#  end

#  def test_basic_variabeles_on_show_methods
#    
#    get :show, :id => 1
#
#    assert_response :success
#    assert_template 'show'
#
#    assert_not_nil assigns(:document)
#    assert_not_nil assigns(:departments)
#  end

  def test_basic_variable_on_new_method
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:document)
    assert_not_nil assigns(:departments)
    assert_kind_of Array, assigns(:departments)
    assigns(:departments).each do |d|
      assert d.valid?
    end
  end

#  def test_create_correct_params
#    num_documents = Document.count
#
#    post :create, :document => {:organization_id => 1, :name => 'Any Name', :department_ids => [1,2] }
#
#    assert_valid assigns(:document)
#    assert_response :redirect
#    assert_redirected_to :action => 'edit'
#
#    assert_equal num_documents + 1, Document.count
#  end

  def test_create_wrong_params
    num_documents = Document.count

    post :create, :document => {:organization_id => 1 }

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:document)
    assert_not_nil assigns(:departments)
    assert_kind_of Array, assigns(:departments)
    assigns(:departments).each do |d|
      assert d.valid?
    end

    assert_equal num_documents, Document.count
  end


#  def test_edit
#    get :edit, :id => 1
#
#    assert_response :success
#    assert_template 'edit'
#
#    assert_not_nil assigns(:document)
#    assert_not_nil assigns(:departments)
#    assert_not_nil assigns(:sections)
#    assert_kind_of Array, assigns(:departments)
#    assigns(:departments).each do |d|
#      assert_valid d
#    end
#    cp = Document.find(1)
#    cp.departments.concat(Department.find(1))
#    assert_valid assigns(:document)
#  end

  def test_update_correct_params
    post :update, :id => 1, :document => {:organization_id => 1, :name => 'Any Name', :department_ids => [1,2] }

    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_update_wrong_params
    count = Document.count
    cp = Document.new
    cp.name = "Any Name"
    cp.organization_id=2
    cp.is_model = true
    assert cp.save
    assert_equal count + 1, Document.count
    post :update, :id => cp.id, :document => {:organization_id => 1}

    assert_response :success
    assert_template 'edit'
    assert_not_nil assigns(:departments)
    assert_not_nil assigns(:sections)
    assert_kind_of Array, assigns(:departments)
    assigns(:departments).each do |d|
      assert d.valid?
    end

  end

  def test_destroy
    assert_not_nil Document.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Document.find(1)
    }
  end

end
