class StockController < ApplicationController

  helper StockHelper

  require 'payment/invoice_payment'
  include InvoicePayment

  needs_organization
    
  uses_stock_tabs

  def autocomplete_product_name
    escaped_string = Regexp.escape(params[:product][:name])
    re = Regexp.new(escaped_string, "i")
    @products = @organization.products.select{|p| p.name.match re}
    render :template => 'stock_base/autocomplete_product_name', :layout=>false
  end

  def index
    redirect_to :action => 'list'
  end

  def list
    @query = params[:query]
    @query ||= params[:product][:name] if params[:product]

    @stocks = @organization.stock_virtuals(@query)
    @stock_pages, @stocks = paginate_by_collection @stocks
    render :template => 'stock_base/list'
  end

  def new
    if params[:product_id].blank?
      redirect_to :controller => 'stock_in', :action => 'new'
    else
      redirect_to :action => 'add', :product_id => params[:product_id]
    end
  end

  def add
    product = @organization.products.find(params[:product_id])
    @stock = StockIn.new(:product => product, :date => Date.today, :amount => 1)
    @invoice = Invoice.new
    @suppliers = product.suppliers
  end

  def create
    product = @organization.products.find(params[:product_id])
    @stock = StockIn.new(params[:stock])
    @stock.product = product
    @invoice = params[:invoice_id].blank? ? Invoice.new(params[:invoice]) : @organization.invoices.find(params[:invoice_id])
    @stock.invoice = @invoice
    
    if @invoice.save and @invoice.stock_ins << @stock
      flash.now[:notice] = _('It was successfully created.')
      redirect_to :action => 'edit', :invoice_id => @invoice,  :stock_id => @stock
    else
      @suppliers = product.suppliers
      render :action => 'add'
    end
  end

  def edit
    @invoice = @organization.invoices.find(params[:invoice_id])
    @stock = @invoice.stock_ins.find(params[:stock_id])
    @suppliers = @stock.product.suppliers
    @ledgers = @invoice.ledgers 
    @ledger = Ledger.new(:date => Date.today)
    @banks = Bank.find(:all)
    @ledger_categories =  @organization.stock_ledger_categories_by_payment_method(@ledger.payment_method)
  end

  def history
    @product = @organization.products.find(params[:product_id])
    @stocks = @product.stocks
    render :template => 'stock_base/history'
  end

end
