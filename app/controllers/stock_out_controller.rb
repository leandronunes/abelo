class StockOutController < StockBaseController

  def list
    @query = params[:query]
    @query ||= params[:product][:name] if params[:product]

    if @query.nil?
      @stocks = @organization.stock_virtual_outs
      @stock_pages, @stocks = paginate_by_collection @stocks
    else
      @stocks = StockVirtual.create_virtual_outs(@organization.products.full_text_search(@query))
      @stock_pages, @stocks = paginate_by_collection @stocks
    end

    render :template => 'stock/list'


  end
  
  def history
    begin
      @product = @organization.products.find(params[:product_id])
      @stocks = @product.stock_outs
    rescue
      redirect_to :action => 'index'
    end
    render :template => 'stock/history'
  end

  def new
    begin
      product = @organization.products.find(params[:product_id])
      @stock = StockOut.new
      @stock.product = product
      @suppliers = product.suppliers
    rescue
      redirect_to :controller => 'products', :action => 'new'
    end

    render :template => 'stock/new'
  end

  def create
    product = @organization.products.find(params[:product_id])
    @stock = StockOut.new(params[:stock])
    @stock.product = product

    display_layout =  !request.xml_http_request?

    if @stock.save
      flash[:notice] = _('It was successfully created.')
      if display_layout
        redirect_to :action => 'history', :product_id => product
      else
        @product = @stock.product
        @suppliers = @product.suppliers 
        @banks = Bank.find(:all)
        @ledger = Ledger.new_ledger
        @ledger_categories =  @organization.ledger_categories_by_payment_method(@ledger.payment_method)
        render :update do |page|
          page.replace_html 'add_payment', :partial => 'edit'
        end
      end
    else
      @ledgers = @stock.ledgers
      @suppliers = product.suppliers
      render :update do |page|
        page.replace_html 'stock_form', :partial => 'form'
      end
    end
  end

end
