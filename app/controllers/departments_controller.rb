class DepartmentsController < ApplicationController


  auto_complete_for :department, :name

  needs_organization

  protect [:index, :list, :show, :autocomplete_name, :department_tabs ], 'view_department', :organization
  protect [:new, :edit, :create, :update ], 'edit_department', :organization

  before_filter :department_tabs

  def autocomplete_name
    escaped_string = Regexp.escape(params[:department][:name])
    re = Regexp.new(escaped_string, "i")
    @departments = @organization.departments.select { |dp| dp.name.match re}
    render :layout=>false
  end

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  post_only [ :destroy, :create, :update ]

  def list
    @query = params[:query]
    @query ||= params[:department][:name] if params[:department]

    if @query.nil?
      @departments = @organization.departments
      @department_pages, @departments = paginate_by_collection @departments
    else
      @departments = @organization.departments.full_text_search(@query)
      @department_pages, @departments = paginate_by_collection @departments
    end
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
      redirect_to :action => 'list'
    else
      render :action => 'new'
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
      render :action => 'edit'
    end
  end

  def destroy
    @organization.departments.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def department_tabs
    t = add_tab do
      links_to :controller => 'departments', :action => 'list'
      in_set 'first'
      highlights_on :controller => 'departments'
    end
    t.named _('Departments')
  end

end
