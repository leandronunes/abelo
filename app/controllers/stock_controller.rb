class StockController < StockBaseController 

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

  def history
    begin
      @product = @organization.products.find(params[:product_id])
      @stocks = @product.stocks
    rescue
      redirect_to :action => 'index'
    end
  end


end
