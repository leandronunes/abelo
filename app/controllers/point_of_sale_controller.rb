class PointOfSaleController < ApplicationController

  needs_organization

  layout 'point_of_sale'

  verify :method => :post, :only => [ :new, :add_item, :refresh_product, :set_customer ], :redirect_to => { :action => :index }

  skip_before_filter :check_access_control, :only => ['coupon_cancel']

  before_filter :check_coupon_cancel, :only => ['coupon_cancel']
  
  design :holder => :load_point_of_sale

  Design.design_root= 'designs/point_of_sale'

  def load_point_of_sale
    @point_of_sale = DesignPointOfSale.new
    @point_of_sale.design_data = @organization.point_of_sale_design_data
  end

  def check_coupon_cancel
    supervisor = User.authenticate(params[:login], params[:password])
    if supervisor.nil? 
      render_access_denied_screen
    elsif !supervisor.allowed_to?(:controller => 'point_of_sale', :action => 'coupon_cancel')
      render_access_denied_screen
    end
  end

  def index
    @pending_sale = Sale.pending(@organization, current_user)
  end

  def coupon_open
    pending_sale = Sale.pending(@organization, current_user)    
    if pending_sale.nil?
      @sale = Sale.new
      @sale.date = Date.today
      @sale.organization = @organization
      @sale.salesman = current_user
      @sale.save
    else
      @sale = pending_sale
      flash[:notice] = _('You have a pending sale. Close or Cancel it before open a new one')
    end
    @sale_item = SaleItem.new 
    sale_variables
  end


  def refresh_product
    @sale = @organization.sales.find(params[:id])
    @product = @organization.products.find_by_code(params[:product_code])
    @sale_item = SaleItem.new
    @sale_item.product = @product
    flash[:notice] = _('This is not a product code valid') if @product.nil?
    render :partial => 'product_info'
  end

  def coupon_add_item
    @sale = @organization.sales.find(params[:id])
    sale_variables
    begin
      item = SaleItem.new(params[:sale_item])
      item.product = @organization.products.find_by_code(params[:sale_item][:product_code])
      item.valid?
      (item.errors.length != 1) ? raise(ActiveRecord::RecordInvalid) :  @sale.items << item 
    rescue 
#TODO display a notice when something wrong happen
      flash[:notice] = _('There is no product with this code')
    end
    render :partial => 'sale'
  end

  def cancel
    @sale = @organization.sales.find(params[:id])

    if request.post?
      user = User.new(params[:user])
      supervisor =  User.authenticate(user.login, user.password)
      if supervisor.nil?
        flash[:notice] = _('You typed a wrong Login or Password.')
      elsif(can({:controller => 'point_of_sale', :action => 'coupon_cancel'}, supervisor))
        redirect_to :action => 'coupon_cancel', :id => @sale, :login => user.login, :password => user.password
      else
        flash[:notice] = _("You don't have permission to cancel a coupon.")
      end
    else
      unless can(:controller => 'point_of_sale', :action => 'coupon_cancel')
        @user = current_user
        flash[:notice] = _('Only sales supervisor can cancel a coupon') 
      end
    end
    sale_variables
  end


  def coupon_cancel
    @sale = @organization.sales.find(params[:id])
    if @sale.cancel!
      redirect_to :action => 'index'
    else
      sale_variables
      render :action => 'cancel'
    end
  end

  def payment
    @sale = @organization.sales.find(params[:id])
    sale_variables
    @customers = @organization.customers
    @payment_methods = Payment::PAYMENT_METHODS
    @payment = Payment.new(:date => Date.today, :value => @sale.balance)
  end

  def save_customer
    @sale = @organization.sales.find(params[:sale_id])
    @customers = @organization.customers
    @total = @sale.total_value 
    @payment_methods = Payment::PAYMENT_METHODS
    if params[:customer_id].blank?
      @sale.customer = nil
    else
      @sale.customer = @organization.customers.find(params[:customer_id]) 
    end
    @sale.payment_method = 'money'
    @sale.save
    render :partial => 'payment_details'
  end

  def payment_method
    @sale = @organization.sales.find(params[:sale_id])
    @total = @sale.total_value
    @payment = Payment.new 
    @payment.date = Date.today
    @payment.value = @sale.balance
    @sale.payment_method = params['payment_method']
    @banks = Bank.find_all
    render :partial => 'payment_method'
  end

  def coupon_add_payment
    @sale = @organization.sales.find(params[:id])
   
    #FIXME Exist another way to do this more clear
    payment_method = params[:choose_payment]
    if payment_method == 'credit_card'
      @payment = CreditCard.new(params[:payment])
    elsif payment_method == 'debit_card'
      @payment = DebitCard.new(params[:payment])
    elsif payment_method == 'check'
      @payment = Check.new(params[:payment])
    else payment_method == 'money'
      @payment = Money.new(params[:payment])
    end 

    #FIXME see a way to put it on the model
    Payment.transaction do
      @payment.owner = @sale
      ledger = CreditLedger.new
      ledger.date = @payment.date
      ledger.bank_account = @organization.default_bank_account
      ledger.value = @payment.value
      ledger.category_id = 1
      ledger.owner = @sale
      @payment.ledger = ledger
      ledger.save
      @payment.save
    end
    
    @sale = @sale.reload

    if @sale.balance == 0
       flash[:notice] = _('Payment successfully realized.')
      redirect_to :action => :coupon_close, :id => @sale.id
    else
      @payment.value = @sale.balance
      sale_variables
      @customers = @organization.customers
      @payment_methods = Payment::PAYMENT_METHODS
      render :action => 'payment'
    end

  end

  def coupon_close
    @sale = @organization.sales.find(params[:id])
    sale_variables
    @sale.close!      
    redirect_to :action => 'index'
  end

  def add_cash

  end

  def coupon_add_cash

  end

  #TODO remove this when the printer test is finished
  #The file sent to the desktop must be opened by the software
  #test_printer
  def test_printer
     send_data('testando algo',
          :disposition => 'inline',
          :type => 'printer/apy',
          :filename => "printer.apy")
#    redirect_to :action => 'main'
  end

  private

  def sale_variables
    @sale.payment_method = 'money'
    @total = @sale.total_value 
    @total_payment = @sale.total_payment 
    @payments = @sale.payments       
  end

end
