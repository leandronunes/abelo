class OrganizationsController < ApplicationController

  auto_complete_for :organization, :name

  needs_administrator

  uses_admin_organization_tabs

  def autocomplete_name
    escaped_string = Regexp.escape(params[:organization][:name])
    re = Regexp.new(escaped_string, "i")
    @organizations = Organization.find(:all).select { |o| o.name.match re}
    render :layout=>false
  end

  def index
    redirect_to :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @organization_pages, @organizations = paginate :organizations, :per_page => 10
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(params[:organization])
    if @organization.save
      flash[:notice] = _('Organization was successfully created.')
      redirect_to :controller => 'configuration', :action => 'edit', :id => @organization
    else
      render :action => 'new'
    end
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(params[:organization])
      flash[:notice] = _('The organization was successfully updated.')
      redirect_to :action => 'show', :id => @organization
    else
      render :action => 'edit'
    end
  end

  def destroy
    Organization.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

end
