require File.dirname(__FILE__) + '/../test_helper'
require 'documents_controller'

# Re-raise errors caught by the controller.
class DocumentsController; def rescue_action(e) raise e end; end

class DocumentsControllerTest < Test::Unit::TestCase

  under_organization :some

  def setup
    @controller = DocumentsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @organization = create_organization(:identifier => 'some')
    @department = create_department
    @customer = create_customer
    @document = create_document(:is_model => false)
    @document_model = create_document(:is_model => true, :name => 'another')
    login_as("quentin")
  end

  def test_setup
    assert @organization.valid?
    assert @department.valid?
    assert @customer.valid?
    assert @document.valid?
    assert @document_model.valid?
  end

  def test_autocomplete_document_name_for_document_without_model
    Document.destroy_all
    document = create_document(:is_model => false, :name => 'document')
    get :autocomplete_document_name, :document => {:name => 'document'}
    assert_not_nil assigns(:documents)
    assert assigns(:documents).include?(document)
  end

  def test_autocomplete_document_name_for_model
    Document.destroy_all
    model = create_document(:name => 'Model', :is_model => true)
    get :autocomplete_document_name, :document => {:name => 'Model'}, :models_list => true
    assert_not_nil assigns(:documents)
    assert assigns(:documents).include?(model)
  end

  def test_autocomplete_document_name_for_document_with_model
    Document.destroy_all
    model = create_document(:is_model => true, :name => 'Model')
    document = create_document(:is_model => false, :document_model => model)
    get :autocomplete_document_name, :document => {:name => 'document'}, :document_model_id => model.id, :models_list => true
    assert_not_nil assigns(:documents)
    assert @organization.documents_by_model(model).include?(document)
  end

  def test_index
    get :index
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_list_documents_with_model
    Document.destroy_all
    model = create_document(:is_model => true)
    document_with_model = create_document(:name => 'Another name', :is_model => false, :document_model => model)

    get :list, :document_model_id => model.id, :models_list => true 

    assert_response :success
    assert_template 'list', :document_model_id => model.id

    assert_not_nil assigns(:documents)
    assert_not_nil assigns(:document_pages)
    assert_not_nil assigns(:title)
    assert @organization.documents_by_model(model).include?(document_with_model)
#   assert assigns(:documents).include?(document_with_model)
  end

  def test_list_models
    get :list, :models_list => true

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:documents)
    assert_not_nil assigns(:document_pages)
    assert_not_nil assigns(:title)
  end

  def test_list_documents_withou_model
    Document.destroy_all
    document = Document.create(:name => 'Document', :is_model => false, :organization_id => 1, :department_ids => [1])
    get :list 
    assert_template 'list'

    assert_not_nil assigns(:documents)
    assert_not_nil assigns(:document_pages)
    assert_not_nil assigns(:title)
  end

  def test_show_document_with_model
    
    get :show, :id => @document.id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:document)
  end

  def test_new_document_from_model
    model = Document.create(:name => 'Model', :is_model => true, :organization => @organization, :department_ids => [@department.id])

    get :new, :document_model_id => model.id

    assert_response :success
    assert_template 'new', :models_list => true, :document_model_id => model.id

    assert_not_nil assigns(:document)
    assert_not_nil assigns(:title)
    assert_not_nil assigns(:departments)
    assert_kind_of Array, assigns(:departments)
    assigns(:departments).each do |d|
      assert d.valid?
    end
    assert_not_nil assigns(:customers)
    assert_not_nil assigns(:workers)
    assert_not_nil assigns(:suppliers)
  end

  def test_new_blank_document
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:document)
    assert_not_nil assigns(:title)
    assert_not_nil assigns(:departments)
    assert_kind_of Array, assigns(:departments)
    assigns(:departments).each do |d|
      assert d.valid?
    end
    assert_not_nil assigns(:customers)
    assert_not_nil assigns(:workers)
    assert_not_nil assigns(:suppliers)
  end

  def test_new_document_model
    get :new, :models_list => true

    assert_response :success
    assert_template 'new', :models_list => true

    assert_not_nil assigns(:document)
    assert_not_nil assigns(:title)
    assert_not_nil assigns(:departments)
    assert_kind_of Array, assigns(:departments)
    assigns(:departments).each do |d|
      assert d.valid?
    end
    assert_not_nil assigns(:customers)
    assert_not_nil assigns(:workers)
    assert_not_nil assigns(:suppliers)
  end

  def test_create_document_with_model
    num_documents = Document.count

    post :create, :document_model_id => @document_model.id, :document => {:name => 'Another Some Name', :is_model => false, :organization => @organization,:departments => [@department], :owner => @customer}, :models_list => true

    assert_valid assigns(:document)
    assert_not_nil assigns(:document)
    assert_response :redirect
    assert_redirected_to :action => 'list', :document_model_id => @document_model.id, :models_list => true

    assert @organization.documents_by_model(@document_model).include?(assigns(:document))
    assert_equal num_documents + 1, Document.count
  end

  def test_create_document_model
    num_documents = Document.count

    post :create, :document => {:name => 'document', :organization => @organization , :department_ids => [@department.id]}, :models_list => true
    assert_valid assigns(:document)
    assert_not_nil assigns(:document)
    assert_response :redirect
    assert_redirected_to :action => 'list', :models_list => true

    assert @organization.documents_model.include?(assigns(:document))
    assert_equal num_documents + 1, Document.count
  end

  def test_create_document_without_model
    num_documents = Document.count

    post :create, :document => {:name => 'Another Some Name', :is_model => false, :organization => @organization,:departments => [@department], :owner => @customer }

    assert_valid assigns(:document)
    assert_not_nil assigns(:document)
    assert_response :redirect
    assert_redirected_to :action => 'list' 

    assert @organization.documents_without_model.include?(assigns(:document))
    assert_equal num_documents + 1, Document.count
  end

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


  def test_edit_document_with_model
    document = create_document(:is_model => false, :document_model => @document_model, :name => 'test')

    get :edit, :id => document.id, :document_model_id => 1, :models_list => true

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:document)
    assert_not_nil assigns(:departments)
    assert_not_nil assigns(:title)
    assert_kind_of Array, assigns(:departments)
    assigns(:departments).each do |d|
      assert_valid d
    end
  end

  def test_edit_document_without_model
    
    get :edit, :id => @document.id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:document)
    assert_not_nil assigns(:departments)
    assert_not_nil assigns(:title)
    assert_kind_of Array, assigns(:departments)
    assigns(:departments).each do |d|
      assert_valid d
    end
  end


  def test_edit_document_without_model_with_owner_type
    document = create_document(:name => 'some')
    assert @customer.valid?
    @customer.documents << document
    
    get :edit, :id => document.id

    assert_response :success
    assert_template 'edit'
  end


  def test_edit_document_model
    get :edit, :id => @document_model, :models_list => true

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:document)
    assert_not_nil assigns(:departments)
    assert_not_nil assigns(:title)
    assert_kind_of Array, assigns(:departments)
    assigns(:departments).each do |d|
      assert_valid d
    end
  end
  
  def test_update_document_model
    model = Document.create(:name => 'Model', :is_model => true, :organization_id => 1, :department_ids => [1])
    document = Document.create(:name => 'document', :is_model => false, :organization_id => 1, :department_ids => [1], :document_model_id => model.id)

    post :update, :id => document.id, :document => {:organization_id => 1, :name => 'Any Name', :department_ids => [1,2], :document_model_id => model.id}, :document_model_id => model.id, :models_list => true

    assert_response :redirect
    assert_redirected_to :action => 'show', :id => document.id, :document_model_id => model.id, :models_list => true
  end

  def test_update_document_model
    post :update, :id => 1, :document => {:organization_id => 1, :name => 'Any Name', :department_ids => [1,2] }, :models_list => true

    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1, :models_list => true
  end

  def test_update_document_without_model
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

  def test_list_owners_customers
    get :list_owners, :document => {:organization_id => 1, :name => 'Any Name', :department_ids => [1,2] }, :value => 'supplier', :models_list => true
    assert_not_nil assigns(:document)
    assert_not_nil assigns(:owner_type)
    assert_not_nil assigns(:customers)
    assert_not_nil assigns(:workers)
    assert_not_nil assigns(:suppliers)
  end

end
