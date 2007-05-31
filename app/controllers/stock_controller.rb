class StockController < ApplicationController

  needs_organization

  def index
    @products = @organization.products
  end

  def history
    @product = @organization.products.find(params[:id])
    @entries = @product.stock_entries

    @total_ammount = @product.ammount_in_stock
    @total_cost = @product.total_cost

  end

  def new_entry
    @product = @organization.products.find(params[:id])
    @entry = StockIn.new
    @entry.product = @product
  end

  def add_entry
    @product = @organization.products.find(params[:id])
    @entry = StockIn.new(params[:entry])
    @entry.product = @product
    if @entry.save
      
      # Create a new item in cash flow
      cf = CashFlow.new
      cf.add_stock_entry(@entry.id)
      # end of creation
      
      flash[:notice] = 'Stock entry was successfully created and was added to cash flow too.'
      redirect_to :action => 'history', :id => @product
    else
      render :action => 'new_entry'
    end

  end

end
