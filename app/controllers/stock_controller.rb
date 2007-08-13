class StockController < ApplicationController

  needs_organization

  before_filter :create_tabs

  def autocomplete_name
    escaped_string = Regexp.escape(params[:product][:name])
    re = Regexp.new(escaped_string, "i")
    @product = Product.find(:all).select { |sa| sa.name.match re}
    render :layout=>false
  end


  def index
    search_param = params[:product].nil? ? nil : params[:product][:name]
    @products = search_param.blank? ? @organization.products : @organization.products.full_text_search(search_param)
    @product_pages, @products = paginate @products
  end

  def history
    @product = @organization.products.find(params[:id])
    @entries = @product.stock_entries

    @total_ammount = @product.ammount_in_stock
    @total_cost = @product.total_cost

    @entry = StockIn.new
    @entry.product = @product
  end

  def show_history
    @entry = StockEntry.find(params[:id])
    @product = @organization.products.find(params[:product_id])
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
  
  def edit_entry
    @product = @organization.products.find(params[:product_id])
    @entry = StockEntry.find(params[:id])
    render :partial => 'edit'
  end

  def update_entry
    @entry = StockEntry.find(params[:entry])
    if @entry.update_attributes(params[:entry])
      flash[:notice] = 'Entry was successfully updated.'
      redirect_to :action => 'list'
    else
      render :partial => 'edit', :status => 409
    end
  end

  def create_tabs
    add_tab do
      named 'Stock Control'
      links_to :controller => 'stock'
      in_set 'first'
      highlights_on :controller => 'stock'
    end
  end

end
