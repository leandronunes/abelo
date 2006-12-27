class SuppliersController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @supplier_pages, @suppliers = paginate :suppliers, :per_page => 10
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(params[:supplier])
    if @supplier.save
      flash[:notice] = 'Supplier was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update_attributes(params[:supplier])
      flash[:notice] = 'Supplier was successfully updated.'
      redirect_to :action => 'show', :id => @supplier
    else
      render :action => 'edit'
    end
  end

  def destroy
    Supplier.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
