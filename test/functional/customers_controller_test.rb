require File.dirname(__FILE__) + '/../test_helper'
require 'system_actors_controller'

# Re-raise errors caught by the controller.
class SystemActorsController; def rescue_action(e) raise e end; end

class CustomersControllerTest < Test::Unit::TestCase

  include TestingUnderOrganization

  fixtures :organizations, :system_actors, :categories

  def setup
    @controller = SystemActorsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization_nickname = 'one'
    @organization = Organization.find_by_identifier 'one'
    login_as("quentin")
    @system_actor = Customer.create!(:name => "Another Name to Test", :cpf => '874.923.844-24', 
                   :category => CustomerCategory.find(:first), :email => 'test@test.com', :organization_id => 1)
  end

  def test_system_actors_fixtures 
    SystemActor.find(:all).each do |item|
      assert item.valid?
      assert item.category.valid?
    end
  end
  def test_list
    get :list, :actor => 'customer'

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:system_actor_pages)
    assert_not_nil assigns(:system_actors)
    assert_kind_of Array, assigns(:system_actors)
    assigns(:system_actors).each  do |s|
      assert_kind_of Customer, s
      assert s.valid?
    end
  end

  def test_new
    get :new, :actor => 'customer'

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:system_actor)
    assert_not_nil assigns(:actor)
    assert_kind_of Customer, assigns(:system_actor)
    assert_equal @organization, assigns(:system_actor).organization
  end

  def test_create
    num_customers = Customer.count

    post :create, :actor => 'customer', :system_actor =>{:name=>"Some Name", :cpf => "403.786.765-63", :category_id => "20", :email => "test@mail.com"}


    assert_not_nil assigns(:system_actor)
    assert_not_nil assigns(:actor)
    assert_kind_of Customer, assigns(:system_actor)
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_customers + 1, Customer.count
  end

  def test_edit
    get :edit, :id => @system_actor.id, :actor => 'customer'

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:system_actor)
    assert assigns(:system_actor).valid?
    assert_kind_of Customer, assigns(:system_actor)
    assert_not_nil assigns(:actor)
  end

  def test_update
    post :update, :id => @system_actor.id, :actor => 'customer'
    assert_response :redirect
    assert_redirected_to :action => 'list', :actor => 'customer'
    assert_not_nil assigns(:system_actor)
    assert assigns(:system_actor).valid?
    assert_kind_of Customer, assigns(:system_actor)
    assert_not_nil assigns(:actor)
  end

  def test_destroy
    assert_not_nil @system_actor

    post :destroy, :id => @system_actor.id, :actor => 'customer'
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Customer.find(@system_actor.id)
    }
  end

end
