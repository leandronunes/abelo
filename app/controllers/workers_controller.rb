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
    @worker_pages, @workers = paginate :workers, :per_page => 10, :conditions => ["organization_id = ?", @organization.id ] 
  end

  def show
    @worker = @organization.workers.find(params[:id])
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(params[:worker])
    @worker.organization = @organization
    if @worker.save
      flash[:notice] = 'Worker was successfully created.'
      @workers = @organization.workers
      redirect_to :action => 'list'
    else
      render :partial => 'new', :status => 409
    end
  end

  def edit
    @worker = @organization.workers.find(params[:id])
    render :partial => 'edit'
  end

  def update
    @worker = Worker.find(params[:id])
    if @worker.update_attributes(params[:worker])
      flash[:notice] = 'Worker was successfully updated.'
      redirect_to :action => 'list'
    else
      render :partial => 'edit', :status => 409
    end
  end

  def destroy
    @organization.workers.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def reset
    render :partial => 'new'
  end

end
