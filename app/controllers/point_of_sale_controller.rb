class PointOfSaleController < ApplicationController

  needs_organization
  layout 'point_of_sale'

  verify :method => :post, :only => [ :new, :add_item, :refresh_product, :set_customer, :cancel ], :redirect_to => { :action => :index }

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
    @payments = @sale.payments
    @total = @sale.total_value
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
    @total = @sale.total_value
    @payments = @sale.payments
    begin
      item = SaleItem.new(params[:sale_item])
      item.product = @organization.products.find_by_code(params[:sale_item][:product_code])
      item.valid?
      (item.errors.length != 1) ? raise (ActiveRecord::RecordInvalid) :  @sale.items << item 
    rescue 
#TODO display a notice when something wrong happen
      flash[:notice] = _('There is no product with this code')
    end
    render :partial => 'sale'
  end


  def coupon_cancel
    begin
      @sale = @organization.sales.find(params[:id])
      if @sale.cancel!
        redirect_to :action => 'index'
      else
        @total = @sale.total_value
        render :action => 'coupon_open'
      end
    rescue
      redirect_to :action => 'index'
    end
  end

  def payment
    @sale = @organization.sales.find(params[:id])
    @sale.payment_method = 'money'
    @payments = @sale.payments
    @customers = @organization.customers
    @total = @sale.total_value 
    @payment_methods = Payment::PAYMENT_METHODS
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
    @payment.value = @sale.total_value
    @sale.payment_method = params['payment_method']
    @banks = Bank.find_all
    render :partial => 'payment_method'
  end

  def coupon_add_payment
    @sale = @organization.sales.find(params[:id])
    @payments = @sale.payments
    @customers = @organization.customers
    @payment_methods = Payment::PAYMENT_METHODS
    @payment = Money.new(params[:payment])
    @sale.add_payments(@payment)
    @payments = @sale.payments       
    @total = @sale.total_value 
    render :partial => 'payment'
  end

#  def set_customer
#    sale = @organization.sales.find(params[:id])
#    sale.customer = @organization.customers.find(params[:customer_id])
#    sale.save
#    render :nothing => true
#  end
#
#  def close
#    @sale = @organization.sales.find(params[:id])
#    if @sale.close!
#      
#      #Create a new exit in cash flow
##      cf = CashFlow.new
##      cf.add_sale(@sale.id)
#      #end of creation
#
#      redirect_to :action => 'index'
#    else
#      render :action => 'main'
#    end
#  end
#
#
#  def search_customer
#    @customers = @organization.customers
#    @sale_id = params[:sale_id]
#    render :template => 'point_of_sale/search_customer'
#  end
#
#  def show_customers
#    existing_customers_id = params[:existing_customers].any? ? params[:existing_customers].keys : []
#    options = params[:options]
#    @customers = Customer.search(params[:search], existing_customers_id, options)
#    @type_select = params[:type_select]
#    render :action => 'show_customers', :layout => false
#  end
#
#  def associating_customer
#    customer = params[:selected_customer]
#    s = Sale.find(params[:sale_id])
#    if not customer.nil?
#      s.customer = Customer.find(customer)
#      s.save
#    end
#    render :text => s.customer.name
#  end

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
