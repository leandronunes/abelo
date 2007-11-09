class StockInController < StockBaseController

  def list
    @query = params[:query]
    @query ||= params[:product][:name] if params[:product]

    if @query.nil?
      @stocks = @organization.stock_virtual_ins
      @stock_pages, @stocks = paginate_by_collection @stocks
    else
      @stocks = StockVirtual.create_virtual_ins(@organization.products.full_text_search(@query))
      @stock_pages, @stocks = paginate_by_collection @stocks
    end

    render :template => 'stock/list'
  end

  def history
    begin
      @product = @organization.products.find(params[:product_id])
      @stocks = @product.stock_ins
    rescue
      redirect_to :action => 'index'
    end

    render :template => 'stock/history'
  end


end
