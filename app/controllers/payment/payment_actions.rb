module PaymentActions

  def payment_details
    @payment_object = payment_object
    payment_method = params[:payment_method]
    @ledger = params[:ledger_id].blank? ? Ledger.new(:payment_method => payment_method, :value => @payment_object.balance ) : @organization.ledgers(params[:ledger_id])
    @ledger.payment_method = payment_method
    @banks = Bank.find(:all)
    @ledger_categories =  @organization.stock_ledger_categories_by_payment_method(@ledger.payment_method)
    @ledgers = @payment_object.ledgers

    if params[:is_new] == 'true'
      render :partial => 'shared_payments/ledgers_and_new_on_table'
    else
      render :partial => 'shared_payments/ledgers_and_edit_on_table'
    end
  end

  def add_payment
    @payment_object = payment_object
    @ledger = Ledger.new(params[:ledger].merge(:owner => @payment_object, :organization => @organization))
    @banks = Bank.find(:all)
    if @ledger.save
      @ledger = Ledger.new(:date => Date.today)
    end
    @ledgers = @payment_object.ledgers
    @ledger_categories =  @organization.stock_ledger_categories_by_payment_method(@ledger.payment_method)
    render :partial => 'shared_payments/new_payment'
  end

  def edit_payment
    @payment_object = payment_object
    @ledger = @organization.ledgers.find(params[:ledger_id])
    @banks = Bank.find(:all)
    @ledgers = @payment_object.ledgers.reject{|l| l == @ledger}
    @ledger_categories =  @organization.stock_ledger_categories_by_payment_method(@ledger.payment_method)
    render :partial => 'shared_payments/edit_payment'
  end

  def update_payment
    @payment_object = payment_object
    @ledger = @organization.ledgers.find(params[:ledger_id])
    @ledgers = @payment_object.ledgers
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
