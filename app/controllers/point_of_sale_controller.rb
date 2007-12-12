class PointOfSaleController < ApplicationController
  # Code Conventions:
  # - The create methods have printer operations associated to him.
  #
  # I think it's a gooda idea we have a class only to manipulate the printer.
  # this class can see what is the better way to follow when someting wrong happen.
  #

  needs_organization

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
      if @organization.has_fiscal_printer?
        render :update do |page|
          page.replace_html('abelo_login_form', :partial => 'login_form' )
        end
      else
        redirect_to :action => 'cancel'
      end
    end
  end

  def design_point_of_sale
    point_of_sale = DesignPointOfSale.new(@organization)
    point_of_sale 
  end

  def autocomplete_sale_customer_identifier
    escaped_string = Regexp.escape(params[:sale][:customer_identifier])
    re = Regexp.new(escaped_string, "i")
    @customers = @organization.customers.select { |c| c.identifier.match re}
    render :layout => false
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

    @total = @sale.total_value 
    @total_payment = @sale.total_payment 
    @payments = @sale.ledgers
    @ledger = Ledger.new_ledger
    @ledger.value = @sale.balance
    @ledger_categories =  @organization.sale_ledger_categories_by_payment_method(@ledger.payment_method)
  end

#FIXME put this to works
  def save_customer
    till = load_current_till
    @sale = Sale.pending(till)
    @sale.customer = @organization.customers.find_by_cpf(params[:customer_cpf]) 
raise params.inspect
    @sale.save
    render :update do |page|
      page.replace_html('abelo_payment_customer', :partial => 'payment_customer')
    end
#    redirect_to :action => 'payment', :id => sale.id
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

  def create_coupon_add_payment
    till = load_current_till
    @sale = Sale.pending(till)
     
    @ledger = Ledger.new_ledger(params['ledger'])
    @ledger.date = Date.today
    @ledger.owner = @sale
    @ledger.bank_account = @organization.default_bank_account
    
    if @ledger.save
      redirect_to :action => 'return' if @sale.reload.balance == 0
      @ledger_categories =  @organization.sale_ledger_categories_by_payment_method(@ledger.payment_method)
      @total = @sale.total_value 
      @total_payment = @sale.total_payment 
      @payments = @sale.ledgers
      @banks = Bank.find(:all)
      render :action => 'add_payment' 
    else
      @ledger_categories =  @organization.sale_ledger_categories_by_payment_method(@ledger.payment_method)
      @total = @sale.total_value 
      @total_payment = @sale.total_payment 
      @payments = @sale.ledgers
      @banks = Bank.find(:all)
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


