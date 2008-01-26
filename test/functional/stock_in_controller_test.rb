require File.dirname(__FILE__) + '/../test_helper'
require 'stock_controller'

# Re-raise errors caught by the controller.
class StockInController; def rescue_action(e) raise e end; end

class StockInControllerTest < Test::Unit::TestCase

  fixtures :stocks, :system_actors, :products, :configurations, :system_actors, :ledger_categories, :bank_accounts, :categories

  under_organization :one

  def setup
    @controller = StockController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as("quentin")
    @product = Product.find(:first)
    @supplier = Supplier.find(:first)
    @ledger_category = LedgerCategory.find(:first)
    @product_category = ProductCategory.find(:first)
    @organization = Organization.find(:first)
  end

  def create_product(params = {})
    Product.create!({:name => 'product one', :sell_price => 2.0, :unit => 'kg', :organization => @organization, :category => @product_category}.merge(params))
  end

  def create_invoice
    Invoice.create!(:number => 3344, :serie => 33443, :issue_date => Date.today, :supplier => @supplier)
  end

  def create_stock(invoice)
    StockIn.create!(:supplier => @supplier, :amount => 1, :price => 1.99, :invoice => invoice, :product => @product)
  end

  def test_autocomplete_product_name
    Product.delete_all
    create_product(:name => 'product one')
    create_product(:name => 'product test two')
    create_product(:name => 'product test twice')
    get :autocomplete_product_name, :product => { :name => 'test'}
    assert_not_nil assigns(:products)
    assert_kind_of Array, assigns(:products)
    assert_equal 2, assigns(:products).length
  end

  def test_setup
    assert @product.valid?
    assert @supplier.valid?
    assert @ledger_category.valid?
    assert @organization.valid?
    assert @product_category.valid?
    assert @organization.products.include?(@product)
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
    create_product(:name => 'product test two')
    create_product(:name => 'product test twice')
    get :list, :query => '*test*'

    assert_not_nil assigns(:query)
    assert_not_nil assigns(:stocks)
    assert_kind_of Array, assigns(:stocks)
    assert_not_nil assigns(:stock_pages)
    assert_kind_of ActionController::Pagination::Paginator, assigns(:stock_pages)

    assert_equal 2, assigns(:stocks).length
  end
 
  def test_new
    get :new
    assert_response :redirect
    assert_redirected_to :controller => 'stock_in', :action => 'new'
  end

  def test_add
    get :add, :product_id => @product.id

    assert_not_nil assigns(:stock)
    assert_not_nil assigns(:suppliers)
    assert_not_nil assigns(:invoice)
  
    assert_response :success
    assert_template 'add'
  end

  def test_create_with_correct_parameters
    count_stock = StockIn.count
    count_invoice = Invoice.count

    post :create, :product_id => @product.id, :stock => { :supplier => @supplier, :amount => 1, :price => 1.99},  :invoice => {:number => 2323, :serie => 2323, :supplier_id => @supplier.id, :issue_date => Date.today } 

    assert_response :redirect
    assert_redirected_to :action => 'edit'
    assert_equal count_stock + 1, StockIn.count
    assert_equal count_invoice + 1, Invoice.count
  end

  def test_create_with_wrong_parameters
    count = StockIn.count

    post :create, :product_id => @product.id

    assert_response :success
    assert_template 'add'
    assert_equal count, StockIn.count
    assert assigns(:stock)
    assert assigns(:invoice)
    assert assigns(:suppliers)
  end

  def test_edit
    invoice = create_invoice
    stock = create_stock(invoice)
    get :edit, :invoice_id => invoice.id, :stock_id => stock.id

    assert_response :success
    assert_template 'edit'

    assert assigns(:invoice)
    assert assigns(:stock)
    assert assigns(:suppliers)
    assert assigns(:ledgers)
    assert assigns(:ledger)
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
    assert_raise( ActiveRecord::RecordNotFound){
      get :history, :product_id => nil
    }
  end

  def test_add_payment
    get :add_payment, :id => @stock_in.id
    
    assert_response :success
    assert_template '_payment'

    assert assigns(:stock)
    assert assigns(:ledger)
    assert assigns(:ledger_categories)
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

  def test_update_attributes_validity
    stock_id = @stock_in.id
    @stock_in.validity = Date.today
    assert @stock_in.save
    new_date = Date.today + 2
    post :update, :id => @stock_in, :stock => { :validity =>new_date }

    assert_equal new_date, StockIn.find(stock_id).validity
  end


  def test_update_attributes_date
    stock_id = @stock_in.id
    @stock_in.validity=nil
    @stock_in.date = DateTime.now
    assert @stock_in.save!
    new_value = DateTime.now - 1
    post :update, :id => @stock_in, :stock => { :date =>new_value }

    assert_equal new_value.to_time, StockIn.find(stock_id).date
  end


  def test_update_attributes_price
    stock_id = @stock_in.id
    @stock_in.price = 20
    assert @stock_in.save
    new_value = 50
    post :update, :id => @stock_in, :stock => { :price =>new_value }

    assert_equal new_value, StockIn.find(stock_id).price
  end

  def test_update_attributes_amount
    stock_id = @stock_in.id
    @stock_in.amount = 3
    assert @stock_in.save
    new_amount = 2
    post :update, :id => @stock_in, :stock => { :amount =>new_amount }

    assert_equal new_amount, StockIn.find(stock_id).amount
  end

  def test_update_fails
    post :update, :id => @stock_in.id, :stock => { :amount => nil }

    assert_response :success
    assert_template 'edit'

    assert assigns(:suppliers)
    assert assigns(:ledgers)
  end

  def test_destroy
    stock_id = @stock_in.id
    assert @stock_in.product.stocks.length > 1
    get :destroy, :id => @stock_in.id
    assert_raise(ActiveRecord::RecordNotFound) {
      assert StockIn.find(stock_id)
    }
    
    assert_response :redirect
    assert_redirected_to :action => 'history'
  end

  def test_destroy_last_object
    @stock_in.product.stocks.each do |s|
      if s != @stock_in
        s.destroy 
      end
    end
    stock_id = @stock_in.id
    @stock_in = StockIn.find(stock_id)
    assert_equal 1,  @stock_in.product.stocks.length
    get :destroy, :id => @stock_in.id
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_select_category
    get :select_category, :payment_method => 'money'

    assert_not_nil assigns(:ledger)
    assert_not_nil assigns(:banks)
    assert_not_nil assigns(:ledger_categories)
    assert assigns(:hide_sign)
    assert_response :success
    assert_template 'shared_payments/_select_category'
  end

  def test_select_category_without_payment_method
    get :select_category, :payment_method => nil

    assert_response :success
    assert_template nil
  end

  def test_select_category_of_money_payment_method
    get :select_category, :payment_method => 'money'

    assert_kind_of Money, assigns(:ledger)
    assert_response :success
    assert_template 'shared_payments/_select_category'
  end

  def test_select_category_of_check_payment_method
    get :select_category, :payment_method => 'check'

    assert_kind_of Check, assigns(:ledger)
    assert_response :success
    assert_template 'shared_payments/_select_category'
  end

  def test_select_category_of_debit_card_payment_method
    get :select_category, :payment_method => 'debit_card'

    assert_kind_of DebitCard, assigns(:ledger)
    assert_response :success
    assert_template 'shared_payments/_select_category'
  end

  def test_select_category_of_credit_card_payment_method
    get :select_category, :payment_method => 'credit_card'

    assert_kind_of CreditCard, assigns(:ledger)
    assert_response :success
    assert_template 'shared_payments/_select_category'
  end



end
