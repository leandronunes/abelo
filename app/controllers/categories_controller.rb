class CategoriesController < ApplicationController

  CATEGORY_TYPES = %w[
    product
    customer
    contact
    worker
    supplier
  ]

  needs_organization

  before_filter :create_tabs

  # Show all available categories of the system
  def index
    redirect_to :action => 'list', :category_type => 'product'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @category_type = params[:category_type] if CATEGORY_TYPES.include?(params[:category_type])
    render_access_denied_screen if @category_type.blank?
    @categories = @organization.send("#{@category_type}_categories")
  end

  def new
    @category_type = params[:category_type]
    if CATEGORY_TYPES.include?(@category_type)
      @category = Category.new
      @category.parent_id = params[:parent_id]
      render :action => 'new'
    else 
      render_error(_("This type didn't exist"))
    end
  end

  def create
    @category_type = params[:category_type] if CATEGORY_TYPES.include?(params[:category_type])
    if @category_type.blank?
      render_error(_("This type didn't exist"))
      return
    end

    @category = eval("#{@category_type.camelize}Category").new(params[:category])
    @category.organization = @organization
    if @category.save
      flash[:notice] = _('Category was successfully created.')
      redirect_to :action => 'list', :category_type => @category_type
    else
      render :action => 'new'
    end
  end

  def edit
    @category = @organization.product_categories.find(params[:id])
  end

  def update
    @category = @organization.categories.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = _('Category was successfully updated.')
      redirect_to :action => 'list', :category_type => @category.type.to_s.gsub(/Category/,'').downcase
    else
      render :action => 'edit', :id => @category
    end
  end

  def destroy
    category = @organization.categories.find(params[:id])
    category_type  = category.type.to_s.gsub(/Category/,'').downcase
    category.destroy
    redirect_to :action => 'list', :category_type => category_type
  end

  def create_tabs
    add_tab do
      named 'Product categories'
      links_to :controller => 'categories', :action => 'list', :category_type => 'product'
      in_set 'first'
      highlights_on :controller => 'categories', :category_type => 'product'
    end
    add_tab do
      named 'Customer categories'
      links_to :controller => 'categories', :action => 'list', :category_type => 'customer'
      in_set 'first'
      highlights_on :controller => 'categories', :category_type => 'customer'
    end
    add_tab do
      named 'Worker categories'
      links_to :controller => 'categories', :action => 'list', :category_type => 'worker'
      in_set 'first'
      highlights_on :controller => 'categories', :category_type => 'worker'
    end
    add_tab do
      named 'Supplier categories'
      links_to :controller => 'categories', :action => 'list', :category_type => 'supplier'
      in_set 'first'
      highlights_on :controller => 'categories', :category_type => 'supplier'
    end

  end

end
