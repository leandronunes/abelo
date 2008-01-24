class StockController < ApplicationController

  helper StockHelper

  needs_organization
    
  uses_stock_tabs

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
    begin
      product = @organization.products.find(params[:product_id])
      @stock = StockIn.new(:product => product, :date => Date.today, :amount => 1)
      @suppliers = product.suppliers
    rescue
      redirect_to :controller => 'products', :action => 'new'
    end
  end

  def create
    product = @organization.products.find(params[:product_id])
    @stock = StockIn.new(params[:stock])
    @stock.product = product
    @stock.invoice = Invoice.find(:first)

    if @stock.save
      flash.now[:notice] = _('It was successfully created.')
      if !request.xml_http_request?
        redirect_to :action => 'history', :product_id => product
      else
        @product = @stock.product
        @suppliers = @product.suppliers
        @ledger = Ledger.new_ledger(:value => @stock.price, :date => @stock.date)
        @ledger_categories =  @organization.stock_ledger_categories_by_payment_method(@ledger.payment_method)
        render :update do |page|
          page.replace_html 'stock_in_entry', :partial => 'extended_form'
        end
      end
    else
      @suppliers = product.suppliers
      if !request.xml_http_request?
        render :action => 'new'
      else
        render :update do |page|
          page.replace_html 'stock_form', :partial => 'stock_base/form'
          end
      end
    end
  end


  def create_payment
    @stock = @organization.stocks.find(params[:id])
    ledger = Ledger.new_ledger(params[:ledger])
    ledger.owner = @stock
    ledger.bank_account = @stock.default_bank_account
    ledger.done!

    if ledger.save
      @ledgers = @stock.ledgers
      @product = @stock.product
      @suppliers = @product.suppliers
      @ledger_categories =  @organization.stock_ledger_categories_by_payment_method(ledger.payment_method)
      render :update do |page|
        page.replace_html 'stock_in_entry', :partial => 'extended_form'
      end
    else
      @ledger = ledger
      @ledger_categories =  @organization.stock_ledger_categories_by_payment_method(@ledger.payment_method)
      render :update do |page|
        page.replace_html 'add_payment', :partial => 'payment'
      end
    end
  end

  def add_payment
    @stock = @organization.stocks.find(params[:id])
    @ledger = Ledger.new_ledger(:date => @stock.date, :value => @stock.price)
    @ledger_categories =  @organization.stock_ledger_categories_by_payment_method(@ledger.payment_method)
    render :update do |page|
      page.replace_html 'add_payment', :partial => 'payment'
      page.replace_html 'stock_options', " "
    end
  end

  def history
    @product = @organization.products.find(params[:product_id])
    @stocks = @product.stocks
    render :template => 'stock_base/history'
  end

end
