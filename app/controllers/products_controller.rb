class ProductsController < ApplicationController

  auto_complete_for :product, :name

  needs_organization

  uses_register_tabs

  def autocomplete_name
    escaped_string = Regexp.escape(params[:product][:name])
    re = Regexp.new(escaped_string, "i")
    @products = @organization.products.select { |pr| pr.name.match re}
    render :layout=>false
  end

  def index
    list
  #  render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @query = params[:query]
    @query ||= params[:product][:name] if params[:product]

    if @query.nil?
      @products = @organization.products
      @product_pages, @products = paginate_by_collection @products
    else
      @products = @organization.products.full_text_search(@query)
      @product_pages, @products = paginate_by_collection @products
    end
  end

  def show
    @product = @organization.products.find(params[:id])
  end

  def new
    @product = Product.new
    @product.organization = @organization
    @suppliers = @organization.suppliers
    @sizes = Size.find(:all)
    @colors = Color.find(:all)
    @units = Unit.find(:all)
  end

  def create
    @product = Product.new(params[:product])
    @product.organization = @organization
    @product.supplier_ids = params[:suppliers].keys if params[:suppliers]
    if @product.save
      flash[:notice] = 'Product was successfully created.'
      redirect_to :action => 'list'
    else
      @suppliers = @organization.suppliers
      @sizes = Size.find(:all)
      @colors = Color.find(:all)
      @units = Unit.find(:all)
      render :action => 'new'
    end
  end

  def edit
    begin
      @product = @organization.products.find(params[:id])
    rescue
      @message = _('The product was not found')
      render :template => 'shared/not_found'
    end
    @suppliers = @organization.suppliers
    @sizes = Size.find(:all)
    @colors = Color.find(:all)
    @units = Unit.find(:all)
  end

  def update
    @product = @organization.products.find(params[:id])
    @product.supplier_ids = params[:suppliers].keys if params[:suppliers]

    if @product.update_attributes(params[:product])
      flash[:notice] = _('Product was successfully updated.')
      redirect_to :action => 'list'
    else
      @suppliers = @organization.suppliers
      @sizes = Size.find(:all)
      @colors = Color.find(:all)
      @units = Unit.find(:all)
      render :action => 'edit'
    end
  end

  def destroy
    @organization.products.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

#TODO It's not used yet
#
#  def reset
#    begin 
#      @product = Product.find(params[:id])
#    rescue
#      @product = Product.new
#    end
#    @product.organization = @organization
#    @suppliers = @organization.suppliers
#    @sizes = Size.options
#    @colors = Color.options
#    @units = Unit.options
#    render :partial => 'form'
#  end

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
      flash[:notice] = _('Image was successfully added.')
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
