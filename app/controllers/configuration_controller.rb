class ConfigurationController < ApplicationController

  auto_complete_for :cofiguration, :name

  needs_administrator

  uses_admin_organization_tabs

  def autocomplete_name
    escaped_string = Regexp.escape(params[:configuration][:name])
    re = Regexp.new(escaped_string, "i")
    @configurations = Configuration.models.select { |c| c.name.match re}
    render :layout=>false
  end


  def index
    redirect_to :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @configurations = Configuration.models
  end

  def new
    @configuration = Configuration.new
    form_variables
  end

  def create
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

  def show
    @organization = Organization.find(params[:id])
    @configuration = @organization.configuration
    @ledger_display = @configuration.ledger_displays
    @worker_display = @configuration.worker_displays
    @product_display = @configuration.product_displays
    @supplier_display = @configuration.supplier_displays
  end

  def edit
    @organization = Organization.find(params[:id])
    @configuration = @organization.configuration
    form_variables
  end

  def update
    @configuration = Configuration.find(params[:id])

    if @configuration.update_attributes(params[:configuration])
      flash[:notice] = _('The configurations was successfully updated.')
      redirect_to :action => 'show', :id => @configuration
    else
      render :action => 'edit'
    end
  end


  def form_variables
    @ledger_fields = LedgerDisplay.available_fields
    @worker_fields = WorkerDisplay.available_fields
    @product_fields = ProductDisplay.available_fields
    @supplier_fields = SupplierDisplay.available_fields
  end

end
