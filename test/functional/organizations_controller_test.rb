require File.dirname(__FILE__) + '/../test_helper'
require 'organizations_controller'

# Re-raise errors caught by the controller.
class OrganizationsController; def rescue_action(e) raise e end; end

class OrganizationsControllerTest < ActionController::TestCase

#  under_organization :admin #TODO see the better way to do that. This are admin controllers
 
  def setup
    Organization.destroy_all
    Environment.destroy_all
    login_as('admin')
    @environment = create_environment(:is_default => true)
    @country = BSC::Country.create!(:name => 'A Country')
    @state = BSC::State.create!(:name => 'Some State', :country => @country, :code => 'SS')
    @city = BSC::City.create!(:state => @state, :name => 'Some City', :zip_code => '40000')
#    @organization = create_organization(:name => 'my organization')
  end

  def test_setup

    assert @country.valid?
    assert @state.valid?
    assert @city.valid?
    assert @organization.valid?
  end

  def organization_params
    {
     :name => 'Some Organization', :identifier => 'testing_org', :cnpj => '78048802000169', 
     :country => @country.id, :state => @state.id, :city => @city.id}
  end

  def test_only_admin_has_access
    login_as('aaron')
    assert_raise(RuntimeError){get :index}
    assert_raise(RuntimeError){get :list}
    assert_raise(RuntimeError){get :new}
    assert_raise(RuntimeError){get :edit}
    assert_raise(RuntimeError){get :create}
    assert_raise(RuntimeError){get :update}
  end

  def test_autocomplete_organization_name
    Organization.destroy_all
    create_organization(:name => 'test organization', :identifier => 'some', :cnpj => '84.021.301/0001-91')
    create_organization(:name => 'organization', :identifier => 'anothersome', :cnpj => '73.417.283/0001-45')
    get :autocomplete_organization_name, :organization => { :name => 'test'}
    assert_not_nil assigns(:organizations)
    assert_kind_of Array, assigns(:organizations)
    assert_equal 1, assigns(:organizations).length
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

    assert_not_nil assigns(:organizations)
    assert_kind_of Array, assigns(:organizations)
    assert_not_nil assigns(:organization_pages)
  end

  def test_show
    Organization.destroy_all
    o = create_organization(:name => 'Some Organization', :identifier => 'testing_org', :cnpj => '78048802000169')
    get :show, :organization_id => o.id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:organization)
    assert assigns(:organization).valid?
    assert_equal o.id, assigns(:organization).id
  end

  def test_new
    get :new

    assert_not_nil assigns(:organization)

    assert_response :success
    assert_template 'new'
  end

  def test_successfully_create
    num_organizations = Organization.count

    post :create, :organization => organization_params

    assert_response :redirect
    assert_redirected_to :controller => 'configuration', :action => 'edit'

    assert_equal num_organizations + 1, Organization.count
  end

  def test_save_name_on_create
    Organization.destroy_all
    post :create, :organization => organization_params
    
    o = Organization.find(:first)
    assert_not_nil o
    assert o.valid?
    assert_equal 'Some Organization', o.name
  end

  def test_save_identifier_on_create
    Organization.destroy_all
    post :create, :organization => organization_params
    
    o = Organization.find(:first)
    assert_not_nil o
    assert o.valid?
    assert_equal 'testing_org', o.identifier
  end

  def test_save_cnpj_on_create
    Organization.destroy_all
    post :create, :organization => organization_params
    
    o = Organization.find(:first)
    assert_not_nil o
    assert o.valid?
    assert_equal '78048802000169', o.cnpj
  end


  def test_unsuccessfully_create
    num_organizations = Organization.count

    post :create, :organization => {:name => 'Some Organization', :identifier => nil}

    assert_response :success
    assert_template 'new'
    assert assigns(:organization)

    assert_equal num_organizations, Organization.count
  end

  def test_edit
    Organization.destroy_all
    o = create_organization(:name => 'Some Organization', :identifier => 'testing_org', :cnpj => '78048802000169')
    get :edit, :organization_id => o.id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:organization)
    assert assigns(:organization).valid?
  end


  def test_successfully_update
    Organization.destroy_all
    o = create_organization(:name => 'Some Organization', :identifier => 'testing_org', :cnpj => '78048802000169')
    num_organizations = Organization.count
    post :update, :id => o.id, :organization => {:name => 'Another Organization'}

    assert_response :redirect
    assert_redirected_to :action => 'show'

    assert_equal num_organizations, Organization.count
  end

  def test_save_name_on_update
    Organization.destroy_all
    o = create_organization(:name => 'Some Organization', :identifier => 'testing_org', :cnpj => '78048802000169')
    post :update, :id => o.id, :organization => {:name => 'Another Organization'}

    o = Organization.find(:first)
    assert_not_nil o
    assert o.valid?
    assert_equal 'Another Organization', o.name
  end


  def test_save_cnpj_on_update
    Organization.destroy_all
    o = create_organization(:name => 'Some Organization', :identifier => 'testing_org', :cnpj => '78048802000169')
    post :update, :id => o.id, :organization => {:cnpj => '62.370.998/0001-73'}

    o = Organization.find(:first)
    assert_not_nil o
    assert o.valid?
    assert_equal '62.370.998/0001-73', o.cnpj
  end

  def test_unsuccessfully_update
    create_organization(:name => 'Another Some Organization', :identifier => 'another_testing_org', :cnpj => '62.370.998/0001-73')
    o = create_organization(:name => 'Some Organization', :identifier => 'testing_org', :cnpj => '78048802000169')
    num_organizations = Organization.count
    post :update, :id => o.id, :organization => {:cnpj => '62.370.998/0001-73'}

    assert_response :success
    assert_template 'edit'
    assert assigns(:organization)

    assert_equal num_organizations, Organization.count
  end

  def test_destroy
    id = @organization.id

    post :destroy, :organization_id => id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Organization.find(id)
    }
  end

end
