class StockController < ApplicationController

  needs_organization

  before_filter :create_tabs

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def index
    search_param = params[:product].nil? ? nil : params[:product][:name]
    @products = search_param.blank? ? @organization.products : @organization.products.find_by_contents(search_param)
    @product_pages, @products = paginate_by_collection @products
  end
  
  def history
    @product = @organization.products.find(params[:id])
    @entries = @product.stock_entries

    @total_ammount = @product.ammount_in_stock
    @total_cost = @product.total_cost

    @entry = StockIn.new
    @entry.product = @product
  end

  def new
    @product = @organization.products.find(params[:id])
    @entry = StockIn.new
    @entry.product = @product
  end

  def create
    @product = @organization.products.find(params[:id])
    @entry = StockIn.new(params[:entry])
    @entry.product = @product
    if @entry.save
      flash[:notice] = 'Stock entry was successfully created and was added to cash flow too.'
      redirect_to :action => 'history', :id => @product
    else
      render :action => 'new'
    end
  end
  
  def edit
    @product = @organization.products.find(params[:product_id])
    @entry = StockEntry.find(params[:id])
  end

  def update
    @entry = StockEntry.find(params[:id])
    if @entry.update_attributes(params[:entry])
      flash[:notice] = 'Entry was successfully updated.'
      redirect_to :action => 'history', :id => params[:product_id]
    else
      render :action => 'edit', :id => @entry.id, :product_id => params[:product_id]
    end
  end

  def destroy
    @entry = StockEntry.find(params[:id])
    @entry.destroy
    redirect_to :action => 'history', :id => params[:product_id]
  end

  def create_tabs
    t = add_tab do
      links_to :controller => 'stock'
      in_set 'first'
      highlights_on :controller => 'stock'
    end
    t.named _('Stock control')
  end

end
