require File.dirname(__FILE__) + '/../test_helper'
require 'mass_mails_controller'

# Re-raise errors caught by the controller.
class MassMailsController; def rescue_action(e) raise e end; end

class MassMailsControllerTest < Test::Unit::TestCase

  include TestingUnderOrganization

  fixtures :mass_mails, :organizations, :products

  under_organization :one

#TODO make this test
  def test_true
    assert true
  end



#  def setup
#    @controller = MassMailsController.new
#    @request    = ActionController::TestRequest.new
#    @response   = ActionController::TestResponse.new
#    @organization_nickname = 'one'
#    @organization = Organization.find_by_nickname 'one' 
#
#    @category1 = CustomerCategory.create!(:name => 'category test 1', :organization_id => 1)
#    @category2 = CustomerCategory.create!(:name => 'category test 2', :organization_id => 1)
#
#    @customer = Customer.create!(:name => "teste", :email => "teste@email.com", :organization_id => 1, 
#                                :category => @category1, :cpf => "01652747516", :rg => "0992383145", 
#                                :birthday => "1982-03-05")
#    @customer2 = Customer.create!(:name => "teste2", :email => "teste2@email.com", :organization_id => 1, 
#                                :category => @category1, :cnpj => "00000000000191", :birthday => "1982-03-05")
#
##    @product = Product.new
##    @product.name = "product test 1"
##    @product.sell_price = 10
##    @product.unit = false
##    @product.organization_id = 1
##    @product.category_id = 1
##    @product.save
#
#    @sale = Sale.new
#    @sale.organization_id = 1
#    @sale.customer_id = 1
#    @sale.date = "2007-07-07"
#    @sale.status = 0
#    @sale.user_id = 1
#    assert @sale.save
#
#    @sale_item = SaleItem.new
#    @sale_item.sale_id = 1
#    @sale_item.product_id = 1
#    @sale_item.amount = 15
##    @sale_item.unitary_price = 12
#    assert @sale_item.save
#
#    login_as("quentin")
#
#    ActionMailer::Base.delivery_method = :test
#    ActionMailer::Base.perform_deliveries = true
#    ActionMailer::Base.deliveries = []
#  end
#
#  def test_index
#    get :index
#    assert_response :success
#    assert_template 'list'
#    assert_not_nil assigns(:mass_mails)
#  end
#
#  def test_list
#    get :list
#
#    assert_response :success
#    assert_template 'list'
#    assert_not_nil assigns(:mass_mails)
#    assert_kind_of Array, assigns(:mass_mails)
#  end
#
#  def test_show
#    get :show, :id => 1
#
#    assert_response :success
#    assert_template 'show'
#
#    assert_not_nil assigns(:mass_mail)
#    assert assigns(:mass_mail).valid?
#  end
#
#  def test_new
#    get :new
#
#    assert_response :success
#    assert_template 'new'
#
#    assert_not_nil assigns(:mass_mail)
#  end
#
#  def test_create
#    num_mass_mails = @organization.mass_mails.count
#
#    post :create, :mass_mail => { :subject => "New email", :body => "bla  bla bla", :organization_id => 1}
#
#    assert_response :redirect
#    assert_redirected_to :action => 'list'
#
#    assert_equal num_mass_mails + 1, @organization.mass_mails.count
#  end
#
##TODO make this test
##  def test_edit
##    get :edit, :id => 1
##
##    assert_response :success
##    assert_template 'edit'
##
##    assert_not_nil assigns(:mass_mail)
##    assert assigns(:mass_mail).valid?
##  end
#
#  def test_update
#    post :update, :id => 1
#    assert_response :redirect
#    assert_redirected_to :action => 'list'
#  end
#
#  def test_destroy
#    assert_not_nil @organization.mass_mails.find(1)
#
#    post :destroy, :id => 1
#    assert_response :redirect
#    assert_redirected_to :action => 'list'
#
#    assert_raise(ActiveRecord::RecordNotFound) {
#      @organization.mass_mails.find(1)
#    }
#  end
#
#  def test_filter_categories
#    get :filter_categories, :id => 1
#
#    assert_response :success
#    assert_template 'filter_categories'
#
#    assert_not_nil assigns(:mass_mail)
#    assert assigns(:mass_mail).valid?
#  end
#
##  def test_filter_customers
##    post :filter_customers, :id => 1, :categories => {2 => "1"}
##    assert_equal 2, assigns(:customers).length
##  end
#
#  def test_send_emails
#    num_deliveries = ActionMailer::Base.deliveries.size
#    post :send_emails, :id => 1, :customers => {1 => "1", 2 => "1"}
#    assert_equal num_deliveries+1, ActionMailer::Base.deliveries.size
#    assert_equal 2, assigns(:emails).length
#  end
#
#  def test_filter_customer_by_categories
#    get :filter_customers, :id => 1, :categories => {@category1.id => "1", @category2.id => "1"}
#
#    assert_response :success
#    assert_template 'filter_customers'
#
#    customers = []
#    customers.push(@customer)
#    customers.push(@customer2)
#
#    assert_equal customers, assigns(:customers)
#
#  end
#Make this test
#  def test_filter_customer_by_products
#    get :filter_customers, :id => 1, :products => {"1" => "1", "2" => "1"}
#
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
#TODO make this test
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
