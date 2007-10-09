class PointOfSaleController < ApplicationController

  needs_organization

  layout 'point_of_sale'

  post_only [ :new, :add_item, :refresh_product, :coupon_cancel ]

  skip_before_filter :check_access_control, :only => ['coupon_cancel']

  before_filter :check_coupon_cancel, :only => ['coupon_cancel']
  
  Design.design_root= 'designs/point_of_sale'

  design :holder => :design_point_of_sale

  def design_point_of_sale
    point_of_sale = DesignPointOfSale.new 
    point_of_sale.design_data = @organization.point_of_sale_design_data unless @organization.nil?
    point_of_sale
  end

  def autocomplete_customer
    @sale = @organization.sales.find(params[:id])
    escaped_string = Regexp.escape(params[:sale][:customer_identifier])
    re = Regexp.new(escaped_string, "i")
    @customers = @organization.customers.select { |c| c.identifier.match re}
    render :layout=>false
  end

#TODO make this test
  def check_coupon_cancel
    supervisor = User.authenticate(params[:user][:login], params[:user][:password])
    if supervisor.nil? 
      render_access_denied_screen(_("You don't have permissions to cancel a coupon."))
    elsif !supervisor.allowed_to?(:controller => 'point_of_sale', :action => 'coupon_cancel')
      render_access_denied_screen(_("You don't have permissions to cancel a coupon."))
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
      flash.now[:notice] = _('You have a pending sale. Close or Cancel it before open a new one')
    end
    @sale_item = SaleItem.new 
    @total = @sale.total_value 
    @total_payment = @sale.total_payment 
    @payments = @sale.ledgers
  end


  def refresh_product
    @sale = @organization.sales.find(params[:id])
    @product = @organization.products.find_by_code(params[:product_code])
    @sale_item = SaleItem.new
    @sale_item.product = @product
    flash.now[:notice] = _('This is not a product code valid') if @product.nil?
    render :partial => 'product_info'
  end

  def coupon_add_item
    @sale = @organization.sales.find(params[:id])
    begin
      item = SaleItem.new(params[:sale_item])
      item.product = @organization.products.find_by_code(params[:sale_item][:product_code])
      item.valid?
      (item.errors.length != 1) ? raise(ActiveRecord::RecordInvalid) :   @sale.items << item 
    rescue 
      flash[:notice] = _('There is no product with this code')
    end
    @total = @sale.total_value 
    @total_payment = @sale.total_payment 
    @payments = @sale.ledgers
    render :partial => 'sale'
  end

  def cancel
    @sale = @organization.sales.find(params[:id])

    unless can(:controller => 'point_of_sale', :action => 'coupon_cancel')
      flash[:notice] = _('Only sales supervisor can cancel a coupon') if flash[:notice].nil?
    end
    @total = @sale.total_value 
    @total_payment = @sale.total_payment 
    @payments = @sale.ledgers
  end

  def coupon_cancel
    @sale = @organization.sales.find(params[:id])
    if @sale.cancel!
      redirect_to :action => 'index'
    else
      @total = @sale.total_value 
      @total_payment = @sale.total_payment 
      @payments = @sale.ledgers
      render :action => 'cancel'
    end
  end

  def payment
    @sale = @organization.sales.find(params[:id])
    @total = @sale.total_value 
    @total_payment = @sale.total_payment 
    @payments = @sale.ledgers
    @ledger = Ledger.new_ledger
    @ledger.value = @sale.balance
    @ledger_categories =  @organization.sale_ledger_categories_by_payment_method(@ledger.payment_method)
  end

  def save_customer
    sale = @organization.sales.find(params[:id])
    if params[:customer_id].blank?
      sale.customer = nil
    else
      sale.customer = @organization.customers.find(params[:customer_id]) 
    end
    sale.save
    redirect_to :action => 'payment', :id => sale.id
  end

  def select_category
    payment_method = params[:payment_method]
    if !payment_method.blank?
      @ledger = Ledger.new_ledger(:payment_method => payment_method)
      @banks = Bank.find(:all)
      @ledger_categories =  @organization.sale_ledger_categories_by_payment_method(@ledger.payment_method)
      @hide_sign = true
      render :partial => 'shared_payments/select_category'
    else
      render :nothing => true
    end
  end

  def coupon_add_payment
    @sale = @organization.sales.find(params[:id])
     
    @ledger = Ledger.new_ledger(params['ledger'])
    @ledger.date = Date.today
    @ledger.owner = @sale
    @ledger.bank_account = @organization.default_bank_account
    
    if @ledger.valid?
      @sale.ledgers << @ledger
      if @sale.balance == 0
        flash[:notice] = _('Payment successfully realized.')
        redirect_to :action => :coupon_close, :id => @sale.id
      else
        redirect_to :action => :payment, :id => @sale.id
      end
    else
      @ledger_categories =  @organization.sale_ledger_categories_by_payment_method(@ledger.payment_method)
      @total = @sale.total_value 
      @total_payment = @sale.total_payment 
      @payments = @sale.ledgers
      @banks = Bank.find(:all)
      render :action => 'payment'
    end

  end

  def coupon_close
    @sale = @organization.sales.find(params[:id])
    @sale.close!      
    redirect_to :action => 'index'
  end

  def add_cash
    @cash = AddCash.new
  end

  def create_add_cash
    @cash = AddCash.new(params[:cash])
    @cash.payment_method = 'money'
    @cash.date = Date.today
    @cash.bank_account = @organization.default_bank_account
    @cash.type_of = Payment::TYPE_OF_INCOME
    @cash.owner = @organization
    if @cash.save
      flash[:notice] = _('The cash was added with sucess')
      redirect_to :action => 'index'
    else
      render :action => 'add_cash'
    end
  end

  def remove_cash
    @cash = RemoveCash.new
  end

  def create_remove_cash
    @cash = RemoveCash.new(params[:cash])
    @cash.payment_method = 'money'
    @cash.date = Date.today
    @cash.bank_account = @organization.default_bank_account
    @cash.type_of = Payment::TYPE_OF_EXPENSE
    @cash.owner = @organization
    if @cash.save
      flash[:notice] = _('The cash was removed with sucess')
      redirect_to :action => 'index'
    else
      render :action => 'remove_cash'
    end
  end

  def render_access_denied_screen(message = nil)
    flash[:notice] = message || _("You don't have permissions to access this function")
    redirect_to :back    
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

end
