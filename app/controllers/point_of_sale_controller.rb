class PointOfSaleController < ApplicationController
  # Code Conventions:
  # - The create methods have printer operations associated to him.
  #
  # I think it's a gooda idea we have a class only to manipulate the printer.
  # this class can see what is the better way to follow when someting wrong happen.
  #

  needs_organization

  uses_popup_plugin

  layout 'point_of_sale'

  post_only [:create_till_open, :create_coupon_add_item]

  skip_before_filter :check_access_control, :only => ['create_coupon_cancel']

  before_filter :check_coupon_cancel, :only => ['create_coupon_cancel']
  
  design :holder => :design_point_of_sale, :root => File.join('designs','point_of_sale')

  before_filter :load_current_till, :except => 'index'
  before_filter :check_command_error
  after_filter :run_pending_commands

  def check_coupon_cancel
    supervisor = User.authenticate(params[:user][:login], params[:user][:password])
    supervisor ||= current_user
    if !supervisor.allowed_to?(:controller => 'point_of_sale', :action => 'create_coupon_cancel')
      flash[:notice] = _("The user %s don't have permissions to cancel a coupon." % supervisor.login )
      flash.keep(:notice)
      redirect_to :action => 'cancel'
    end
  end

  def check_command_error
    return unless @organization.has_fiscal_printer? 
    cmd = PrinterCommand.pending_command(@till)
    return if cmd.nil?
    flash.now[:command_error] = _('%s') % cmd.error_message
  end

  def run_pending_commands
    return  unless @organization.has_fiscal_printer? and PrinterCommand.has_pending?(@till)
    cmd = PrinterCommand.run_pendings(@till)
  end

  def design_point_of_sale
    point_of_sale = DesignPointOfSale.new(@organization)
    point_of_sale 
  end

  def index
    printer = load_printer 
    if @organization.has_fiscal_printer? and printer.nil?
      flash[:notice] = _("You don't have a printer configured")
    else
      @till = load_current_till
    end
    unless @till.nil?
      redirect_to :action => 'till_open'
    end
  end

  def till_open
    @pending_sale = Sale.pending(@till)
  end

  def open_till
    if @till.nil?
      @cash = Ledger.new
      render :action => 'open_till'
    else
      redirect_to :action => 'till_open'
    end
  end

  def create_till_open
    if @till.nil?
      printer = load_printer
      @till = Till.new(@organization, current_user, printer)
    end

    unless params[:cash].nil?
      @cash ||= Ledger.new(params[:cash].merge(:owner => @till, :payment_method => Payment::ADD_CASH, :organization => @organization))
    end
    if @till.save
      @till.ledgers << @cash unless @cash.nil?
      redirect_to :action => 'till_open'
    else
      render :template => 'point_of_sale/open_till'
    end
  end

  def add_cash
    @cash = Ledger.new
  end

  def create_add_cash
    @cash = Ledger.new(params[:cash].merge(:organization => @organization, :owner => @till, :payment_method => Payment::ADD_CASH))

    if @cash.save
      flash[:notice] = _('The cash was added successfully')
      redirect_to :action => 'till_open'
    else
      render :action => 'add_cash'
    end
  end

  def remove_cash
    @cash = Ledger.new
  end

  def create_remove_cash
    @cash = Ledger.new(params[:cash].merge(:owner => @till, :payment_method => Payment::REMOVE_CASH, :organization => @organization))
    if @cash.save
      flash[:notice] = _('The cash was removed successfully')
      redirect_to :action => 'till_open'
    else
      render :action => 'remove_cash'
    end
  end

  def create_close_till
    if @till.close
      redirect_to :action => 'index'
    else
      render :action => 'till_open'
    end
  end

  def change
    @sale = Sale.pending(@till)
    @sale.change!
    @total = @sale.total_value 
    @total_payment = @sale.total_payment 
  end

  def create_close_sale
    @sale = Sale.pending(@till)
    unless @sale.closed?
      @sale.close!
    end
    redirect_to :action => 'till_open'
  end

  def coupon_open
    @sale = Sale.pending(@till)
    @sale_item = SaleItem.new(:sale => @sale)
    unless params[:product_code].nil?
      @sale_item.product_code = params[:product_code] 
      @product = @sale_item.product
    end
    @total = @sale.total_value 
    @total_payment = @sale.total_payment 
    @payments = @sale.ledgers
  end

  def create_coupon_open
    @sale =  Sale.new(@till)
    if @sale.save
      redirect_to :action => 'coupon_open'
    else
      flash[:notice] = @sale.errors.full_messages
      render :action => 'till_open'
    end
  end

  def create_coupon_add_item
    @sale = Sale.pending(@till)
    @sale_item = SaleItem.new(params[:sale_item].merge(:sale => @sale))
    if @sale_item.save
      @total = @sale.total_value 
      @total_payment = @sale.total_payment
      @payments = @sale.ledgers
      @sale_item = nil
      render :update do |page|
        page.replace_html('abelo_table_items', :partial => 'table')
        page.replace_html('abelo_add_item_panel', :partial => 'product_info')
      end
    else
      @total = @sale.total_value 
      @total_payment = @sale.total_payment
      @product = @sale_item.product 
      @payments = @sale.ledgers
      render :update do |page|
        page.replace_html('abelo_sale', :partial => 'sale')
      end
    end
  end

  def refresh_product
    code = params[:product_code]
    @product = @organization.products.find_by_code(code)
    if @product.nil?
      render :update do |page|
        page.replace_html('abelo_product_identification', _('Invalid product code %s') % code)
      end
    else
      render :update do |page|
        page.replace_html('abelo_product_identification', @product.name )
        page.replace_html('abelo_value_product', @product.sell_price )
      end
    end
  end

  def cancel
    till = load_current_till
    @sale = Sale.pending(till)

    unless can(:controller => 'point_of_sale', :action => 'create_coupon_cancel')
      flash[:notice] = _('Only sales supervisor can cancel a coupon') if flash[:notice].nil?
    end
    @total = @sale.total_value 
    @total_payment = @sale.total_payment 
    @payments = @sale.ledgers
  end

  def create_coupon_cancel
    @sale = Sale.pending(@till)

    if @sale.cancel!
      redirect_to :action => 'till_open'
    else
      @total = @sale.total_value 
      @total_payment = @sale.total_payment 
      @payments = @sale.ledgers
      render :action => 'cancel'
    end
  end

  def add_payment
    @sale = Sale.pending(@till)
    @sale.totalize
    @total = @sale.total_value 
    @total_payment = @sale.total_payment 
    @payments = @sale.ledgers
    @ledger = Ledger.new
    @ledger.value = @sale.balance
    @ledger_categories =  @organization.sale_ledger_categories_by_payment_method(@ledger.payment_method)
  end

  def select_category
    payment_method = params[:payment_method]
    if !payment_method.blank?
      @ledger = Ledger.new(:payment_method => payment_method)
      @banks = Bank.find(:all)
      @ledger_categories =  @organization.sale_ledger_categories_by_payment_method(@ledger.payment_method)
      @hide_sign = true
      render :partial => 'shared_payments/select_category'
    else
      render :nothing => true
    end
  end

  def create_coupon_add_payment
    @sale = Sale.pending(@till)
    ledger_params = params['ledger'] || {}
    @ledger = Ledger.new(ledger_params.merge(:owner => @sale, :organization => @organization))
    @ledger_categories =  @organization.sale_ledger_categories_by_payment_method(@ledger.payment_method)
    
    if @ledger.save
      if @sale.balance == 0
        @sale.close!      
        redirect_to :action => 'till_open'
        return
      elsif @sale.balance < 0
        @sale.change!
        redirect_to :action => 'change', :sale_id => @sale
        return
      end
      @payments = @sale.ledgers
      @ledger = Ledger.new
      @ledger.value = @sale.balance
      @total = @sale.total_value 
      @total_payment = @sale.total_payment 
      render :action => 'add_payment' 
    else
      @ledger.value = @sale.balance
      @payments = @sale.ledgers
      @total = @sale.total_value 
      @total_payment = @sale.total_payment 
      @banks = Bank.find(:all)
      render :action => 'add_payment' 
    end
  end

  def popup_product
    render :action => 'popup_product', :layout => false
  end

  def search_product
    str = params[:search].blank? ? '*' : params[:search]
    @products = @organization.products.full_text_search(str)
    render :action => 'search_product', :layout => false
  end

  def select_product
    redirect_to :action => 'coupon_open', :product_code => params[:product_code]
  end

  def popup_customer
    render :action => 'popup_customer', :layout => false
  end

  def search_customer
    str = params[:search].blank? ? '*' : params[:search]
    @customers = @organization.customers.full_text_search(str)
    render :action => 'search_customer', :layout => false
  end

  def select_customer
    till = load_current_till
    sale = Sale.pending(till)
    unless params[:customer_id].nil?
      sale.customer = @organization.customers.find(params[:customer_id])
      sale.save!
    end
    redirect_to :action => 'add_payment'
  end

  def coupon_close
    @sale = @organization.sales.find(params[:id])
    @sale.close!      
    redirect_to :action => 'till_open'
  end

  private

  def load_printer
    printer =  @organization.printers.find_by_computer_id(PrinterCommand.get_computer_id)
    printer # Make the return value more clear
  end

  def load_current_till
    printer = load_printer 
    if @organization.has_fiscal_printer? and printer.nil?
      flash[:notice] = _("You don't have a printer configured")
raise 'fudeu'
      redirect_to :action => 'index'
    else
      @till = Till.load(@organization, current_user, printer)
    end
  end


end


