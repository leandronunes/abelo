class CustomerCategoriesController < ApplicationController

  needs_organization

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @customer_categories = @organization.customer_categories
  end

  def new
    @customer_category = CustomerCategory.new
    @customer_category = @organization.product_categories.find(params[:parent_id]) if params[:parent_id]
  end

  def create
    @customer_category = CustomerCategory.new(params[:customer_category])
    @product_category.organization = @organization
    if @customer_category.save
      flash[:notice] = 'CustomerCategory was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @customer_category = @organization.customer_categories.find(params[:id])
  end

  def update
    @customer_category = @organization.customer_categories.find(params[:id])
    if @customer_category.update_attributes(params[:customer_category])
      flash[:notice] = 'CustomerCategory was successfully updated.'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @organization.customer_categories.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
