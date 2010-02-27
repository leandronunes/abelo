require File.dirname(__FILE__) + '/../test_helper'
require 'mass_mails_controller'

# Re-raise errors caught by the controller.
class MassMailsController; def rescue_action(e) raise e end; end

class MassMailsControllerTest < ActionController::TestCase

  under_organization :one

  def setup
    @user = create_user(:login => 'admin', :administrator => true)
    login_as("admin")
    @organization = Organization.find_by_identifier('one')
    @environment = create_environment(:is_default => true)
    @mass_mail = create_mass_mail
    @customer_category = create_customer_category
    @customer_1 = create_customer(:cpf => '022.779.766-36')
    @customer_2 = create_customer(:cpf => '622.783.368-19')
  
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
  end

  def test_setup
    assert @organization.valid?
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
    assert_not_nil assigns(:mass_mails)
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'
    assert_not_nil assigns(:mass_mails)
    assert_kind_of Array, assigns(:mass_mails)
  end

  def test_show
    get :show, :id => @mass_mail.id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:mass_mail)
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:mass_mail)
  end

  def test_create
    num_mass_mails = @organization.mass_mails.count

    post :create, :mass_mail => { :subject => "New email", :body => "bla  bla bla", :organization_id => 1}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_mass_mails + 1, @organization.mass_mails.count
  end

 
  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:mass_mail)
    assert assigns(:mass_mail).valid?
  end

  def test_update
    post :update, :id => @mass_mail.id
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_destroy
    assert_not_nil @organization.mass_mails.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      @organization.mass_mails.find(1)
    }
  end

  def test_filter_categories
    get :filter_categories, :id => @mass_mail.id

    assert_response :success
    assert_template 'filter_categories'

    assert_not_nil assigns(:mass_mail)
    assert assigns(:mass_mail).valid?
  end

#  def test_filter_customers
#    post :filter_customers, :id => 1, :categories => {2 => "1"}
#    assert_equal 2, assigns(:customers).length
#  end

  def test_send_emails
    num_deliveries = ActionMailer::Base.deliveries.size
    post :send_emails, :id => @mass_mail, :customers => {@customer_1.id => "1", @customer_2.id => "1"}
    assert_equal num_deliveries+1, ActionMailer::Base.deliveries.size
    assert_equal 2, assigns(:emails).length
  end

#TODO fix these tests
#  def test_filter_customer_by_categories
#    get :filter_customers, :id => 1, :categories => {@category1.id => "1", @category2.id => "1"}

#    assert_response :success
#    assert_template 'filter_customers'

#    customers = []
#    customers.push(@customer)
#    customers.push(@customer2)

#    assert_equal customers, assigns(:customers)

#  end

#  def test_filter_customer_by_products
#    get :filter_customers, :id => 1, :products => {"1" => "1", "2" => "1"}

#    assert_response :success
#    assert_template 'filter_customers'
#
#    customers = []
#    customers.push(Customer.find(1))
#
#    assert_equal customers, assigns(:customers)
#
#  end
#
# 
#  def test_filter_customer_by_categories_and_products
#    get :filter_customers, :id => 1, :categories => {@category1.id => "1", @category2.id => "1"}, :products => {"1" => "1", "2" => "1"}
#
#    assert_response :success
#    assert_template 'filter_customers'
#
#    customers = []
#    customers.push(@customer)
#
#    assert_equal customers, assigns(:customers)
#
#  end

end
