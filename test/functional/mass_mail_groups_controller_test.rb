require File.dirname(__FILE__) + '/../test_helper'
require 'mass_mail_groups_controller'

# Re-raise errors caught by the controller.
class CustomerGroupsController; def rescue_action(e) raise e end; end

class CustomerGroupsControllerTest < Test::Unit::TestCase

  under_organization :some

  def setup
    @controller = MassMailGroupsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization = create_organization(:identifier => 'some')
    @customer_group = create_customer_group
    login_as('quentin')
  end

  def test_setup
    assert @organization.valid?
    assert @customer_group.valid?
  end

  def test_autocomplete_mass_mail_group_name
    MassMailGroup.delete_all
    customer_group = create_customer_group(:name => 'Autocomplete test')
    get :autocomplete_mass_mail_group_name, :mass_mail_group => { :name => 'Auto'}, :group_type => 'customer'
    assert_not_nil assigns(:mass_mail_groups)
    assert_kind_of Array, assigns(:mass_mail_groups)
    assert_equal 1, assigns(:mass_mail_groups).length
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

    assert_equal 'customer', assigns(:group_type)
    assert_not_nil assigns(:mass_mail_groups)
    assert_kind_of Array, assigns(:mass_mail_groups)
  end

  def test_list_with_group_type
    get :list, :group_type => 'worker'

    assert_response :success
    assert_template 'list'

    assert_equal 'worker', assigns(:group_type)
    assert_not_nil assigns(:mass_mail_groups)
    assert_kind_of Array, assigns(:mass_mail_groups)
  end

  def test_list_with_wrong_group_type
    get :list, :group_type => 'supplier'

    assert_response :success
    assert_template 'list'

    assert_nil assigns(:mass_mail_groups)
  end

  def test_list_when_query_param_not_nil
    MassMailGroup.delete_all
    create_customer_group(:name => 'Some customer group')
    create_customer_group(:name => 'Another customer group')
    create_customer_group(:name => 'Customer group Three')
    get :list, :query => 'Another*' 

    assert_not_nil assigns(:query)
    assert_not_nil assigns(:mass_mail_groups)
    assert_kind_of Array, assigns(:mass_mail_groups)
    assert_not_nil assigns(:mass_mail_groups_pages)
    assert_kind_of ActionController::Pagination::Paginator, assigns(:mass_mail_groups_pages)
  end

  def test_show
    get :show, :id => @mass_mail_group, :group_type => 'customer'

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:mass_mail_group)
    assert assigns(:mass_mail_group).valid?    
  end

  def test_new
    get :new, :group_type => 'customer'

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:mass_mail_group)
    assert_kind_of MassMailGroup, assigns(:mass_mail_group)
    assert_equal @organization, assigns(:mass_mail_group).organization
  end

  def test_create
    post :create, :group_type => 'customer', :mass_mail_group => {:name => 'Some customer group' }
    assert_response :redirect
    assert_redirected_to :action => 'list', :group_type => 'customer'
  end
  
  def test_create_wrong_params
    post :create, :mass_mail_group => {}

    assert_response :success
    assert_template 'new'
  end

  def test_edit
    get :edit, :id => @customer_group, :group_type => 'customer'

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:mass_mail_group)
    assert assigns(:mass_mail_group).valid?
  end

  def test_update
    post :update, :id => @customer_group, :group_type => 'customer'
    assert_response :redirect
    assert_redirected_to :action => 'list', :group_type => 'customer'
  end

  def test_fail_update
    post :update, :id => @customer_group, :group_type => 'customer', :name => nil
    assert_response :success
    assert_template 'edit'
  end

  def test_destroy
    customer_group_id = @customer_group.id
    post :destroy, :id => @customer_group
    assert_response :redirect
    assert_redirected_to :action => 'list', :group_type => 'customer'

    assert_raise(ActiveRecord::RecordNotFound) {
      CustomerGroup.find(customer_group_id)
    }
  end

 

end
