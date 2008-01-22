class StockInController < ApplicationController

  needs_organization
  uses_stock_tabs

  def list
    @query = params[:query]
    @query ||= params[:invoice][:number] if params[:invoice]
    
    if @query.nil?
      @invoices = @organization.invoices
      @invoice_pages, @invoices = paginate_by_collection @invoices
    else
      @invoices = @organization.invoices.full_text_search(@query)
      @invoice_pages, @invoices = paginate_by_collection @invoices
    end
  end

  def new
    @invoice = Invoice.new(:issue_date => Date.today)
    @suppliers = @organization.suppliers
    @products = @organization.products
    @stock = StockIn.new(:validity => Date.today)
  end

  def create
    @invoice = Invoice.new(params[:invoice])
    if @organization.invoices << @invoice
      if params.has_key?('add_item')
        redirect_to :action => 'edit', :id => @invoice
      else
        redirect_to :action => 'list'
      end
    else
      @suppliers = @organization.suppliers
      @products = @organization.products
      @stock = StockIn.new(:validity => Date.today)
      render :action => 'new'
    end
  end

  def edit
    @invoice = Invoice.new(:issue_date => Date.today)
    @suppliers = @organization.suppliers
    @products = @organization.products
    @stock = StockIn.new(:validity => Date.today)
  end

  def select_product
    @stock = StockIn.new(:validity => Date.today)
    unless params[:product_id].blank?
      @stock.amount = 1
      product = @organization.products.find(params[:product_id])
      @stock.price = 0
      @stock.product = product
    end
    render :partial => 'invoice_items'
  end

  def add_item
    @invoice = @organization.invoices.find(params[:id])
    @stock = StockIn.new(params[:stock])
    if @invoice.stock_ins<< @stock
      @stock = StockIn.new(:validity => Date.today)
    end
    @suppliers = @organization.suppliers
    @products = @organization.products
    render :action => 'edit'
  end

  def history
    history_core('stock_in')
  end

end
