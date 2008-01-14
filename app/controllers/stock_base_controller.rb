class StockBaseController < ApplicationController

  needs_organization

  before_filter :create_tabs

  def list_core(virtual_type)
    @query = params[:query]
    @query ||= params[:product][:name] if params[:product]

    if @query.nil?
      @stocks = @organization.send("stock_#{virtual_type.pluralize}")
      @stock_pages, @stocks = paginate_by_collection @stocks
    else
      @stocks = StockVirtual.send("create_#{virtual_type.pluralize}", @organization.products.full_text_search(@query))
      @stock_pages, @stocks = paginate_by_collection @stocks
    end
    render :template => 'stock_base/list'
  end


  def autocomplete_supplier_name
    escaped_string = Regexp.escape(params[:supplier][:name])
    re = Regexp.new(escaped_string, "i")
    @suppliers = @organization.suppliers.select{|s| s.name.match re}
    render :template => 'stock_base/autocomplete_supplier', :layout=>false
  end

  def autocomplete_product_name
    escaped_string = Regexp.escape(params[:product][:name])
    re = Regexp.new(escaped_string, "i")
    @products = @organization.products.select{|p| p.name.match re}
    render :template => 'stock_base/autocomplete_name', :layout=>false
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  post_only [ :create, :update ]

  def index
    redirect_to :action => 'list'
  end

  def show
    @stock = Stock.find(params[:id])
    @ledgers = @stock.ledgers if @stock.respond_to?('ledgers')

    render :template => 'stock_base/show'
  end

  def new_core(virtual_type)
    begin
      product = @organization.products.find(params[:product_id])
      @stock = virtual_type.camelcase.constantize.new(:product => product, :date => Date.today, :amount => 1)
      @suppliers = product.suppliers
      render :template => 'stock_base/new'
    rescue
      flash[:notice] = _('The product with identification %s is not of your organization') % params[:product_id]
      redirect_to :controller => 'products', :action => 'new'
    end
  end

  def create_core(stock_type)
    product = @organization.products.find(params[:product_id])
    @stock = stock_type.camelcase.constantize.new(params[:stock])
    @stock.product = product

    if @stock.save
      flash[:notice] = _('It was successfully created.')
      redirect_to :action => 'history', :product_id => product
    else
      @suppliers = []
      render :template => 'stock_base/new'
    end
  end

  def edit
    @stock = Stock.find(params[:id])
    @product = @stock.product
    @suppliers = @product.suppliers
    @ledgers = @stock.ledgers if @stock.respond_to?('ledgers')

    if !@stock.kind_of?(StockIn)
      render :template => 'stock_base/edit'
    end
  end

  def update
    @stock = Stock.find(params[:id])
    if @stock.update_attributes(params[:stock])
      flash[:notice] = _('It was successfully updated.')
      redirect_to :action => 'history', :product_id => @stock.product
    else
      @suppliers = @stock.product.suppliers
      @ledgers = @stock.ledgers
      render :action => 'edit'
    end
  end

  def history_core(stock_type)
    begin
      @product = @organization.products.find(params[:product_id])
      @stocks = @product.send(stock_type.pluralize)
      render :template => 'stock_base/history'
    rescue
      redirect_to :action => 'index'
    end
  end

  def destroy
    stock = Stock.find(params[:id]).destroy
    product = stock.product
    stock.destroy
    if product.stocks.any?
      redirect_to :action => 'history', :product_id => product
    else
      redirect_to :action => 'list'
    end
  end

  def create_tabs
    t = add_tab do
      links_to :controller => 'stock'
      in_set 'first'
      highlights_on :controller => 'stock'
    end
    t.named _('Stock control')

    t = add_tab do
      links_to :controller => 'stock_in'
      in_set 'first'
      highlights_on :controller => 'stock_in'
    end
    t.named _('Devolution Control')

    t = add_tab do
      links_to :controller => 'stock_out'
      in_set 'first'
      highlights_on :controller => 'stock_out'
    end
    t.named _('Stock Out Control')

  end

  def select_category
    payment_method = params[:payment_method]
    if !payment_method.blank?
      @ledger = Ledger.new_ledger(:payment_method => payment_method)
      @banks = Bank.find(:all)
      @hide_sign = true
      @ledger_categories =  @organization.stock_ledger_categories_by_payment_method(@ledger.payment_method)
      render :partial => 'shared_payments/select_category'
    else
      render :nothing => true
    end
  end

end
