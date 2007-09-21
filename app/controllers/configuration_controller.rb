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
    if @configuration.save
      flash[:notice] = _('The configurations was successfully updated.')
      redirect_to :action => 'list_configuration'
    else
      form_variables
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
    parse_params_configuration(params)
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


  def parse_params_configuration(params)
    Configuration::DISPLAY_CONFIGURATION_CLASSES.each do |item|
      next if params[:configuration]["Set#{item}".tableize].nil?
      params[:configuration]["Set#{item}".tableize].reject! do |key, value|
        value.reject!{|k,v| k == 'none'}.blank?
        
      end
    end
  end

end
