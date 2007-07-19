class DepartmentsController < ApplicationController

  needs_organization

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @department_pages, @departments = paginate :departments, :per_page => 10, :conditions => [ "organization_id = ?", @organization.id ]
  end

  def show
    @department = @organization.departments.find(params[:id])
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(params[:department])
    @department.organization = @organization
    if @department.save
      flash[:notice] = _('Department was successfully created.')
      @departments = @organization.departments
      redirect_to :action => 'list'
    else
      render :action => 'new', :status => 409
    end
  end

  def edit
    @department = @organization.departments.find(params[:id])
    render :partial => 'edit'
  end

  def update
    @department = @organization.departments.find(params[:id])
    if @department.update_attributes(params[:department])
      flash[:notice] = _('Department was successfully updated.')
      redirect_to :action => 'list'
    else
      render :action => 'edit', :status => 409
    end
  end

  def destroy
    @organization.departments.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def reset
    render :partial => 'new'
  end
end
