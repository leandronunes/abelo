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
    @configuration = create_configuration(:is_model => true, :name => 'A different name')
    @configuration_organization = create_configuration( :organization => @organization)
  end

  def create_configuration(params = {})
    Configuration.create!(params_configuration(params))
  end

  def params_configuration(params = {})
    {:is_model => false, 
      :organization_name => 'some name',
      :product_name => 'some name', 
      :department_name => 'some name',  
      :customer_name => 'some name',
      :document_name => 'some name', 
      :organization_name_on_plural => 'Organizations Name',
      :product_name_on_plural => 'Products name', 
      :department_name_on_plural => 'Departments Name',
      :customer_name_on_plural => 'Customers name', 
      :document_name_on_plural => 'Documents Name', 
      :name => 'some name', 
      :organization => nil}.merge(params)
  end

  def test_setup
    assert @organization.valid?
    assert @configuration.valid?
    assert @configuration_organization.valid?
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

  def test_autocomplete_name
    Configuration.destroy_all

    create_configuration(:is_model => true, :name => 'name')
    create_configuration(:is_model => true, :name => 'name test')

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
    Configuration.destroy_all
    post :create, :configuration => params_configuration(:is_model => true)

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal 1, Configuration.count
  end


  def test_save_worker_displays_on_create
    Configuration.delete_all
    WorkerDisplay.delete_all
    post :create, :configuration => params_configuration(:set_worker_displays =>{"name"=>{"none" => "", "field" => "name"} })
    
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
    get :edit, :id => @configuration_organization.id

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

  NAMES_ACTIONS = %w[
    name
    organization_name
    organization_name_on_plural
    product_name
    product_name_on_plural
    department_name
    department_name_on_plural
    customer_name
    customer_name_on_plural
    document_name
    document_name_on_plural
  ]

  NAMES_ACTIONS.each do |action|
    define_method("test_save_#{action}_on_create") do 
      Configuration.destroy_all
      name = "another name #{action}"
      post :create, :configuration => params_configuration(action.to_sym => name, :is_model => true)
      c = Configuration.find(:first)
      assert_not_nil c
      assert_equal name, c.send(action)
    end
  end

  NAMES_ACTIONS.each do |action|
    define_method("test_update_#{action}_on_configuration_model") do
      Configuration.destroy_all
      id = create_configuration(action.to_sym => 'name', :is_model => true).id
      name = "Another #{action}"
      assert_not_equal name, @configuration.send(action)
      post :update, :id => id, :configuration => {action.to_sym => name}
      c = Configuration.find(id)
      assert_equal name, c.send(action)
    end
  end

  NAMES_ACTIONS.reject{|r| r == 'update_name'}.each do |action|
    define_method("test_update_#{action}_on_organization_configuration") do
      id = @configuration_organization.id
      name = "Another #{action}"
      post :update, :id => id, :configuration => {action.to_sym => name}, :organization_id => @configuration_organization.organization
      c = Configuration.find(id)
      assert_equal name, c.send(action)
    end
  end

  def test_unsuccessfully_update
    customer_name = nil
    id = @configuration_organization.id
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
