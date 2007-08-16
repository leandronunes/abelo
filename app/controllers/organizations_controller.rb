class OrganizationsController < ApplicationController

  needs_administrator

  skip_before_filter :check_admin_rights, :only => :none_organization

  before_filter :create_organization_tabs

  def create_organization_tabs
    t = add_tab do
      in_set 'first'
      highlights_on :action => 'show'
      highlights_on :action => 'edit'
      show_if "params[:action] != 'list' and params[:action] != 'new'"
    end
    t.links_to :action => 'show', :id => params[:id]
    t.named _('Show')

    t = add_tab do
      in_set 'first'
      highlights_on :action => 'show_configuration'
      highlights_on :action => 'edit_configuration'
      show_if "params[:action] != 'list' and params[:action] != 'new'"
    end
    t.links_to :action => 'show_configuration', :id => params[:id]
    t.named _('Configurations')

  end

  def none_organization
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
      redirect_to :action => 'edit_configuration', :id => @organization
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
      flash[:notice] = 'Organization was successfully updated.'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    Organization.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def show_configuration
    organization = Organization.find(params[:id])
    @org_configuration = organization.configuration
  end

  def edit_configuration
    @organization = Organization.find(params[:id])
  end

  def update_configuration
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(params[:organization])
      flash[:notice] = 'Organization was successfully updated.'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end
end
