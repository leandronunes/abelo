require File.dirname(__FILE__) + '/../test_helper'
require 'system_actors_controller'

# Re-raise errors caught by the controller.
class SystemActorsController; def rescue_action(e) raise e end; end

class SystemActorsControllerTest < ActionController::TestCase

  under_organization :one

  def setup
    User.delete_all
    @user = create_user(:login => 'admin', :administrator => true)
    login_as('admin')
    @organization = create_organization(:identifier => 'one')

    @environment = create_environment(:is_default => true)

    @customer_category = create_customer_category(:organization => @organization)
    @system_actor = create_customer(:category => @customer_category, :organization => @organization)
  end

  def test_setup
    assert @system_actor.valid?
    assert @customer_category.valid?
  end

  def test_system_actors_fixtures 
    SystemActor.find(:all).each do |item|
      assert item.valid?
      assert item.category.valid?
    end
  end

  def create_customer(params = {})
    Customer.create!(
      {
        :name => "Some Name",
        :cpf => '182.465.232-10',
        :category_id => '20',
        :email => 'test@test.com',
        :organization => @organization
      }.merge(params)
    )
  end

  def test_autocomplete_system_actor_name
    Customer.delete_all
    create_customer(:name => 'test customer', :cpf => '022.779.766-36')
    create_customer(:name => 'another customer', :cpf => '622.783.368-19')
    get :autocomplete_system_actor_name, :system_actor => { :name => 'test'}, :actor => 'customer'
    assert_not_nil assigns(:system_actors)
    assert_kind_of Array, assigns(:system_actors)
    assert_equal 1, assigns(:system_actors).length
  end


  def test_list
    get :list, :actor => 'customer'

    assert_response :success
    assert_template 'list'

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

  def test_create_successfully
    num_customers = Customer.count

    post :create, :actor => 'customer', :system_actor =>{:name=>"Some Name", :cpf => "403.786.765-63", :category_id => "20", :email => "test@mail.com"}


    assert_not_nil assigns(:system_actor)
    assert_not_nil assigns(:actor)
    assert_kind_of Customer, assigns(:system_actor)
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_customers + 1, Customer.count
  end

  def test_create_unsuccessfully
    num_customers = Customer.count

    # At least the name cannot be nil
    post :create, :actor => 'customer', :system_actor =>{:name => nil}


    assert_not_nil assigns(:system_actor)
    assert_not_nil assigns(:actor)
    assert_kind_of Customer, assigns(:system_actor)
    assert_response :success
    assert_template 'new'

    assert_equal num_customers, Customer.count
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

  def test_update_unsuccessfully
    #The name must be diffent of nil
    post :update, :id => @system_actor.id, :actor => 'customer', :system_actor => {:name => nil}
    assert_response :success
      assert_template 'edit'
    assert_not_nil assigns(:actor)
    assert_not_nil assigns(:system_actor)
    assert_kind_of Customer, assigns(:system_actor)
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
