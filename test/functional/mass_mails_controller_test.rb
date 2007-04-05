require File.dirname(__FILE__) + '/../test_helper'
require 'mass_mails_controller'

# Re-raise errors caught by the controller.
class MassMailsController; def rescue_action(e) raise e end; end

class MassMailsControllerTest < Test::Unit::TestCase
  fixtures :mass_mails

  def setup
    @controller = MassMailsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
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

    assert_not_nil assigns(:mass_mails)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:mass_mail)
    assert assigns(:mass_mail).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:mass_mail)
  end

  def test_create
    num_mass_mails = MassMail.count

    post :create, :mass_mail => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_mass_mails + 1, MassMail.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:mass_mail)
    assert assigns(:mass_mail).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil MassMail.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      MassMail.find(1)
    }
  end
end
