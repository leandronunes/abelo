require File.dirname(__FILE__) + '/../test_helper'
require 'stock_devolutions_controller'

# Re-raise errors caught by the controller.
class StockDevolutionsController; def rescue_action(e) raise e end; end

class StockDevolutionsControllerTest < Test::Unit::TestCase

  under_organization :some

  def setup
    @controller = StockDevolutionsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization = create_organization(:identifier => 'some')
    @product_category = create_product_category
    @product = create_product
    login_as("quentin")
  end

  def test_setup
    assert @product.valid?
    assert @organization.valid?
    assert @product_category.valid?
  end

  def test_autocomplete_supplier_name
    Supplier.destroy_all
    create_supplier(:name => 'test one', :cpf => '112.767.281-90')
    create_supplier(:name => 'test two', :cpf => '546.261.286-96')
    create_supplier(:name => 'another one', :cpf => '687.618.228-25')
    get :autocomplete_supplier_name, :supplier => {:name => 'test'}
    assert_response :success
    assert_template 'stock_base/autocomplete_supplier_name'
    assert_not_nil assigns(:suppliers)
    assert_kind_of Array, assigns(:suppliers)
    assert_equal 2, assigns(:suppliers).length
  end

  def test_autocomplete_product_name
    Product.destroy_all
    create_product(:name => 'product one')
    create_product(:name => 'product two')
    create_product(:name => 'another')
    get :autocomplete_product_name, :product => {:name => 'product'}
    assert_response :success
    assert_template 'stock_base/autocomplete_product_name'
    assert_not_nil assigns(:products)
    assert_kind_of Array, assigns(:products)
    assert_equal 2, assigns(:products).length
  end

  def test_index
    get :index
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_list
    get :list
    assert_response :success
    assert_template 'stock_base/list'
    assert_not_nil assigns(:stocks)
    assert_not_nil assigns(:title)
    assert_not_nil assigns(:stock_pages)
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
    create_product(:name => 'product one')
    create_product(:name => 'product two')
    create_product(:name => 'another')
    get :list, :query => 'product*'

    assert_not_nil assigns(:query)
    assert_not_nil assigns(:stocks)
    assert_kind_of Array, assigns(:stocks)
    assert_not_nil assigns(:stock_pages)
    assert_kind_of ActionController::Pagination::Paginator, assigns(:stock_pages)

    assert_equal 2, assigns(:stocks).length
  end
 
  def test_new
    get :new
    assert_response :success
    assert_template 'stock_base/new'
    assert_not_nil assigns(:products)
    assert_not_nil assigns(:title)
    assert_not_nil assigns(:stock)
  end

  def test_new_with_product_id_param
    get :new, :product_id => @product.id
    assert_response :redirect
    assert_redirected_to :action => 'add'
  end

  def test_add
    get :add, :product_id => @product.id
    assert_response :success
    assert_template 'stock_base/add'
    assert_not_nil assigns(:stock)
    assert_not_nil assigns(:title)
    assert_equal @product, assigns(:stock).product
  end

  def test_create
    count_stock = StockDevolution.count

    post :create, :stock => { :product_id => @product.id, :amount => 1, :date => Date.today}

    assert_response :redirect
    assert_redirected_to :action => 'history'
    assert_equal count_stock + 1, StockDevolution.count
  end

  def test_create_with_wrong_params_of_add_action
    count_stock = StockDevolution.count

    # The amount cannot be nil
    post :create, :stock => { :product_id => @product.id, :amount => nil, :date => Date.today}, :product_id => @product.id

    assert_response :success
    assert_template 'stock_base/add'
  end

  def test_create_with_wrong_parameters
    count_stock = StockDevolution.count
    # The amount cannot be nil
    post :create, :stock => { :product_id => @product.id, :amount => nil, :date => Date.today}

    assert_response :success
    assert_template 'stock_base/new'
    assert_not_nil assigns(:stock)
    assert_not_nil assigns(:title)
    assert_not_nil assigns(:stock).errors
    assert_equal count_stock, StockDevolution.count
  end

  def test_history
    get :history, :product_id => @product.id
    assert_response :success
    assert_template 'stock_base/history'
    assert_not_nil assigns(:stocks)
    assert_not_nil assigns(:product)
    assert_not_nil assigns(:title)
  end

  def test_destroy
    stock = create_stock_devolution
    stock_id = stock.id
    get :destroy, :id => stock.id
    assert_raise(ActiveRecord::RecordNotFound) {
      assert StockDevolution.find(stock_id)
    }
    
    assert_response :redirect
    assert_redirected_to :action => 'history'
  end

  def test_show
    stock = create_stock_devolution
    get :show, :id => stock.id
    assert_response :success
    assert_template 'stock_base/show'
    assert_not_nil assigns(:stock)
  end

  def test_edit
    stock = create_stock_devolution
    get :edit, :id => stock.id

    assert_response :success
    assert_template 'stock_base/edit'

    assert_not_nil assigns(:title)
    assert assigns(:stock)
    assert assigns(:products)
  end

  def test_update
    stock = create_stock_devolution
    post :update, :id => stock.id, :stock => { :date => Date.today }

    assert_response :redirect
    assert_redirected_to :action => 'history'
  end

  def test_update_with_wrong_params
    stock = create_stock_devolution
    # The date could not be nil
    post :update, :id => stock.id, :stock => { :date => nil }

    assert_response :success
    assert_template 'stock_base/edit'
    assert_not_nil assigns(:stock)
    assert_not_nil assigns(:title)
    assert_not_nil assigns(:products)
  end

  def test_update_date
    stock = create_stock_devolution
    stock.date = DateTime.now
    new_date = DateTime.now + 1
    
    post :update, :id => stock.id, :stock => { :date => new_date }

    assert_equal new_date.to_s, StockDevolution.find(stock.id).date.to_datetime.to_s
  end

  def test_update_product
    stock = create_stock_devolution
    stock.product_id = 1
    new_product_id = 2
    
    post :update, :id => stock.id, :stock => { :product_id => new_product_id }

    assert_equal new_product_id, StockDevolution.find(stock.id).product_id
  end

  def test_update_amount
    stock = create_stock_devolution
    stock.amount = 1
    new_amount = 34
    
    post :update, :id => stock.id, :stock => { :amount => new_amount }

    assert_equal new_amount, StockDevolution.find(stock.id).amount
  end

end
