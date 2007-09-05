class ProductCategoriesController < ApplicationController

  needs_organization

  def index
    redirect_to :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @product_categories = @organization.product_categories
  end

  def new
    @product_category = ProductCategory.new
    @product_category.parent = @organization.product_categories.find(params[:parent_id]) if params[:parent_id]
  end

  def create
    @product_category = ProductCategory.new(params[:product_category])
    @product_category.organization = @organization
    if @product_category.save
      flash[:notice] = _('Product Category was successfully created.')
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @product_category = @organization.product_categories.find(params[:id])
  end

  def update
    @product_category = @organization.product_categories.find(params[:id])
    if @product_category.update_attributes(params[:product_category])
      flash[:notice] = 'ProductCategory was successfully updated.'
      redirect_to :action => 'list'
    else
      render :action => 'edit', :id => @product_category
    end
  end

  def destroy
    @organization.product_categories.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
