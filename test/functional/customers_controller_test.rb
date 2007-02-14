require File.dirname(__FILE__) + '/../test_helper'
require 'customers_controller'

# Re-raise errors caught by the controller.
class CustomersController; def rescue_action(e) raise e end; end

class CustomersControllerTest < Test::Unit::TestCase

  include TestingUnderOrganization

  fixtures :customers
  fixtures :contacts

  def setup
    @controller = CustomersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization_nickname = 'one'
    @organization = Organization.find_by_nickname 'one'
    login_as("quentin")
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

    assert_not_nil assigns(:customers)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:customer)
    assert assigns(:customer).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:customer)
  end

  def test_create
    num_customers = Customer.count

    post :create, :customer => {:name => 'Luluzinha', :cnpj => '32284871000170', :organization_id => 1}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_customers + 1, Customer.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:customer)
    assert assigns(:customer).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_destroy
    assert_not_nil Customer.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Customer.find(1)
    }
  end

  def test_list_contacts
    get :list_contacts, :id => 1

    assert_response :success
    assert_template 'list_contacts'

    assert_not_nil assigns(:contacts)
  end

  def test_show_contact
    get :show_contact, :id => 1

    assert_response :success
    assert_template 'show_contact'

    assert_not_nil assigns(:contact)
    assert assigns(:contact).valid?
  end

  def test_new_contact
    get :new_contact, :id => 1

    assert_response :success
    assert_template 'new_contact'

    assert_not_nil assigns(:contact)
  end

  def test_create_contact
    num_contacts = Contact.count

    post :create_contact, :id => 1, :contact => { :name => 'Test' }
    assert_response :redirect
    assert_redirected_to :action => 'list_contacts', :id => 1

    assert_equal num_contacts + 1, Contact.count
  end

  def test_edit_contact
    get :edit_contact, :id => 1

    assert_response :success
    assert_template 'edit_contact'

    assert_not_nil assigns(:contact)
    assert assigns(:contact).valid?
  end

  def test_update_contact
    post :update_contact, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list_contacts', :id => 1
  end

  def test_destroy_contact
    assert_not_nil Contact.find(1)

    post :destroy_contact, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list_contacts', :id => 1

    assert_raise(ActiveRecord::RecordNotFound) {
      Contact.find(1)
    }
  end
end
