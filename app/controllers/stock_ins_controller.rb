class StockInsController < ApplicationController

  needs_organization
  uses_stock_tabs

  helper StockHelper

  ###################################
  # Include Payment Related Methods
  ###################################
  require 'payment/payment_actions'
  include PaymentActions

  def payment_object
    @organization.stock_ins.find(params[:id])  
  end

  def autocomplete_product_name
    escaped_string = Regexp.escape(params[:product][:name])
    re = Regexp.new(escaped_string, "i")
    @products = @organization.products.select{|p| p.name.match re}
    render :template => 'stock_base/autocomplete_product_name', :layout => false
  end

  def autocomplete_supplier_name
    escaped_string = Regexp.escape(params[:supplier][:name])
    re = Regexp.new(escaped_string, "i")
    @suppliers = @organization.suppliers.select{|s| s.name.match re}
    render :template => 'stock_base/autocomplete_supplier_name', :layout => false
  end

  def index
    redirect_to :action => 'list'
  end

  def list
    @query = params[:query]
    @query ||= params[:product][:name] if params[:product]

    @stocks = @organization.stock_virtual_ins(@query)
    @stock_pages, @stocks = paginate_by_collection @stocks
    @title = t(:stock_replenishment_control)
    render :template => 'stock_base/list'
  end

  def show
    @stock = @organization.stock_ins.find(params[:id])
    @title = t(:stock_replenishment)
    render :template => 'stock_base/show'
  end

  def new
    unless params[:product_id].nil?
      redirect_to :action => 'add', :product_id => params[:product_id]
      return
    end

    @stock = StockIn.new(:date => Date.today, :amount => 1)
    @products = @organization.products
    @suppliers = @organization.suppliers
    @title = t(:stock_replenishment_of_product)
  end

  def add
    product = @organization.products.find(params[:product_id])
    @suppliers = @organization.suppliers
    @stock = StockIn.new(:product => product, :date => Date.today, :amount => 1)
  end

  def create
    @stock = StockIn.new(params[:stock])
    @stock.organization = @organization
    @stock.product = @organization.products.find(params[:product_id]) unless params[:product_id].blank?
    if @stock.save
      redirect_to :action => 'edit', :id => @stock
    else
      @suppliers = @organization.suppliers
      if params[:product_id].nil?
        @products = @organization.products
        render :action => 'new'
      else
        render :action => 'add'
      end
    end
  end

  def edit
    @stock = @organization.stock_ins.find(params[:id])
    @payment_object = @stock
    @suppliers = @organization.suppliers
    @products = @organization.products
    @ledgers = @stock.ledgers
    @ledger = Ledger.new(:date => Date.today, :value => @stock.balance)
    @ledger_categories =  @organization.stock_ledger_categories_by_payment_method(@ledger.payment_method)
  end

  def update
    @stock = @organization.stock_ins.find(params[:id])
    if @stock.update_attributes(params[:stock])
        redirect_to :action => 'history', :product_id => @stock.product
    else
      @payment_object = @stock
      @suppliers = @organization.suppliers
      @products = @organization.products
      @ledgers = @stock.ledgers
      @ledger = Ledger.new(:date => Date.today)
      @ledger_categories =  @organization.stock_ledger_categories_by_payment_method(@ledger.payment_method)
      render :action => 'edit'
    end
  end

  def history
    @product = @organization.products.find(params[:product_id])
    @stocks = @product.stock_ins
    @title  = t(:stock_replenishment_history)
    render :template => 'stock_base/history'
  end

  def destroy
    @stock = @organization.stock_ins.find(params[:id])
    @stock.destroy
    redirect_to :action => 'history', :product_id => @stock.product
  end

end
