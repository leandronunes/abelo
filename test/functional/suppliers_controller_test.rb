require File.dirname(__FILE__) + '/../test_helper'
require 'system_actors_controller'

# Re-raise errors caught by the controller.
class SystemActorsController; def rescue_action(e) raise e end; end

class SuppliersControllerTest < Test::Unit::TestCase

  include TestingUnderOrganization

  fixtures :organizations, :system_actors, :categories, :configurations

  def setup
    @controller = SystemActorsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization_nickname = 'one'
    @organization = Organization.find_by_identifier 'one'
    login_as("quentin")
    @system_actor = Supplier.create!(:name => "Another Name to Test", :cpf => '874.923.844-24', :category_id => '20', :email => 'test@test.com', :organization_id => 1)
  end

  def test_system_actors_fixtures 
    SystemActor.find(:all).each do |item|
      assert item.valid?
      assert item.category.valid?
    end
  end

  def create_supplier(params = {})
    Supplier.create!(
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
    Supplier.delete_all
    create_supplier(:name => 'test supplier', :cpf => '022.779.766-36')
    create_supplier(:name => 'another supplier', :cpf => '622.783.368-19')
    get :autocomplete_system_actor_name, :system_actor => { :name => 'test'}, :actor => 'supplier'
    assert_not_nil assigns(:system_actors)
    assert_kind_of Array, assigns(:system_actors)
    assert_equal 1, assigns(:system_actors).length
  end


  def test_list
    get :list, :actor => 'supplier'

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:system_actor_pages)
    assert_not_nil assigns(:system_actors)
    assert_kind_of Array, assigns(:system_actors)
    assigns(:system_actors).each  do |s|
      assert_kind_of Supplier, s
      assert s.valid?
    end
  end

  def test_new
    get :new, :actor => 'supplier'

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:system_actor)
    assert_not_nil assigns(:actor)
    assert_kind_of Supplier, assigns(:system_actor)
    assert_equal @organization, assigns(:system_actor).organization
  end

  def test_create_successfully
    num_suppliers = Supplier.count

    post :create, :actor => 'supplier', :system_actor =>{:name=>"Some Name", :cpf => "403.786.765-63", :category_id => "20", :email => "test@mail.com"}


    assert_not_nil assigns(:system_actor)
    assert_not_nil assigns(:actor)
    assert_kind_of Supplier, assigns(:system_actor)
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_suppliers + 1, Supplier.count
  end

  def test_create_unsuccessfully
    num_suppliers = Supplier.count

    # At least the name cannot be nil
    post :create, :actor => 'supplier', :system_actor =>{:name => nil}


    assert_not_nil assigns(:system_actor)
    assert_not_nil assigns(:actor)
    assert_kind_of Supplier, assigns(:system_actor)
    assert_response :success
    assert_template 'new'

    assert_equal num_suppliers, Supplier.count
  end


  def test_edit
    get :edit, :id => @system_actor.id, :actor => 'supplier'

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:system_actor)
    assert assigns(:system_actor).valid?
    assert_kind_of Supplier, assigns(:system_actor)
    assert_not_nil assigns(:actor)
  end

  def test_update_successfully
    post :update, :id => @system_actor.id, :actor => 'supplier'
    assert_response :redirect
    assert_redirected_to :action => 'list', :actor => 'supplier'
    assert_not_nil assigns(:system_actor)
    assert assigns(:system_actor).valid?
    assert_kind_of Supplier, assigns(:system_actor)
    assert_not_nil assigns(:actor)
  end

  def test_update_unsuccessfully
    #The name must be different of nil
    post :update, :id => @system_actor.id, :actor => 'supplier', :system_actor => {:name => nil}
    assert_response :success
    assert_template 'edit'
    assert_not_nil assigns(:actor)
    assert_not_nil assigns(:system_actor)
    assert_kind_of Supplier, assigns(:system_actor)
  end


  def test_destroy
    assert_not_nil @system_actor

    post :destroy, :id => @system_actor.id, :actor => 'supplier'
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Supplier.find(@system_actor.id)
    }
  end

end
