class ProductsController < ApplicationController

  needs_organization

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @products = @organization.products
    @product = Product.new
    @product.organization = @organization 
  end

  def show
    @product = @organization.products.find(params[:id])
  end

  def new
    @product = Product.new
    @product.organization = @organization
  end

  def create
    @product = Product.new(params[:product])
    @product.organization = @organization
    @product.supplier_ids = params[:suppliers].keys if params[:suppliers]
    if @product.save
      flash[:notice] = 'Product was successfully created.'
      redirect_to :action => 'list'
    else
      render :partial => 'new', :status => 409
    end
  end

  def edit
    @product = @organization.products.find(params[:id])
  end

  def update
    @product = @organization.products.find(params[:id])
    @product.supplier_ids = params[:suppliers].keys if params[:suppliers]
    if @product.update_attributes(params[:product])
      flash[:notice] = _('Product was successfully updated.')
      redirect_to :action => 'list'
    else
      render :action => 'edit', :status => 409
    end
  end

  def destroy
    @organization.products.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def reset
    @product = Product.new
    @product.organization = @organization
    render :partial => 'form'
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
