require File.dirname(__FILE__) + '/../test_helper'
require 'stock_buys_controller'

# Re-raise errors caught by the controller.
class StockBuysController; def rescue_action(e) raise e end; end

class StockBuysControllerTest < ActionController::TestCase

  under_organization :one

  def setup
    User.delete_all
    @organization = create_organization(:identifier => 'one')
    @environment = create_environment(:is_default => true)
    @user = create_user
    login_as(@user.login)

    @bank = create_bank
    @bank_account = create_bank_account
    @product_category = create_product_category
    @unit = create_unit
    @product = create_product()
    @supplier_category = create_supplier_category
    @supplier = create_supplier
    @ledger_category = create_ledger_category(:organization => @organization)
    @invoice = create_invoice
    @stock_buy = create_stock_buy
  end

  def test_setup
    assert @product.valid?
    assert @supplier.valid?
    assert @ledger_category.valid?
    assert @organization.valid?
    assert @product_category.valid?
    assert @organization.products.include?(@product)
    assert @organization.suppliers.include?(@supplier)
    assert @invoice.valid?
    assert @stock_buy.valid?
  end

  def test_autocomplete_invoice_number
    Invoice.delete_all
    create_invoice(:number => 11111111)
    create_invoice(:number => 1112222)
    create_invoice(:number => 33333333)
    get :autocomplete_invoice_number, :invoice => { :number => '11'}
    assert_not_nil assigns(:invoices)
    assert_kind_of Array, assigns(:invoices)
    assert_equal 2, assigns(:invoices).length
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
    assert_not_nil assigns(:invoices)
    assert_not_nil assigns(:invoice_pages)
  end

  def test_list_when_query_param_is_nil
    get :list

    assert_nil assigns(:query)
    assert_not_nil assigns(:invoices)
    assert_kind_of Array, assigns(:invoices)
  end

  def test_list_when_query_param_not_nil
    Invoice.destroy_all
    create_invoice(:number => 11111111)
    create_invoice(:number => 11111222)
    create_invoice(:number => 33333333)
    get :list, :query => '1*'

    assert_not_nil assigns(:query)
    assert_not_nil assigns(:invoices)
    assert_kind_of Array, assigns(:invoices)
    assert_equal 3, Invoice.count
    assert_equal 2, assigns(:invoices).length
  end
 
  def test_new
    get :new
    assert_response :success
    assert_template 'new'
    assert_not_nil assigns(:suppliers)
    assert_not_nil assigns(:invoice)
  end

  def test_create_with_correct_parameters
    count_invoice = Invoice.count

    post :create, :invoice => { :supplier => @supplier, :number => 2321321, :serie => 21321332, :issue_date => Date.today}

    assert_response :redirect
    assert_redirected_to :action => 'edit'
    assert_equal count_invoice + 1, Invoice.count
  end

  def test_create_with_wrong_parameters
    count = Invoice.count

    # The number cannot be nil
    post :create, :invoice => { :supplier => @supplier, :number => nil, :serie => 21321332, :issue_date => Date.today}

    assert_response :success
    assert_template 'new'
    assert_equal count, Invoice.count
    assert assigns(:invoice)
    assert assigns(:suppliers)
  end

  def test_edit
    invoice = create_invoice
    get :edit, :id => invoice.id

    assert_response :success
    assert_template 'edit'

    assert assigns(:invoice)
    assert assigns(:suppliers)
    assert assigns(:products)
    assert assigns(:stocks)
    assert assigns(:stock)
    assert assigns(:ledgers)
    assert assigns(:ledger)
    assert assigns(:payment_object)
    assert assigns(:ledger_categories)
  end

  def test_edit_passing_invoice_id_parameter
    get :edit, :invoice_id => @invoice.id
    assert_response :success
    assert_template 'edit'
    assert assigns(:invoice)
    assert assigns(:suppliers)
    assert assigns(:products)
    assert assigns(:stocks)
    assert assigns(:stock)
    assert assigns(:ledgers)
    assert assigns(:ledger)
    assert assigns(:payment_object)
    assert assigns(:ledger_categories)
  end


  def test_update
    post :update, :id => @invoice.id, :invoice => { :number => 232132 }

    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_update_with_wrong_params
    # Ths invoice number connat be nil
    post :update, :id => @invoice.id, :invoice => { :number => nil }

    assert_response :success
    assert_template 'edit'
    assert assigns(:invoice)
    assert assigns(:suppliers)
    assert assigns(:products)
    assert assigns(:stocks)
    assert assigns(:stock)
    assert assigns(:ledgers)
    assert assigns(:ledger)
    assert assigns(:ledger_categories)
  end

  def test_update_number
    @invoice.number = 32432
    assert @invoice.save
    new_number = 322344
    invoice_id = @invoice.id
    post :update, :id => @invoice.id, :invoice => { :number => new_number }

    assert_equal new_number.to_s, Invoice.find(invoice_id).number
  end

  def test_update_serie
    @invoice.serie = 32432
    assert @invoice.save
    new_serie = 322344
    invoice_id = @invoice.id
    post :update, :id => @invoice.id, :invoice => { :serie => new_serie }

    assert_equal new_serie.to_s, Invoice.find(invoice_id).serie
  end

  def test_update_issue_date
    @invoice.issue_date = DateTime.now
    assert @invoice.save
    new_issue_date = DateTime.now + 1
    invoice_id = @invoice.id
    post :update, :id => @invoice.id, :invoice => { :issue_date => new_issue_date }

    assert_equal new_issue_date.to_s, Invoice.find(invoice_id).issue_date.to_datetime.to_s
  end

  def test_update_status
    @invoice.status = Status::STATUS_PENDING
    assert @invoice.save
    new_status = Status::STATUS_DONE
    invoice_id = @invoice.id
    post :update, :id => @invoice.id, :invoice => { :status => new_status }

    assert_equal new_status, Invoice.find(invoice_id).status
  end

  def test_update_supplier_id
    @invoice.supplier_id = 1
    assert @invoice.save
    new_supplier_id = 2
    invoice_id = @invoice.id
    post :update, :id => @invoice.id, :invoice => { :supplier_id => new_supplier_id }

    assert_equal new_supplier_id, Invoice.find(invoice_id).supplier_id
  end

  def test_show
    get :show, :id => @invoice.id
    assert_response :success
    assert_template 'show'
    assert_not_nil assigns(:invoice)
    assert_not_nil assigns(:stocks)
  end

  def test_show_passing_invoice_id_parameter
    get :show, :invoice_id => @invoice.id
    assert_response :success
    assert_template 'show'
    assert_not_nil assigns(:invoice)
    assert_not_nil assigns(:stocks)
  end

  def test_destroy
    invoice_id = @invoice.id
    get :destroy, :id => @invoice.id
    assert_raise(ActiveRecord::RecordNotFound) {
      assert Invoice.find(invoice_id)
    }
    
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  ########################################################
  #  Test Invoice Items
  ########################################################

  def test_add_item
    count = StockBuy.count
    get :add_item, :id => @invoice.id, :stock => {:amount => 344, :product => @product, :price => 23}
    assert_response :success
    assert_template '_invoice_new_items'
    assert_equal count + 1, StockBuy.count
    assert assigns(:invoice)
    assert assigns(:stocks)
    assert assigns(:stock)
    assert assigns(:products)
  end

  def test_add_item_with_wrong_parameters
    count = StockBuy.count
    # The price must be different of zero
    get :add_item, :id => @invoice.id, :stock => {:amount => 344, :product => @product, :price => nil}
    assert_response :success
    assert_template '_invoice_new_items'
    assert_equal count, StockBuy.count
    assert assigns(:invoice)
    assert assigns(:stocks)
    assert assigns(:stock)
    assert assigns(:products)
  end

  def test_edit_item
    stock = create_stock_buy
    get :edit_item, :id => @invoice.id, :stock_id => stock.id
    assert_response :success
    assert_template '_invoice_edit_items'
    assert assigns(:invoice)
    assert assigns(:stocks)
    assert assigns(:stock)
    assert assigns(:products)
  end

  def test_update_item
    stock = create_stock_buy
    get :update_item, :id => @invoice.id, :stock_id => stock.id, :stock => {:price => 3423}
    assert_response :success
    assert_template '_invoice_new_items'
    assert assigns(:invoice)
    assert assigns(:stocks)
    assert assigns(:stock)
    assert assigns(:stock).new_record?
    assert assigns(:products)
  end

  def test_update_item_with_wrong_params
    stock = create_stock_buy
    # The price cannot be nil
    get :update_item, :id => @invoice.id, :stock_id => stock.id, :stock => {:price => nil}
    assert_response :success
    assert_template '_invoice_edit_items'
    assert assigns(:invoice)
    assert assigns(:stocks)
    assert assigns(:stock)
    assert assigns(:products)
  end

  ########################################################
  #  Test Invoice Payment Module On StockBuy Controller
  ########################################################

  def test_payment_details_without_payment_method_on_new_ledger_action
    invoice = create_invoice
    get :payment_details, :payment_method => nil, :id => invoice, :is_new => 'true'
  
    assert_response :success
    assert_template 'shared_payments/_ledgers_and_new_on_table'
  end 
    
  def test_payment_details_without_payment_method_on_edit_ledger_action
    invoice = create_invoice
    get :payment_details, :payment_method => nil, :id => invoice, :is_new => false

    assert_response :success
    assert_template 'shared_payments/_ledgers_and_edit_on_table'
  end

  def test_payment_details_of_money_payment_method
    invoice = create_invoice
    get :payment_details, :payment_method => Payment::MONEY, :id => invoice, :is_new => 'true'

    assert_equal Payment::MONEY, assigns(:ledger).payment_method
    assert_response :success
    assert_template 'shared_payments/_ledgers_and_new_on_table'
  end
    
  def test_payment_details_of_check_payment_method
    invoice = create_invoice
    get :payment_details, :payment_method => Payment::CHECK, :id => invoice, :is_new => 'true'
  
    assert_equal Payment::CHECK, assigns(:ledger).payment_method
    assert_response :success
    assert_template 'shared_payments/_ledgers_and_new_on_table'
  end
    
  def test_payment_details_of_debit_card_payment_method
    invoice = create_invoice
    get :payment_details, :payment_method => Payment::DEBIT_CARD, :id => invoice, :is_new => 'true'
  
    assert_equal Payment::DEBIT_CARD, assigns(:ledger).payment_method
    assert_response :success
    assert_template 'shared_payments/_ledgers_and_new_on_table'
  end

 def test_payment_details_of_credit_card_payment_method
    invoice = create_invoice
    get :payment_details, :payment_method => Payment::CREDIT_CARD, :id => invoice, :is_new => 'true'

    assert_equal Payment::CREDIT_CARD, assigns(:ledger).payment_method
    assert_response :success
    assert_template 'shared_payments/_ledgers_and_new_on_table'
  end

  def test_edit_payment
    invoice = create_invoice
    ledger = create_ledger(:owner => invoice)
    get :edit_payment, :id => invoice.id, :ledger_id => ledger.id

    assert_response :success
    assert_template 'shared_payments/_edit_payment'

    assert assigns(:payment_object)
    assert assigns(:ledger)
    assert assigns(:ledgers)
    assert assigns(:banks)
    assert assigns(:ledger_categories)
  end

  def test_payment_details
     invoice = create_invoice
    get :payment_details, :payment_method => 'money', :id => invoice, :is_new => 'true'

    assert_not_nil assigns(:payment_object)
    assert_not_nil assigns(:ledger)
    assert_not_nil assigns(:ledgers)
    assert_not_nil assigns(:banks)
    assert_not_nil assigns(:ledger_categories)
    assert_response :success
    assert_template 'shared_payments/_ledgers_and_new_on_table'
  end
 def test_update_payment_with_correct_params
    invoice = create_invoice
    ledger = create_ledger(:owner => invoice)
    get :update_payment, :id => invoice.id, :ledger_id => ledger.id, :ledger => {:value => 323}

    assert_response :success
    assert_template 'shared_payments/_new_payment'

    assert assigns(:payment_object)
    assert assigns(:ledger)
    assert assigns(:ledgers)
    assert assigns(:banks)
    assert assigns(:ledger_categories)
  end

  def test_add_payment_with_correct_params
    invoice = create_invoice
    get :add_payment, :id => invoice.id, :ledger => {:payment_method => 'money', :category => @ledger_category, :value => 343, :date => Date.today}

    assert_response :success
    assert_template 'shared_payments/_new_payment'

    assert assigns(:payment_object)
    assert assigns(:ledger)
    assert_equal 0, assigns(:ledger).errors.length
    assert assigns(:ledgers)
    assert assigns(:banks)
    assert assigns(:ledger_categories)
  end

  def test_add_payment_with_wrong_params
    invoice = create_invoice
    # The value coudld not be nil.
    get :add_payment, :id => invoice.id, :ledger => {:payment_method => 'money', :category => @ledger_category, :value => nil}

    assert_response :success
    assert_template 'shared_payments/_new_payment'

    assert assigns(:payment_object)
    assert assigns(:ledger)
    assert_not_nil assigns(:ledger).errors
    assert assigns(:ledgers)
    assert assigns(:banks)
    assert assigns(:ledger_categories)
  end


end
