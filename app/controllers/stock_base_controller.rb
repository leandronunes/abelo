class StockBaseController < ApplicationController

  needs_organization

  before_filter :create_tabs

  def autocomplete_supplier
    escaped_string = Regexp.escape(params[:supplier][:name])
    re = Regexp.new(escaped_string, "i")
    stocks = @organization.products.find(params[:product_id]).stocks
    suppliers = stocks.map{|s| s.supplier}
    @suppliers = suppliers.select{|s| s.name.match re}
    @suppliers.uniq!
    render :layout=>false
  end

  def autocomplete_name
    escaped_string = Regexp.escape(params[:product][:name])
    re = Regexp.new(escaped_string, "i")
    @products = @organization.products.select{|p| p.name.match re}
    render :layout=>false
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  post_only [ :create, :update ]

  def index
    redirect_to :action => 'list'
  end

  def list
    @query = params[:query]
    @query ||= params[:product][:name] if params[:product]

    if @query.nil?
      @stocks = @organization.stock_virtuals
      @stock_pages, @stocks = paginate_by_collection @stocks
    else
      @stocks = StockVirtual.create_virtuals(@organization.products.full_text_search(@query))
      @stock_pages, @stocks = paginate_by_collection @stocks
    end
  end

  def show
    @stock = Stock.find(params[:id])
    @ledgers = @stock.ledgers
  end
  
  def history
    begin
      @product = @organization.products.find(params[:product_id])
      @stocks = @product.stocks
    rescue
      redirect_to :action => 'index'
    end
  end

  def new
    begin
      product = @organization.products.find(params[:product_id])
      @stock = StockIn.new
      @stock.product = product
      @suppliers = product.suppliers
    rescue
      redirect_to :controller => 'products', :action => 'new'
    end
  end

  def create
    product = @organization.products.find(params[:product_id])
    @stock = StockIn.new(params[:stock])
    @stock.product = product

    display_layout =  !request.xml_http_request?

    if @stock.save
      flash[:notice] = _('It was successfully created.')
      if display_layout
        redirect_to :action => 'history', :product_id => product
      else
        @product = @stock.product
        @suppliers = @product.suppliers 
        @banks = Bank.find(:all)
        @ledger = Ledger.new_ledger
        @ledger_categories =  @organization.ledger_categories_by_payment_method(@ledger.payment_method)
        render :update do |page|
          page.replace_html 'add_payment', :partial => 'edit'
        end
      end
    else
      @ledgers = @stock.ledgers
      @suppliers = product.suppliers
      render :update do |page|
        page.replace_html 'stock_form', :partial => 'form'
      end
    end
  end

  def add_payment
    @stock = @organization.stocks.find(params[:id])
    @product = @stock.product
    @suppliers = @product.suppliers
    @ledger = Ledger.new_ledger()
    @banks = Bank.find(:all)
    @ledger_categories =  @organization.ledger_categories_by_payment_method(@ledger.payment_method)
    render :update do |page|
      page.replace_html 'payment', :partial => 'payment'
      page.replace_html 'stock_options', " "
    end
  end  

  def create_payment
    @stock = @organization.stocks.find(params[:id])
    ledger = Ledger.new_ledger(params[:ledger])
    ledger.owner = @stock
    ledger.bank_account = @stock.default_bank_account

    if ledger.save
      @ledgers = @stock.ledgers
      @product = @stock.product
      @suppliers = @product.suppliers
      @ledger_categories =  @organization.ledger_categories_by_payment_method(ledger.payment_method)
      render :update do |page|
        page.replace_html 'partial_edit', :partial => 'edit'
      end
    else
      @ledger = ledger
      @product = @stock.product
      @suppliers = @product.suppliers
      @banks = Bank.find(:all)
      @ledger_categories =  @organization.ledger_categories_by_payment_method(@ledger.payment_method)
      render :update do |page|
        page.replace_html 'payment', :partial => 'payment'
      end
    end
  end


  def edit
    @stock = Stock.find(params[:id])
    @product = @stock.product
    @suppliers = @product.suppliers
    @ledgers = @stock.ledgers
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
    t.named _('Stock In Control')
  end

  def select_category
    payment_method = params[:payment_method]
    if !payment_method.blank?
      @ledger = Ledger.new_ledger(:payment_method => payment_method)
      @banks = Bank.find(:all)
      @hide_sign = true
      @ledger_categories =  @organization.ledger_categories_by_payment_method(@ledger.payment_method)
      render :partial => 'shared_payments/select_category'
    else
      render :nothing => true
    end
  end

end
