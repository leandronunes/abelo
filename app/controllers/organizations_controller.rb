class OrganizationsController < ApplicationController

  needs_administrator

  skip_before_filter :check_admin_rights, :only => :none_organization

  before_filter :create_organization_tabs

  def create_organization_tabs
    t = add_tab do
      in_set 'first'
      highlights_on :action => 'show'
      highlights_on :action => 'edit'
    end
    t.show_if "!['list', 'new_configuration', 'create_configuration', 'list_configuration'].include?(params[:action])"
    t.links_to :action => 'show', :id => params[:id]
    t.named _('Show')

    t = add_tab do
      in_set 'first'
      highlights_on :action => 'show_configuration'
      highlights_on :action => 'edit_configuration'
    end
    t.show_if "!['list', 'new_configuration', 'create_configuration', 'list_configuration'].include?(params[:action])"
    t.links_to :action => 'show_configuration', :id => params[:id]
    t.named _('Configurations')

    t = add_tab do
      in_set 'first'
      links_to :action => 'list'
      highlights_on :action => 'list'
    end
    t.show_if "['list', 'new_configuration', 'create_configuration', 'list_configuration'].include?(params[:action])"
    t.named _('Organizations')

    t = add_tab do
      in_set 'first'
      highlights_on :action => 'new_configuration'
      highlights_on :action => 'create_configuration'
      highlights_on :action => 'list_configuration'
      links_to :action => 'list_configuration'
    end
    t.show_if "['list', 'new_configuration', 'create_configuration', 'list_configuration'].include?(params[:action])"
    t.named _('Organizations Profiles')

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
      flash[:notice] = _('The organization was successfully updated.')
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    Organization.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def list_configuration
    @configurations = Configuration.find_all_model
  end

  def new_configuration
    @configuration = Configuration.new
    @product_informations = Product.column_names
  end

  def create_configuration
    @configuration = Configuration.new(params[:configuration])
    @configuration.is_model = true
    @configuration.full_product = params[:product_full_informations].nil? ? Array.new : params[:product_full_informations].keys
    @configuration.lite_product = params[:product_lite_informations].nil? ? Array.new : params[:product_lite_informations].keys

    if @configuration.save
      flash[:notice] = _('The configurations was successfully updated.')
      redirect_to :action => 'list_configuration'
    else
      render :action => 'new'
    end
  end

  def show_configuration
    @organization = Organization.find(params[:id])
    @configuration = @organization.configuration
  end

  def edit_configuration
    @organization = Organization.find(params[:id])
    @configuration = @organization.configuration
    @product_informations = Product.column_names
  end

  def update_configuration
    @configuration = Configuration.find(params[:id])
    @organization = @configuration.organization
    @configuration.full_product = params[:product_full_informations].nil? ? Array.new : params[:product_full_informations].keys
    @configuration.lite_product = params[:product_lite_informations].nil? ? Array.new : params[:product_lite_informations].keys

    if @configuration.update_attributes(params[:configuration])
      flash[:notice] = _('The configurations was successfully updated.')
      redirect_to :action => 'show_configuration', :id => @organization.id
    else
      render :action => 'edit'
    end
  end
end
