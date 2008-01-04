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

  post_only [ :create_till_open]

  skip_before_filter :check_access_control, :only => ['create_coupon_cancel']

  before_filter :check_coupon_cancel, :only => ['create_coupon_cancel']
  
  design :holder => :design_point_of_sale, :root => File.join('designs','point_of_sale')

  before_filter :check_fiscal_printer, :except => 'index'

  def check_coupon_cancel
    supervisor = User.authenticate(params[:user][:login], params[:user][:password])
    supervisor ||= current_user
    if !supervisor.allowed_to?(:controller => 'point_of_sale', :action => 'create_coupon_cancel')
      flash[:notice] = _("The user %s don't have permissions to cancel a coupon." % supervisor.login )
      flash.keep(:notice)
      redirect_to :action => 'cancel'
    end
  end

  def design_point_of_sale
    point_of_sale = DesignPointOfSale.new(@organization)
    point_of_sale 
  end

  def index
    till = Till.load(@organization, current_user, get_printer_id)
    unless till.nil?
      redirect_to :action => 'till_open'
    end
  end

  def open_till
    till = Till.load(@organization, current_user, get_printer_id)
    if till.nil?
      @cash = Money.new
    else
      redirect_to :action => 'till_open'
    end
  end

  def create_till_open
    printer_id = get_printer_id
    @till = Till.load(@organization, current_user, printer_id)
    @till ||= Till.new(@organization, current_user, printer_id)

    unless params[:cash].nil?
      @cash ||= AddCash.new(@till, params[:cash])
    end

    if @till.save
      @till.add_cashs << @cash unless @cash.nil?
      redirect_to :action => 'till_open'
    else
      render :action => 'open_till'
    end
  end

  def printer_create_till_open
    printer_id = get_printer_id
    @till = Till.load(@organization, current_user, printer_id)
    @till ||= Till.new(@organization, current_user, printer_id)

    unless params[:cash].nil?
      @cash ||= AddCash.new(@till, params[:cash])
    end

    if @till.save
      @till.add_cashs << @cash unless @cash.nil?
      @printer_command = PrinterCommand.str_pending_command(@till)
      render :update do |page| 
        page.replace_html('fiscal_printer_info', @printer_command)
      end
    else
      render :update do |page| 
        page.replace_html('abelo_open_till', :partial => 'form_open_till')
      end
    end
  end

  def till_open
    till = load_current_till 
    @printer_command = PrinterCommand.str_pending_command(till)
    @pending_sale = Sale.pending(till)
  end

  def add_cash
    @cash = Money.new
  end

  def create_add_cash
    till = load_current_till
    @cash = AddCash.new(till, params[:cash])

    if @cash.save
      flash[:notice] = _('The cash was added with success')
      redirect_to :action => 'till_open'
    else
      render :action => 'add_cash'
    end
  end

  def printer_create_add_cash
    till = load_current_till
    @cash = AddCash.new(till, params[:cash])

    if @cash.save
      flash[:notice] = _('The cash was added with success')
      @printer_command = PrinterCommand.str_pending_command(till)
      render :update do |page| 
        page.replace_html('fiscal_printer_info', @printer_command)
      end
    else
      render :update do |page|
        page.replace_html('abelo_cash_form', :partial => 'cash_form' )
      end
    end
  end

  def remove_cash
    @cash = Money.new
  end

  def create_remove_cash
    till = load_current_till
    @cash = RemoveCash.new(till, params[:cash])

    if @cash.save
      flash[:notice] = _('The cash was added with success')
      redirect_to :action => 'till_open'
    else
      render :action => 'remove_cash'
    end
  end

  def printer_create_remove_cash
    till = load_current_till
    @cash = RemoveCash.new(till, params[:cash])

    if @cash.save
      flash[:notice] = _('The cash was removed with success')
      @printer_command = PrinterCommand.str_pending_command(till)
      render :update do |page| 
        page.replace_html('fiscal_printer_info', @printer_command)
      end
    else
      render :update do |page|
        page.replace_html('abelo_cash_form', :partial => 'cash_form' )
      end
    end
  end

  def create_close_till
    till = load_current_till

    if till.close
      redirect_to :action => 'index'
    else
      render :action => 'till_open'
    end
  end


  def printer_create_close_till
    till = load_current_till

    if till.close
      flash[:notice] = _('Closing Till')
      @printer_command = PrinterCommand.str_pending_command(till)
      render :update do |page| 
        page.replace_html('fiscal_printer_info', @printer_command)
      end
    else
      render :update do |page| 
        page.replace_html('abelo_action', :partial => 'till_open')
      end
    end
  end

  def create_coupon_open
    till = load_current_till
    @sale =  Sale.new(till)
    if @sale.save
      redirect_to :action => 'coupon_open'
    else
      flash[:notice] = @sale.errors.full_messages
      render :action => 'till_open'
    end
  end

  def printer_create_coupon_open
    till = load_current_till
    @sale =  Sale.new(till)
    if @sale.save
      if @organization.has_fiscal_printer?
        @printer_command = PrinterCommand.str_pending_command(till)
        render :update do |page| 
          page.replace_html('fiscal_printer_info', @printer_command)
        end
      else
        render :update do |page| 
          page.replace_html('abelo_action', :partial => 'coupon_open')
        end
      end
    else
      render :nothing => true
    end
  end
  
  def coupon_open
    till = load_current_till
    @sale = Sale.pending(till)
    @sale_item = SaleItem.new(@sale)
    unless params[:product_code].nil?
      @sale_item.product_code = params[:product_code] 
      @product = @sale_item.product
    end
    @total = @sale.total_value 
    @total_payment = @sale.total_payment 
    @payments = @sale.ledgers
  end

  #FIXME make this tests
  def create_coupon_add_item
    till = load_current_till
    @sale = Sale.pending(till)
    @sale_item = SaleItem.new(@sale, params[:sale_item])
    if @sale_item.save
      render :update do |page|
        if @organization.has_fiscal_printer?
          @product = @sale_item.product
          @printer_command = PrinterCommand.str_pending_command(till)
          page.replace_html('abelo_add_item_panel', :partial => 'product_info')
          page.replace_html('fiscal_printer_info', @printer_command)
        else
          @sale_item = SaleItem.new(@sale)
          @total = @sale.total_value 
          @total_payment = @sale.total_payment
          @payments = @sale.ledgers
          page.replace_html('abelo_table_items', :partial => 'table')
          page.replace_html('abelo_add_item_panel', :partial => 'product_info')
        end
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
    @product = @organization.products.find_by_code(params[:product_code])
    render :update do |page|
      page.replace_html('product_identification', @product.name )
      page.replace_html('value_product', @product.sell_price )
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
    till = load_current_till
    @sale = Sale.pending(till)

    if @sale.cancel!
      redirect_to :action => 'till_open'
    else
      @total = @sale.total_value 
      @total_payment = @sale.total_payment 
      @payments = @sale.ledgers
      render :action => 'cancel'
    end
  end

  def printer_create_coupon_cancel
    till = load_current_till
    @sale = Sale.pending(till)

    unless @sale.cancel!
      @total = @sale.total_value 
      @total_payment = @sale.total_payment 
      @payments = @sale.ledgers
    end

    render :update do |page|
      @printer_command = PrinterCommand.str_pending_command(till)
      page.replace_html('fiscal_printer_info', @printer_command)
    end
  end

  def add_payment
    till = load_current_till
    @sale = Sale.pending(till)
    unless params[:customer_id].nil?
      @sale.customer = @organization.customers.find(params[:customer_id])
      @sale.save
    end
    @total = @sale.total_value 
    @total_payment = @sale.total_payment 
    @payments = @sale.ledgers
    @ledger = Ledger.new_ledger
    @ledger.value = @sale.balance
    @ledger_categories =  @organization.sale_ledger_categories_by_payment_method(@ledger.payment_method)
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

  def change
    till = load_current_till
    sale = Sale.pending(till)
    @total = sale.total_value 
    @total_payment = sale.total_payment 
  end

  def create_coupon_add_payment
    till = load_current_till
    @sale = Sale.pending(till)
     
    @ledger = Ledger.new_ledger(params['ledger'])
    @ledger.date = Date.today
    @ledger.owner = @sale
    @ledger.bank_account = @organization.default_bank_account
    @ledger_categories =  @organization.sale_ledger_categories_by_payment_method(@ledger.payment_method)
    @total = @sale.total_value 
    @total_payment = @sale.total_payment 
    @banks = Bank.find(:all) if @ledger.kind_of? Check
    @printer_command = PrinterCommand.str_pending_command(till) if @organization.has_fiscal_printer?
    
    if @ledger.save
      @sale.reload
      if @sale.balance == 0
        redirect_to :action => 'till_open'
        return
      elsif @sale.balance < 0
        redirect_to :action => 'change'
        return
      end
      @payments = @sale.ledgers
      @ledger = Ledger.new_ledger
      @ledger.value = @sale.balance
      render :action => 'add_payment' 
    else
      @payments = @sale.ledgers
      render :action => 'add_payment' 
    end
  end

  def printer_create_coupon_add_payment
    till = load_current_till
    @sale = Sale.pending(till)
     
    @ledger = Ledger.new_ledger(params['ledger'])
    @ledger.date = Date.today
    @ledger.owner = @sale
    @ledger.bank_account = @organization.default_bank_account
    
    if(@ledger.save and (@sale.reload.balance == 0))
      @printer_command = PrinterCommand.str_pending_command(till)
      render :update do |page| 
        page.replace_html('fiscal_printer_info', @printer_command)
      end
    else
      @ledger_categories =  @organization.sale_ledger_categories_by_payment_method(@ledger.payment_method)
      @total = @sale.total_value 
      @total_payment = @sale.total_payment 
      @payments = @sale.ledgers
      @banks = Bank.find(:all)
      @printer_command = PrinterCommand.str_pending_command(till)
      render :update do |page| 
        page.replace_html('sale', :partial => 'payment')
        page.replace_html('fiscal_printer_info', @printer_command)
      end
    end
  end

  def popup_product
    render :action => 'popup_product', :layout => false
  end

  def search_product
    @products = @organization.products.full_text_search(params[:search])
    render :action => 'search_product', :layout => false
  end

  def select_product
    redirect_to :action => 'coupon_open', :product_code => params[:product_code]
  end

  def popup_customer
    render :action => 'popup_customer', :layout => false
  end

  def search_customer
    @customers = @organization.customers.full_text_search(params[:search])
    render :action => 'search_customer', :layout => false
  end

  def select_customer
    redirect_to :action => 'add_payment', :customer_id => params[:customer_id]
  end

  def coupon_close
    @sale = @organization.sales.find(params[:id])
    @sale.close!      
    redirect_to :action => 'index'
  end

  def accept_printer_cmd
    till = Till.load(@organization, current_user, cookies[:printer_id].first)
    command = PrinterCommand.find_pending_by_cmd_id(till, params[:command_id])
    if command.response_command(params[:response])
      redirect_to :action => command.action_success
    else
      flash[:notice] = command.action_error_notice
      flash.keep(:notice)
      redirect_to :action =>  command.action_error(params[:response])
    end
  end

  private

  def get_printer_id
    cookies[:printer_id].nil? ? nil :  cookies[:printer_id].first
  end

  def load_current_till
    Till.load(@organization, current_user, get_printer_id)
  end

  def check_fiscal_printer
    if @organization.has_fiscal_printer? and get_printer_id.nil?
      flash[:notice] = _('you cannot access this functionality whitou a fiscal printer')
      redirect_to :action => 'index'
    end
  end


end


