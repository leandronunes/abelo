class StockDevolutionController < ApplicationController

  needs_organization

  uses_stock_tabs

  helper StockHelper

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  post_only [ :create, :update ]

  def autocomplete_supplier_name
    escaped_string = Regexp.escape(params[:supplier][:name])
    re = Regexp.new(escaped_string, "i")
    @suppliers = @organization.suppliers.select{|s| s.name.match re}
    render :template => 'autocomplete_supplier', :layout=>false
  end

  def autocomplete_product_name
    escaped_string = Regexp.escape(params[:product][:name])
    re = Regexp.new(escaped_string, "i")
    @products = @organization.products.select{|p| p.name.match re}
    render :template => 'stock_base/autocomplete_name', :layout=>false
  end

  def index
    redirect_to :action => 'list'
  end

  def list
    @query = params[:query]
    @query ||= params[:product][:name] if params[:product]

    @stocks = @organization.stock_virtual_devolutions(@query)
    @stock_pages, @stocks = paginate_by_collection @stocks
    render :template => 'stock_base/list'
  end

  def new
    product = @organization.products.find(params[:product_id])
    @stock = StockDevolution.new(:product => product, :date => Date.today, :amount => 1)
    @suppliers = @organization.suppliers
  end

  def create
    @stock = StockDevolution.new(params[:stock])

    if @stock.save
      flash[:notice] = _('It was successfully created.')
      redirect_to :action => 'list'
    else
      @suppliers = []
      render :template => 'stock_base/new'
    end
  end

  def history
    @product = @organization.products.find(params[:product_id])
    @stocks = @product.stock_devolutions
    render :template => 'stock_base/history'
  end

  def destroy
    stock = @organization.stock_devolutions.find(params[:id]).destroy
    redirect_to :action => 'history', :product_id => stock.product
  end
end
