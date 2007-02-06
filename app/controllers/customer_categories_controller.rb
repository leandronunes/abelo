class CustomerCategoriesController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @customer_category_pages, @customer_categories = paginate :customer_categories, :per_page => 10
  end

  def show
    @customer_category = CustomerCategory.find(params[:id])
  end

  def new
    @customer_category = CustomerCategory.new
  end

  def create
    @customer_category = CustomerCategory.new(params[:customer_category])
    if @customer_category.save
      flash[:notice] = 'CustomerCategory was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @customer_category = CustomerCategory.find(params[:id])
  end

  def update
    @customer_category = CustomerCategory.find(params[:id])
    if @customer_category.update_attributes(params[:customer_category])
      flash[:notice] = 'CustomerCategory was successfully updated.'
      redirect_to :action => 'show', :id => @customer_category
    else
      render :action => 'edit'
    end
  end

  def destroy
    CustomerCategory.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
