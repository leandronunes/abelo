class StockBaseController < ApplicationController

  def show
    @stock = Stock.find(params[:id])
    @ledgers = @stock.ledgers if @stock.respond_to?('ledgers')

    render :template => 'stock_base/show'
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

  def select_category
    payment_method = params[:payment_method]
    if !payment_method.blank?
      @ledger = Ledger.new_ledger(:payment_method => payment_method)
      @banks = Bank.find(:all)
      @hide_sign = true
      @ledger_categories =  @organization.stock_ledger_categories_by_payment_method(@ledger.payment_method)
      render :partial => 'payment_details'
    else
      render :nothing => true
    end
  end

end
