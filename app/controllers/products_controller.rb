class ProductsController < ApplicationController

  needs_organization

  uses_register_tabs

  def autocomplete_product_name
    escaped_string = Regexp.escape(params[:product][:name])
    re = Regexp.new(escaped_string, "i")
    @products = @organization.products.select { |pr| pr.name.match re}
    render :layout=>false
  end

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @query = params[:query]
    @query ||= params[:product][:name] if params[:product]

    if @query.nil?
      @products = @organization.products_sorted.paginate(:per_page => 10,:page => params[:page] )
    else
      @products = @organization.products.full_text_search(@query).paginate(:per_page => 10,:page => params[:page] )
    end
  end

  def show
    @product = @organization.products.find(params[:id])
    @customers = @product.customers
  end

  def new
    @product = Product.new
    @product.organization = @organization
    @product.code = @product.suggest_code
    @sizes = Size.find(:all)
    @colors = Color.find(:all)
    @units = @organization.unit_measures
    @suppliers = @organization.suppliers
    @categories = @organization.product_categories
  end

  def new_stock_entry
    @entry = StockIn.new
    @suppliers = @organization.suppliers
    if params[:checked] == "1"
      render :partial => 'new_stock_entry'
    else
      render :nothing => true
    end
  end

  def create
    @product = Product.new(params[:product])
    @product.organization = @organization
    if @product.save
      flash[:notice] = t(:the_product_was_successfully_created)
      redirect_to :action => 'list'
    else
      @product.code = @product.suggest_code
      @suppliers = @organization.suppliers
      @sizes = Size.find(:all)
      @colors = Color.find(:all)
      @units = @organization.unit_measures
      @categories = @organization.product_categories
      render :action => 'new'
    end
  end

  def edit
    begin
      @product = @organization.products.find(params[:id])
    rescue
      @message = t(:the_product_was_not_found)
      render :template => 'shared/not_found'
    end
    @suppliers = @organization.suppliers
    @categories = @organization.product_categories
    @sizes = Size.find(:all)
    @colors = Color.find(:all)
    @units = @organization.unit_measures
  end

  def update
    @product = @organization.products.find(params[:id])
    @product.supplier_ids = params[:suppliers].keys if params[:suppliers]

    if @product.update_attributes(params[:product])
      flash[:notice] = t(:product_was_successfully_updated)
      redirect_to :action => 'list'
    else
      @suppliers = @organization.suppliers
      @sizes = Size.find(:all)
      @colors = Color.find(:all)
      @units = @organization.unit_measures
      render :action => 'edit'
    end
  end

  def destroy
    @organization.products.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def images
    @product = @organization.products.find(params[:id])
    @image = Image.new
  end

  def add_image
    @product = @organization.products.find(params[:id])
    @image = Image.new(params[:image])
    @image.product_id = params[:id]
    if @image.save
      @product.images.push(@image)
      flash[:notice] = t(:image_was_successfully_added)
      redirect_to :action => 'images', :id => @product
    else
      render :action => 'images', :id => @product
    end
  end

  def remove_image
    Image.find(params[:image_id]).destroy
    redirect_to :action => 'images', :id => params[:product_id]
  end


end
