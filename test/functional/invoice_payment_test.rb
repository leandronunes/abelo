module InvoicePaymentTest

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
    
    assert assigns(:invoice)
    assert assigns(:ledger)
    assert assigns(:ledgers)
    assert assigns(:banks)
    assert assigns(:ledger_categories)
  end

  def test_payment_details
     invoice = create_invoice
    get :payment_details, :payment_method => 'money', :id => invoice, :is_new => 'true'

    assert_not_nil assigns(:invoice)
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

    assert assigns(:invoice)
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

    assert assigns(:invoice)
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

    assert assigns(:invoice)
    assert assigns(:ledger)
    assert_not_nil assigns(:ledger).errors
    assert assigns(:ledgers)
    assert assigns(:banks)
    assert assigns(:ledger_categories)
  end


end
