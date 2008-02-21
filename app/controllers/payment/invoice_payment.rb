module InvoicePayment

  def payment_details
    @invoice = @organization.invoices.find(params[:id])
    payment_method = params[:payment_method]
    @ledger = params[:ledger_id].blank? ? Ledger.new(:payment_method => payment_method, :value => @invoice.balance ) : @organization.ledgers(params[:ledger_id])
    @ledger.payment_method = payment_method
    @banks = Bank.find(:all)
    @ledger_categories =  @organization.stock_ledger_categories_by_payment_method(@ledger.payment_method)
    @ledgers = @invoice.ledgers

    if params[:is_new] == 'true'
      render :partial => 'shared_payments/ledgers_and_new_on_table'
    else
      render :partial => 'shared_payments/ledgers_and_edit_on_table'
    end
  end

  def add_payment
    @invoice = @organization.invoices.find(params[:id])
    @ledger = Ledger.new(params[:ledger])
    @ledger.owner = @invoice
    @ledger.bank_account = @organization.default_bank_account
    @banks = Bank.find(:all)
    if @ledger.save
      @ledger = Ledger.new(:date => Date.today)
    end
    @ledgers = @invoice.ledgers
    @ledger_categories =  @organization.stock_ledger_categories_by_payment_method(@ledger.payment_method)
    render :partial => 'shared_payments/new_payment'
  end

  def edit_payment
    @invoice = @organization.invoices.find(params[:id])
    @ledger = @organization.ledgers(params[:ledger_id])
    @banks = Bank.find(:all)
    @ledgers = @invoice.ledgers.reject{|l| l == @ledger}
    @ledger_categories =  @organization.stock_ledger_categories_by_payment_method(@ledger.payment_method)
    render :partial => 'shared_payments/edit_payment'
  end

  def update_payment
    @invoice = @organization.invoices.find(params[:id])
    @ledger = @organization.ledgers(params[:ledger_id])
    @ledgers = @invoice.ledgers
    @banks = Bank.find(:all)
    if @ledger.update_attributes(params[:ledger])
      @ledger = Ledger.new(:date => Date.today)
      @ledger_categories =  @organization.stock_ledger_categories_by_payment_method(@ledger.payment_method)
      render :partial => 'shared_payments/new_payment'
    else
      @ledger_categories =  @organization.stock_ledger_categories_by_payment_method(@ledger.payment_method)
      render :partial => 'shared_payments/edit_payment'
    end
  end


end
