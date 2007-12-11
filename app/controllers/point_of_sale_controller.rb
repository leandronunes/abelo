class PointOfSaleController < ApplicationController
  # Code Conventions:
  # - The create methods have printer operations associated to him.
  #
  # I think it's a gooda idea we have a class only to manipulate the printer.
  # this class can see what is the better way to follow when someting wrong happen.
  #

  needs_organization

  layout 'point_of_sale'

  post_only [ :new, :add_item, :refresh_product, :create_coupon_cancel ]

  skip_before_filter :check_access_control, :only => ['create_coupon_cancel']

  before_filter :check_coupon_cancel, :only => ['create_coupon_cancel']
  
  design :holder => :design_point_of_sale, :root => File.join('designs','point_of_sale')

  def design_point_of_sale
    point_of_sale = DesignPointOfSale.new(@organization)
    point_of_sale 
  end

  def autocomplete_customer
    @sale = @organization.sales.find(params[:id])
    escaped_string = Regexp.escape(params[:sale][:customer_identifier])
    re = Regexp.new(escaped_string, "i")
    @customers = @organization.customers.select { |c| c.identifier.match re}
    render :layout => false
  end

  def index
    till = Till.load(@organization, current_user, (cookies[:printer_id].first unless cookies[:printer_id].nil?))
    #FIXME how to put the printer id on cookie before call the action?
    unless till.nil?
      @printer_command = PrinterCommand.pending_command(till)
      redirect_to :action => 'till_open'
    end
  end

  def open_till
#    if cookies[:printer_id].nil?
#      flash[:notice] = _("You don't have a printer configured.")
#      render :action => 'index' 
#      return
#    end

    printer_id = get_printer_id
    till = Till.load(@organization, current_user, printer_id)
    printer_command = PrinterCommand.pending_command(till)
    if till.nil?
      @cash = Money.new
    else
      @printer_command = printer_command.str_command unless printer_command.nil?
      redirect_to :action => 'till_open'
    end
  end

  def create_till_open
    printer_id = get_printer_id
    @till = Till.load(@organization, current_user, printer_id)
    @till ||= Till.new(@organization, current_user, printer_id)

    unless params[:cash].nil?
      @cash = @till.add_cashs.first
      @cash ||= AddCash.new(@till, params[:cash])
    end

    if @till.save
      @till.add_cashs << @cash unless @cash.nil?
      if @organization.has_fiscal_printer?
        @printer_command = PrinterCommand.str_pending_command(@till)
        render :update do |page| 
          page.replace_html('fiscal_printer_info', @printer_command)
        end
      else
        render :update do |page| 
raise 'put the write partial here'
          page.replace_html('abelo_action', :partial => 'lalal')
        end
      end
    else
      render :nothing => true
    end
  end

  def create_close_till
    till = Till.load(@organization, current_user, cookies[:printer_id].first)
    if till.close
      render :update do |page|
        @printer_command = PrinterCommand.str_pending_command(till)
        page.replace_html('fiscal_printer_info', @printer_command)
      end
    else
      render :nothing => true
    end
  end

  def till_open 
    printer_id = get_printer_id
    till = Till.load(@organization, current_user, printer_id)
    @printer_command = PrinterCommand.str_pending_command(till)
    @pending_sale = Sale.pending(till)
  end

  def add_cash
    @cash = Money.new
  end

  def create_add_cash
    till = Till.load(@organization, current_user, cookies[:printer_id].first)
    redirect_to :action => 'index' if till.nil?
    @cash = AddCash.new(till, params[:cash])

    if @cash.save
      flash[:notice] = _('The cash was added with success')
      render :update do |page|
        @printer_command = PrinterCommand.str_pending_command(till)
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
    till = Till.load(@organization, current_user, cookies[:printer_id].first)
    redirect_to :action => 'index' if till.nil?
    @cash = RemoveCash.new(till, params[:cash])

    if @cash.save
      flash[:notice] = _('The cash was removed with success')
      render :update do |page|
        @printer_command = PrinterCommand.str_pending_command(till)
        page.replace_html('fiscal_printer_info', @printer_command)
      end
    else
      render :update do |page|
        page.replace_html('abelo_cash_form', :partial => 'cash_form' )
      end
    end
  end

  def create_coupon_open
    till = Till.load(@organization, current_user, cookies[:printer_id].first)
    @sale =  Sale.new(till)
    if @sale.save
      render :update do |page|
        @printer_command = PrinterCommand.str_pending_command(till)
        page.replace_html('fiscal_printer_info', @printer_command)
      end
    else
      render :nothing => true
    end
  end
  
  def coupon_open
    till = Till.load(@organization, current_user, cookies[:printer_id].first)
    @sale = Sale.pending(till)
    if @sale.nil?
      render :nothing => true
    else
      @sale_item = SaleItem.new(@sale)
      @total = @sale.total_value 
      @total_payment = @sale.total_payment 
      @payments = @sale.ledgers
      render :action => 'coupon_open'
    end
  end

  def check_coupon_cancel
    supervisor = User.authenticate(params[:user][:login], params[:user][:password])
    supervisor ||= current_user
    if !supervisor.allowed_to?(:controller => 'point_of_sale', :action => 'create_coupon_cancel')
      flash.now[:notice] = _("You don't have permissions to cancel a coupon.")
      render :update do |page|
        page.replace_html('abelo_login_form', :partial => 'login_form' )
      end
    end
  end

  def refresh_product
    till = Till.load(@organization, current_user, cookies[:printer_id].first)
    sale = Sale.pending(till)
    @sale_item = SaleItem.new(sale)
    @sale_item.product_code = params[:product_code]
    @product = @sale_item.product
    flash.now[:notice] = _('This is not a product code valid') if @sale_item.product.nil?
    render :update do |page|
      page.replace_html('product_identification', @product.name )
      page.replace_html('value_product', @product.sell_price )
    end
  end

  def create_coupon_add_item
    till = Till.load(@organization, current_user, cookies[:printer_id].first)
    @sale = Sale.pending(till)
#raise 'fudeu: ' + @sale.inspect
    @sale_item = SaleItem.new(@sale, params[:sale_item])
#raise 'ble: ' + @sale_item.sale.inspect
#raise 'bla: ' + params.inspect
#raise 'bli: ' + @sale_item.product.inspect
    if @sale_item.save
      render :update do |page|
        @product = @sale_item.product
        page.replace_html('add_item_panel', :partial => 'product_info')
        @printer_command = PrinterCommand.str_pending_command(till)
        page.replace_html('fiscal_printer_info', @printer_command)
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

  def cancel
    till = Till.load(@organization, current_user, cookies[:printer_id].first)
    @sale = Sale.pending(till)

    unless can(:controller => 'point_of_sale', :action => 'create_coupon_cancel')
      flash[:notice] = _('Only sales supervisor can cancel a coupon') if flash[:notice].nil?
    end
    @total = @sale.total_value 
    @total_payment = @sale.total_payment 
    @payments = @sale.ledgers
  end

  def create_coupon_cancel
    till = Till.load(@organization, current_user, cookies[:printer_id].first)
    @sale = Sale.pending(till)

    if @sale.cancel!
      render :update do |page|
        @printer_command = PrinterCommand.str_pending_command(till)
        page.replace_html('fiscal_printer_info', @printer_command)
      end
    else
      @total = @sale.total_value 
      @total_payment = @sale.total_payment 
      @payments = @sale.ledgers
      render :update do |page|
        page.replace_html('fiscal_printer_info', @printer_command)
      end
    end
  end

  def add_payment
    till = Till.load(@organization, current_user, cookies[:printer_id].first)
    @sale = Sale.pending(till)
#FIXME remove this it's to test on firefox browser
#@sale = Sale.find(params[:id])

    @total = @sale.total_value 
    @total_payment = @sale.total_payment 
    @payments = @sale.ledgers
    @ledger = Ledger.new_ledger
    @ledger.value = @sale.balance
    @ledger_categories =  @organization.sale_ledger_categories_by_payment_method(@ledger.payment_method)
  end

  def save_customer
    till = Till.load(@organization, current_user, cookies[:printer_id].first)
    @sale = Sale.pending(till)
    @sale.customer = @organization.customers.find_by_cpf(params[:customer_cpf]) 
    @sale.save
    render :update do |page|
      page.replace_html('abelo_payment_customer', :partial => 'payment_customer')
    end
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

  def create_coupon_add_payment
    till = Till.load(@organization, current_user, cookies[:printer_id].first)
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
    cookies[:printer_id].first unless cookies[:printer_id].nil?
  end


end


