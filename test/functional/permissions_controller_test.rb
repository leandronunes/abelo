require File.dirname(__FILE__) + '/../test_helper'
require 'permissions_controller'

# Re-raise errors caught by the controller.
class PermissionsController; def rescue_action(e) raise e end; end

class PermissionsControllerTest < Test::Unit::TestCase

  include TestingUnderOrganization
  fixtures :organizations, :profiles, :configurations, :people

  under_organization :one

#TODO make these tests works
  def test_true
    assert true
  end

  def setup
    @controller = PermissionsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization = Organization.find_by_identifier 'one'
    @organization_nickname = 'one'
    login_as('quentin')
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

    assert_not_nil assigns(:users)
  end

  def test_list_when_query_param_is_nil
    get :list

    assert_nil assigns(:query)
    assert_not_nil assigns(:users)
    assert_kind_of Array, assigns(:users)
    assert_not_nil assigns(:user_pages)
    assert_kind_of ActionController::Pagination::Paginator, assigns(:user_pages)
  end

  def test_list_when_query_param_not_nil
    User.delete_all
    User.create!("administrator"=>false, "login"=>"quentin", "email"=>"quentin@example.com", :password => 'test', :password_confirmation => 'test')
    User.create!("administrator"=>false, "login"=>"jose", "email"=>"j@example.com", :password => 'test', :password_confirmation => 'test')
    User.create!("administrator"=>false, "login"=>"tadeu", "email"=>"t@example.com", :password => 'test', :password_confirmation => 'test')
    get :list, :query => 'que*'

    assert_not_nil assigns(:query)
    assert_not_nil assigns(:users)
    assert_kind_of Array, assigns(:users)
    assert_not_nil assigns(:user_pages)
    assert_kind_of ActionController::Pagination::Paginator, assigns(:user_pages)

    assert_equal 1, assigns(:users).size
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:user)
    assert assigns(:user).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:user)
  end

  def test_create_correct_params
    num_users = User.count

    post :create, :user => {:login => "josias", :email => "t@example.com", :password => 'test', :password_confirmation => 'test' }, :user_profile => {:template => 'financial'}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_users + 1, User.count
  end

  def test_create_wrong_params
    num_user = User.count

    post :create, :user => {}

    assert_response :success
    assert_template 'new'

    assert_equal num_user, User.count
  end

  def test_edit
    get :edit, :id => 1, :user_profile => {:template => 'financial'}

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:user)
    assert assigns(:user).valid?
  end

  def test_update
    post :update, :id => 1, :user => {:login => 'test'}, :user_profile => {:template => 'financial'}

    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

#  def test_update_with_wrong_params
#    user = User.new
#    user.login = "joazinho"
#    user.email = "joao@example.com"
#    user.password = 'test'
#    user.password_confirmation = 'test'
#    assert user.save
#
#    post :update, :id => user.id , :user => {:login => 'a'}, :user_profile => {:template => nil} 
#
#    assert_response :success
#    assert_not_nil assigns(:user)
#    assert_template 'edit'
#  end





#  def test_destroy
#    count = Profile.count
#    assert count > 0
#    post :destroy, :id => 3
#    assert_raise(ActiveRecord::RecordNotFound) do
#      Profile.find(3)
#    end
#    assert_equal count - 1, Profile.count
#  end

end
