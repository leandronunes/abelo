class StockDownsController < ApplicationController

  needs_organization

  uses_stock_tabs

  helper StockHelper

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  post_only [ :create, :update ]

  def autocomplete_supplier_name
    escaped_string = Regexp.escape(params[:supplier][:name])
    re = Regexp.new(escaped_string, "i")
    @suppliers = @organization.suppliers.select{|s| s.name.match re}
    render :template => 'stock_base/autocomplete_supplier_name', :layout=>false
  end

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

    @stocks = @organization.stock_virtual_downs(@query)
    @stock_pages, @stocks = paginate_by_collection @stocks
    @title = _('Stock Down Control')
    render :template => 'stock_base/list'
  end

  def show
    @stock = @organization.stock_downs.find(params[:id])
    @title = _('Stock Down')
    render :template => 'stock_base/show'
  end

  def new
    unless params[:product_id].nil?
      redirect_to :action => 'add', :product_id => params[:product_id]
      return
    end
    @stock = StockDown.new(:date => Date.today, :amount => 1)
    @products = @organization.products
    @title = _('Stock Down of Product')
    render :template => 'stock_base/new'
  end

  def add
    product = @organization.products.find(params[:product_id])
    @stock = StockDown.new(:product => product, :date => Date.today, :amount => 1)
    @title = _('Stock Down of Product %s') % product.name
    render :template => 'stock_base/add'
  end

  def create
    @stock = StockDown.new(params[:stock])

    if @stock.save
      flash[:notice] = _('It was successfully created.')
      redirect_to :action => 'history', :product_id => @stock.product
    else
      @products = @organization.products
      if params[:product_id].blank?
        @title = _('Stock Down of Product')
        render :template => 'stock_base/new'
      else
        @title = _('Stock Down of Product %s') % @stock.product.name
        render :template => 'stock_base/add'
      end
    end
  end

  def history
    @product = @organization.products.find(params[:product_id])
    @stocks = @product.stock_downs
    @title  = _('Stock Down History of %s') % "<b>#{@product.name} </b>"
    render :template => 'stock_base/history'
  end

  def destroy
    stock = @organization.stock_downs.find(params[:id]).destroy
    redirect_to :action => 'history', :product_id => stock.product
  end

  def edit
    @stock = @organization.stock_downs.find(params[:id])
    @products = @organization.products
    @title = _('Edit Stock Down of Product')
    render :template => 'stock_base/edit'
  end

  def update
    @stock = @organization.stock_downs.find(params[:id])

    if @stock.update_attributes(params[:stock])
      redirect_to :action => 'list'
    else
      @products = @organization.products
      @title = _('Edit Stock Down of Product')
      render :template => 'stock_base/edit'
    end
  end

end
