class WorkersController < ApplicationController

  needs_organization

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @workers = @organization.workers
  end

  def show
    @worker = @organization.workers.find(params[:id])
  end

  def new
    @worker = Worker.new
    @worker.organization = @organization
  end

  def create
    @worker = Worker.new(params[:worker])
    @worker.organization = @organization
    if @worker.save
      flash[:notice] = 'Worker was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @worker = @organization.workers.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])
    if @worker.update_attributes(params[:worker])
      flash[:notice] = 'Worker was successfully updated.'
      redirect_to :action => 'list', :id => @worker
    else
      render :action => 'edit'
    end
  end

  def destroy
    Worker.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
