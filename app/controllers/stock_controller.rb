class StockController < ApplicationController

  needs_organization

  before_filter :create_tabs

  def autocomplete_name
    escaped_string = Regexp.escape(params[:product][:name])
    re = Regexp.new(escaped_string, "i")
    @products = @organization.products.select { |pr| pr.name.match re}
    render :layout=>false
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  post_only [ :destroy, :create, :update ]

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
  end
  
  def history
    @product = @organization.products.find(params[:product_id])
    @stocks = @product.stock_ins

    @total_amount = @product.amount_in_stock
    @total_cost = @product.total_cost

    @stock_pages, @stocks = paginate_by_collection @stocks
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
    @stock.ledger = Ledger.new_ledger(params[:ledger])

    if @stock.save
      flash[:notice] = 'Stock stock was successfully created.'
      redirect_to :action => 'history', :product_id => product
    else
      @ledger = @stock.ledger
      @suppliers = product.suppliers
      @banks = Bank.find(:all)
      @ledger_categories =  @organization.ledger_categories_by_payment_method(@stock.payment_method)
      render :action => 'new'
    end
  end
  

  def edit
    @stock = Stock.find(params[:id])
    @product = @stock.product
    @suppliers = @product.suppliers
    @ledger = @stock.ledger
    @ledger_categories =  @organization.ledger_categories_by_payment_method(@stock.payment_method)
  end

  def update
    @stock = Stock.find(params[:id])
    if @stock.update_attributes(params[:entry])
      flash[:notice] = 'Entry was successfully updated.'
      redirect_to :action => 'history', :product_id => @stock.product
    else
      @product = @organization.products.find(params[:product_id])
      render :action => 'edit'
    end
  end

  def destroy
    stock = Stock.find(params[:id])
    product = stock.product
    stock.destroy
    redirect_to :action => 'history', :product_id => product
  end

  def create_tabs
    t = add_tab do
      links_to :controller => 'stock'
      in_set 'first'
      highlights_on :controller => 'stock'
    end
    t.named _('Stock control')
  end

  def select_category
    payment_method = params[:payment_method]
    if !payment_method.blank?
      @ledger = Ledger.new_ledger(:payment_method => payment_method)
      @banks = Bank.find(:all)
      @ledger_categories =  @organization.ledger_categories_by_payment_method(@ledger.payment_method)
      render :partial => 'shared_payments/select_category'
    else
      render :nothing => true
    end
  end

end
