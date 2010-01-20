class StockDevolutionsController < ApplicationController

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

    @stocks = @organization.stock_virtual_devolutions(@query)
    @stock_pages, @stocks = paginate_by_collection @stocks
    @title = t(:stock_devolution_control)
    render :template => 'stock_base/list'
  end

  def show
    @stock = @organization.stock_devolutions.find(params[:id])
    @title = t(:devolution)
    render :template => 'stock_base/show'
  end

  def new
    unless params[:product_id].nil?
      redirect_to :action => 'add', :product_id => params[:product_id] 
      return
    end
    @stock = StockDevolution.new(:date => Date.today, :amount => 1)
    @products = @organization.products
    @title = t(:devolution_of_product)
    render :template => 'stock_base/new'
  end

  def add
    product = @organization.products.find(params[:product_id])
    @stock = StockDevolution.new(:product => product, :date => Date.today, :amount => 1)
    @title = t(:devolution_of_product)
    render :template => 'stock_base/add'
  end

  def create
    @stock = StockDevolution.new(params[:stock])

    if @stock.save
      flash[:notice] = t(:it_was_successfully_created)
      redirect_to :action => 'history', :product_id => @stock.product
    else
      @products = @organization.products
      if params[:product_id].blank?
        @title = t(:devolution_of_product)
        render :template => 'stock_base/new'
      else
        @title = t(:devolution_of_product)
        render :template => 'stock_base/add'
      end
    end
  end

  def history
    @product = @organization.products.find(params[:product_id])
    @stocks = @product.stock_devolutions
    @title  = t(:devolution_history_of)
    render :template => 'stock_base/history'
  end

  def destroy
    stock = @organization.stock_devolutions.find(params[:id]).destroy
    redirect_to :action => 'history', :product_id => stock.product
  end

  def edit
    @stock = @organization.stock_devolutions.find(params[:id])
    @products = @organization.products
    @title = t(:edit_devolution_of_product)
    render :template => 'stock_base/edit'
  end

  def update
    @stock = @organization.stock_devolutions.find(params[:id])

    if @stock.update_attributes(params[:stock])
      redirect_to :action => 'history', :product_id => @stock.product
    else
      @products = @organization.products
      @title = t(:edit_devolution_of_product)
      render :template => 'stock_base/edit'
    end
  end

end
