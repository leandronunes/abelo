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
      render :action => 'new'
    end
  end

  def edit
    @product = @organization.products.find(params[:id])
  end

  def update
    @product = @organization.products.find(params[:id])
    @product.supplier_ids = params[:suppliers].keys if params[:suppliers]
    if @product.update_attributes(params[:product])
      flash[:notice] = 'Product was successfully updated.'
      redirect_to :action => 'list'
    else
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
    image = Image.new(params[:image])
    @product.images.push(image)
    if  @product.save
      redirect_to :action => 'images', :id => @product
    else
      render :action => 'images'
    end
  end

end
