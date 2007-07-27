class DepartmentsController < ApplicationController

  auto_complete_for :department, :name

  needs_organization

  before_filter :create_tabs

  def autocomplete_name
    re = Regexp.new("#{params[:department][:name]}", "i")
    @departments = Department.find(:all).select { |dp| dp.name.match re}
    render :layout=>false
  end

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @departments = @organization.departments

    @query = params[:query] ? params[:query] : nil
    if @query.nil?
      @query = params[:department] ? params[:department][:name] : nil
    end

    if !@query.nil?
      page = (params[:page] || 1).to_i
      items_per_page = 10
      offset = (page - 1) * items_per_page

      @departments = Department.find_by_contents(@query, {:limit => :all, :offset => 0})
      @department_pages = Paginator.new(self, @departments.size, items_per_page, page)
      @departments = @departments[offset..(offset + items_per_page - 1)]
    else 
      @department_pages, @departments = paginate :departments, :per_page => 10, :conditions => [ "organization_id = ?", @organization.id ]
    end
    @department = Department.new
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

  def create_tabs
    add_tab do
      named 'Departments'
      links_to :controller => 'departments', :action => 'list'
      in_set 'first'
      highlights_on :controller => 'departments'
    end
  end

end
