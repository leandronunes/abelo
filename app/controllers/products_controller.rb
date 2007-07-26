class ProductsController < ApplicationController

  auto_complete_for :product, :description

  needs_organization

  before_filter :create_tabs

  def autocomplete_description
    re = Regexp.new("#{params[:product][:description]}", "i")
    @products = Product.find(:all).select { |pr| pr.description.match re}
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
    @products = @organization.products

    @query = params[:query] ? params[:query] : nil
    if @query.nil?
      @query = params[:product] ? params[:product][:description] : nil
    end

    if !@query.nil?
      page = (params[:page] || 1).to_i
      items_per_page = 10
      offset = (page - 1) * items_per_page

      @products = Product.find_by_contents(@query, {:limit => :all, :offset => 0})
      @product_pages = Paginator.new(self, @products.size, items_per_page, page)
      @products = @products[offset..(offset + items_per_page - 1)]
    else 
      @product_pages, @products = paginate :product, :per_page => 10, :conditions => ["organization_id = ?", @organization.id ] 
    end
    @product = Product.new
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

  def create_tabs
    add_tab do
      named 'Workers'
      links_to :controller => 'system_actors', :action => 'list', :actor => 'worker'
      in_set 'first'
      highlights_on :controller => 'system_actors', :actor => 'worker'
    end
    add_tab do
      named 'Customers'
      links_to :controller => 'system_actors', :action => 'list', :actor => 'customer'
      in_set 'first'
      highlights_on :controller => 'system_actors', :actor => 'customer'
    end
    add_tab do
      named 'Suppliers'
      links_to :controller => 'system_actors', :action => 'list', :actor => 'supplier'
      in_set 'first'
      highlights_on :controller => 'system_actors', :actor => 'supplier'
    end
    add_tab do
      named 'Products'
      links_to :controller => 'products', :action => 'list'
      in_set 'first'
      highlights_on :controller => 'products'
    end
  end

  
end
