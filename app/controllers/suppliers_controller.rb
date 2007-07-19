class SuppliersController < ApplicationController

  needs_organization

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @suppliers = @organization.suppliers.find(:all)
  end

  def new
    @supplier = Supplier.new
    @supplier.organization = @organization
  end

  def create
    @supplier = Supplier.new(params[:supplier])
    @supplier.organization = @organization
    if @supplier.save
      flash[:notice] = 'Supplier was successfully created.'
      @suppliers = @organization.suppliers.find(:all)
      redirect_to :action => 'list'
    else
      render :partial => 'new', :status => 409
    end
  end

  def edit
    @supplier = @organization.suppliers.find(params[:id])
    render :partial => 'edit'
  end

  def update
    @supplier = @organization.suppliers.find(params[:id])
    if @supplier.update_attributes(params[:supplier])
      flash[:notice] = 'Supplier was successfully updated.'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @organization.suppliers.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def show
    @supplier = @organization.suppliers.find(params[:id])
  end

  def reset
    render :partial => 'new'
  end
end
