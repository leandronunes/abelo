require File.dirname(__FILE__) + '/../test_helper'
require 'stock_controller'

# Re-raise errors caught by the controller.
class StockController; def rescue_action(e) raise e end; end

class StockControllerTest < Test::Unit::TestCase

  fixtures :stocks, :system_actors, :products, :configurations, :system_actors, :ledger_categories, :bank_accounts

  under_organization :one

  def setup
    @controller = StockController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as("quentin")
    @product = Product.find(:first)
    @supplier = Supplier.find(:first)
    @ledger_category = LedgerCategory.find(:first)
    @stock_in = StockIn.find(:first)
  end

  def test_setup
    assert @product.valid?
    assert @supplier.valid?
    assert @ledger_category.valid?
    assert @stock_in.valid?
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

    assert_not_nil assigns(:stocks)
    assert_kind_of Array, assigns(:stocks)
  end

  def test_list_when_query_param_is_nil
    get :list

    assert_nil assigns(:query)
    assert_not_nil assigns(:stocks)
    assert_kind_of Array, assigns(:stocks)
    assert_not_nil assigns(:stock_pages)
    assert_kind_of ActionController::Pagination::Paginator, assigns(:stock_pages)
  end

  def test_list_when_query_param_not_nil
    Product.delete_all
    Product.create!(:name => 'Some Product', :sell_price => '20', :unit => 'U', :organization_id => 1, :category_id => 1, :code => 1)
    Product.create!(:name => 'Another Product', :sell_price => '25', :unit => 'U', :organization_id => 1, :category_id => 1, :code => 2)
    Product.create!(:name => 'Product Three', :sell_price => '30', :unit => 'U', :organization_id => 1, :category_id => 1, :code => 3)
    get :list, :query => 'Another*'

    assert_not_nil assigns(:query)
    assert_not_nil assigns(:stocks)
    assert_kind_of Array, assigns(:stocks)
    assert_not_nil assigns(:stock_pages)
    assert_kind_of ActionController::Pagination::Paginator, assigns(:stock_pages)

    assert_equal 1, assigns(:stocks).size
  end
  
  def test_history
    get :history, :product_id => @product.id

    assert_not_nil assigns(:product)
    assert_not_nil assigns(:stocks)
    assert_kind_of Array, assigns(:stocks)

    assert_response :success
    assert_template 'history'
  end

  def test_history_with_wrong_product_id
    get :history, :product_id => nil

    assert_response :redirect
    assert_redirected_to :action => 'index'
  end


  def test_new_with_product_id_parameter
    get :new, :product_id => @product.id

    assert_not_nil assigns(:stock)
    assert_not_nil assigns(:suppliers)
  
    assert_response :success
    assert_template 'new'
  end

  def test_new_without_product_id_parameter
    get :new

    assert_response :redirect
    assert_redirected_to :controller => 'products', :action => 'new'
  end



  def test_create_with_correct_parameters
    count = StockIn.count

    post :create, :product_id => @product.id, :stock => { :supplier => @supplier, :amount => 1, :price => 1.99, :validity => Date.today, :date => Date.today},  :ledger => {:category => @ledger_category, :payment_method => 'money' } 

    assert_response :redirect
    assert_redirected_to :action => 'history'
    assert_equal count + 1, StockIn.count
  end

  def test_create_with_wrong_parameters
    count = StockIn.count

    post :create, :product_id => @product.id

    assert_response :success
    assert_template '_form'
    assert_equal count, StockIn.count
    assert assigns(:ledgers)
    assert assigns(:suppliers)
  end

  def test_add_payment
    get :add_payment, :id => @stock_in.id
    
    assert_response :success
    assert_template '_payment'

    assert assigns(:stock)
    assert assigns(:product)
    assert assigns(:ledger)
    assert assigns(:banks)
    assert assigns(:ledger_categories)
  end

  def test_edit
    get :edit, :id => @stock_in.id

    assert_response :success
    assert_template 'edit'

    assert assigns(:stock)
    assert assigns(:product)
    assert assigns(:suppliers)
    assert assigns(:ledgers)

  end

  def test_update
    stock_id = @stock_in.id
    @stock_in.amount = 3
    assert @stock_in.save
    new_amount = 2
    post :update, :id => @stock_in, :stock => { :amount =>new_amount }

    assert_response :redirect
    assert_redirected_to :action => 'history'

    assert_equal new_amount, StockIn.find(stock_id).amount
  end

  def test_attributes_updated
#TODO test all atttributes os sotck were successfully updated
    assert flunk  
  end

  def test_update_fails
    post :update, :id => @stock_in.id, :stock => { :amount => nil }

    assert_response :success
    assert_template 'edit'

    assert assigns(:suppliers)
    assert assigns(:ledgers)
  end

end
