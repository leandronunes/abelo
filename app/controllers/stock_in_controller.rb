class StockInController < StockBaseController

  def list
    @query = params[:query]
    @query ||= params[:product][:name] if params[:product]

    if @query.nil?
      @stocks = @organization.stock_virtual_ins
      @stock_pages, @stocks = paginate_by_collection @stocks
    else
      @stocks = StockVirtual.create_virtuals(@organization.products.full_text_search(@query))
      @stock_pages, @stocks = paginate_by_collection @stocks
    end

    render :template => 'stock/list'
  end

end
