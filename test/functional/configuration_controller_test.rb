require File.dirname(__FILE__) + '/../test_helper'
require 'configuration_controller'

# Re-raise errors caught by the controller.
class ConfigurationController; def rescue_action(e) raise e end; end

class ConfigurationControllerTest < Test::Unit::TestCase

  under_organization :admin #TODO see the better way to do that. This are admin controllers

  def setup
    @controller = ConfigurationController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as('admin')
    @organization = Organization.find(:first)
    @configuration = Configuration.create!(:is_model => true, :organization_name => 'Some Name',
      :product_name => 'Some name', :department_name => 'Some Name',
      :customer_name => 'Some name', :document_name => 'Some Name', :name => 'A name')
    @configuration_organization = Configuration.create!( :organization_name => 'Some Name',
      :product_name => 'Some name', :department_name => 'Some Name',
      :customer_name => 'Some name', :document_name => 'Some Name',:organization => @organization)

  end

  def test_setup
    assert @organization.valid?
    assert @configuration.valid?
    assert @configuration_organization.valid?
  end

  def test_only_admin_has_access
    login_as('aaron')
    get :index
    assert_response :success
    assert_template 'users/access_denied'
    get :list
    assert_response :success
    assert_template 'users/access_denied'
    get :new
    assert_response :success
    assert_template 'users/access_denied'
    get :edit
    assert_response :success
    assert_template 'users/access_denied'
    get :create
    assert_response :success
    assert_template 'users/access_denied'
    get :update
    assert_response :success
    assert_template 'users/access_denied'
  end

  def test_autocomplete_name
    Configuration.destroy_all

    Configuration.create(:is_model => true, :organization_name => 'Some Name',
      :product_name => 'Some name', :department_name => 'Some Name',
      :customer_name => 'Some name', :document_name => 'Some Name', :name => 'name')
    Configuration.create(:is_model => true, :organization_name => 'Some Name',
      :product_name => 'Some name', :department_name => 'Some Name',
      :customer_name => 'Some name', :document_name => 'Some Name', :name => 'name test')

    get :autocomplete_name, :configuration => { :name => 'test'}
    assert_not_nil assigns(:configurations)
    assert_kind_of Array, assigns(:configurations)
    assert_equal 1, assigns(:configurations).length
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

    assert_not_nil assigns(:configurations)
    assert_kind_of Array, assigns(:configurations)
    assert_not_nil assigns(:configuration_pages)
    assert_kind_of ActionController::Pagination::Paginator, assigns(:configuration_pages)
  end


  def test_show
    get :show, :organization_id => @organization.id

    assert_not_nil assigns(:configuration)

    assert_response :success
    assert_template 'show'
  end

  def test_new
    get :new
    assert_not_nil assigns(:configuration)
    assert_not_nil assigns(:worker_fields)
    assert_not_nil assigns(:customer_fields)
    assert_not_nil assigns(:supplier_fields)
    assert_not_nil assigns(:product_fields)
    assert_not_nil assigns(:department_fields)
    assert_not_nil assigns(:ledger_category_fields)
    assert_not_nil assigns(:ledger_fields)
    assert_not_nil assigns(:bank_account_fields)

    assert_response :success
    assert_template 'new'
  end

  def test_successfully_create
    num = Configuration.count

    post :create, :configuration => {:name => 'Some Name', :organization_name => 'Some Name',
      :product_name => 'Some name', :department_name => 'Some Name',
      :customer_name => 'Some name', :document_name => 'Some Name'}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num + 1, Configuration.count
  end

  def test_save_name_on_create
    Configuration.delete_all
    name = "Some name"
    post :create, :configuration => {:name => name, :organization_name => 'Another Name',
      :product_name => 'Some name', :department_name => 'Another Name',
      :customer_name => 'Some name', :document_name => 'Another Name'}
    
    c = Configuration.find(:first)
    assert_not_nil c
    assert_equal name, c.name
  end

  def test_save_organization_name_on_create
    Configuration.delete_all
    name = "Some name"
    post :create, :configuration => {:name => 'Another Name', :organization_name => name,
      :product_name => 'Some name', :department_name => 'Another Name',
      :customer_name => 'Some name', :document_name => 'Another Name'}
    
    c = Configuration.find(:first)
    assert_not_nil c
    assert_equal name, c.organization_name
  end

  def test_save_product_name_on_create
    Configuration.delete_all
    name = "Some name"
    post :create, :configuration => {:name => 'Another Name', :organization_name => 'Another Name',
      :product_name => name, :department_name => 'Another Name',
      :customer_name => 'Some name', :document_name => 'Another Name'}
    
    c = Configuration.find(:first)
    assert_not_nil c
    assert_equal name, c.product_name
  end

  def test_save_department_name_on_create
    Configuration.delete_all
    name = "Some name"
    post :create, :configuration => {:name => 'Another Name', :organization_name => 'Another Name',
      :product_name => 'Some name', :department_name => name,
      :customer_name => 'Some name', :document_name => 'Another Name'}
    
    c = Configuration.find(:first)
    assert_not_nil c
    assert_equal name, c.department_name
  end

  def test_save_customer_name_on_create
    Configuration.delete_all
    name = "Some name"
    post :create, :configuration => {:name => 'Another Name', :organization_name => 'Another Name',
      :product_name => 'Some name', :department_name => 'Another Name',
      :customer_name => name, :document_name => 'Another Name'}
    
    c = Configuration.find(:first)
    assert_not_nil c
    assert_equal name, c.customer_name
  end

  def test_save_document_name_on_create
    Configuration.delete_all
    name = "Some name"
    post :create, :configuration => {:name => 'Another Name', :organization_name => 'Another Name',
      :product_name => 'Some name', :department_name => 'Another Name',
      :customer_name => 'Some name', :document_name => name}
    
    c = Configuration.find(:first)
    assert_not_nil c
    assert_equal name, c.document_name
  end

  def test_save_worker_displays_on_create
    Configuration.delete_all
    WorkerDisplay.delete_all
    post :create, :configuration => {:name => 'Another Name', :organization_name => 'Another Name',
      :product_name => 'Some name', :department_name => 'Another Name',
      :customer_name => 'Some name', :document_name => 'Another Name', 
      'set_worker_displays' =>{"name"=>{"none" => "", "field" => "name"} }}
    
    c = Configuration.find(:first)
    assert_not_nil c
    assert_equal 1, WorkerDisplay.count
    assert_equal 1, c.worker_displays.length
  end



  def test_unsuccessfully_create
    num = Configuration.count

    # The configuration passed as parameter don't have all params needed
    post :create, :configuration => {:name => 'Some Organization'}

    assert_response :success
    assert_template 'new'
    assert assigns(:configuration)
    assert_not_nil assigns(:worker_fields)
    assert_not_nil assigns(:customer_fields)
    assert_not_nil assigns(:supplier_fields)
    assert_not_nil assigns(:product_fields)
    assert_not_nil assigns(:department_fields)
    assert_not_nil assigns(:ledger_category_fields)
    assert_not_nil assigns(:ledger_fields)
    assert_not_nil assigns(:bank_account_fields)

    assert_equal num, Configuration.count
  end

  def test_edit
    get :edit, :id => @configuration.id

    assert_response :success
    assert_template 'edit'
    assert assigns(:configuration)
    assert_not_nil assigns(:worker_fields)
    assert_not_nil assigns(:customer_fields)
    assert_not_nil assigns(:supplier_fields)
    assert_not_nil assigns(:product_fields)
    assert_not_nil assigns(:department_fields)
    assert_not_nil assigns(:ledger_category_fields)
    assert_not_nil assigns(:ledger_fields)
    assert_not_nil assigns(:bank_account_fields)

  end


  def test_successfully_update
    post :update, :id => @configuration.id, :configuration => {:name => 'Another Configuration'}

    assert_response :redirect
    assert_redirected_to :action => 'show'
  end

  def test_update_name
    name = "Another name"
    id = @configuration.id
    post :update, :id => id, :configuration => {:name => name}
    
    c = Configuration.find(id)
    assert_equal name, c.name
  end

  def test_update_organization_name
    organization_name = "Another organization_name"
    id = @configuration.id
    post :update, :id => id, :configuration => {:organization_name => organization_name}
    
    c = Configuration.find(id)
    assert_equal organization_name, c.organization_name
  end

  def test_update_product_name
    product_name = "Another product_name"
    id = @configuration.id
    post :update, :id => id, :configuration => {:product_name => product_name}
    
    c = Configuration.find(id)
    assert_equal product_name, c.product_name
  end

  def test_update_department_name
    department_name = "Another department_name"
    id = @configuration.id
    post :update, :id => id, :configuration => {:department_name => department_name}
    
    c = Configuration.find(id)
    assert_equal department_name, c.department_name
  end

  def test_update_customer_name
    customer_name = "Another customer_name"
    id = @configuration.id
    post :update, :id => id, :configuration => {:customer_name => customer_name}
    
    c = Configuration.find(id)
    assert_equal customer_name, c.customer_name
  end

  def test_update_document_name
    document_name = "Another document_name"
    id = @configuration.id
    post :update, :id => id, :configuration => {:document_name => document_name}
    
    c = Configuration.find(id)
    assert_equal document_name, c.document_name
  end

  def test_unsuccessfully_update
    customer_name = nil
    id = @configuration.id
    post :update, :id => id, :configuration => {:customer_name => customer_name}

    assert_response :success
    assert_template 'edit'
    assert assigns(:configuration)
    assert_not_nil assigns(:worker_fields)
    assert_not_nil assigns(:customer_fields)
    assert_not_nil assigns(:supplier_fields)
    assert_not_nil assigns(:product_fields)
    assert_not_nil assigns(:department_fields)
    assert_not_nil assigns(:ledger_category_fields)
    assert_not_nil assigns(:ledger_fields)
    assert_not_nil assigns(:bank_account_fields)

  end

  def test_successfully_destroy

    id = @configuration.id
    assert_not_nil Configuration.find(id)

    post :destroy, :id => id
    assert_response :redirect
    assert_redirected_to :action => 'list'
    assert_not_nil flash[:notice]
  
    assert_raise(ActiveRecord::RecordNotFound) {
      Configuration.find(id)
    }
  end

  def test_unsuccessfully_destroy

    id = @configuration_organization.id
    assert_not_nil Configuration.find(id)

    post :destroy, :id => id
    assert_response :redirect
    assert_redirected_to :action => 'list'
    assert_not_nil flash[:notice]
  
    assert_not_nil Configuration.find(id)
  end

  def test_parse_params_configuration
    parameters =  {:configuration =>{ 
      'set_worker_displays' => {'name' => {'field' => 'name', 'none' => '', 'display_in_list' => 'true'}, 'email' => {'field' => 'email', 'none' => ''}  },
      'set_product_displays' => {'name' => {'field' => 'name', 'none' => '', 'display_in_list' => 'false'}  }}}

    expected =  {:configuration =>{ 
      'set_worker_displays' => {'name' => {'field' => 'name', 'display_in_list' => 'true'}, 'email' => {'field' => 'email'}  },
      'set_product_displays' => {'name' => {'field' => 'name', 'display_in_list' => 'false'}  }}}
    assert_equal expected,  @controller.parse_params_configuration(parameters)
  end


end
