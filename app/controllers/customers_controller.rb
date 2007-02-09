class CustomersController < ApplicationController

  needs_organization

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @customers = @organization.customers
  end

  def show
    @customer = @organization.customers.find(params[:id])
  end

  def new
    @customer = Customer.new
    @customer.organization = @organization
  end

  def create
    @customer = Customer.new(params[:customer])
    @customer.organization = @organization
    if @customer.save
      flash[:notice] = 'Customer was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @customer = @organization.customers.find(params[:id])
  end

  def update
    @customer = @organization.customers.find(params[:id])
    @customer.customer_category_ids = params[:customer_categories].keys if params[:customer_categories]
    if @customer.update_attributes(params[:customer])
      flash[:notice] = 'Customer was successfully updated.'
      redirect_to :action => 'list', :id => @customer
    else
      render :action => 'edit'
    end
  end

  def destroy
    @organization.customers.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
