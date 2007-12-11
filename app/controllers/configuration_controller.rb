class ConfigurationController < ApplicationController

  auto_complete_for :configuration, :name

  needs_administrator

  uses_admin_organization_tabs

  def autocomplete_configuration_name
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
    @configuration_pages, @configurations = paginate_by_collection @configurations
  end

  def show
    begin
      @organization = Organization.find(params[:organization_id])
      @configuration = @organization.configuration
    rescue
      @configuration = Configuration.find(params[:id])
    end
  end

  def new
    @configuration = Configuration.new
    @configuration.is_model = true
    form_variables
  end

  def create
    parse_params_configuration(params)
    @configuration = Configuration.new(params[:configuration])
    @configuration.is_model = true
    if @configuration.save
      flash[:notice] = _('The configurations was successfully updated.')
      redirect_to :action => 'list'
    else
      form_variables
      render :action => 'new'
    end
  end

  def edit
    @configuration = Configuration.find(params[:id])
    @organization = @configuration.organization
    form_variables
  end

  def update
    parse_params_configuration(params)
    @configuration = Configuration.find(params[:id])
    @organization = @configuration.organization
    if @configuration.update_attributes(params[:configuration])
      flash[:notice] = _('The configurations was successfully updated.')
      redirect_to :action => 'show', :organization_id => @organization, :id => @configuration
    else
      form_variables
      render :action => 'edit', :id => params[:id]
    end
  end

  def destroy
    c = Configuration.find(params[:id])
    if Configuration.models.include?(c)
      c.destroy 
      flash[:notice] =  _('The configuration model was successfully removed')
    else
      flash[:notice] = _('This configuration cannot be removed')
    end
    redirect_to :action => 'list'
  end

  def form_variables
    @worker_fields = WorkerDisplay.available_fields
    @worker_category_fields = WorkerCategoryDisplay.available_fields
    @customer_fields = CustomerDisplay.available_fields
    @customer_category_fields = CustomerCategoryDisplay.available_fields
    @supplier_fields = SupplierDisplay.available_fields
    @supplier_category_fields = SupplierCategoryDisplay.available_fields
    @product_fields = ProductDisplay.available_fields
    @product_category_fields = ProductCategoryDisplay.available_fields
    @department_fields = DepartmentDisplay.available_fields
    @ledger_category_fields = LedgerCategoryDisplay.available_fields
    @ledger_fields = LedgerDisplay.available_fields
    @bank_account_fields = BankAccountDisplay.available_fields
    @money_fields = MoneyDisplay.available_fields
    @check_fields = CheckDisplay.available_fields
    @credit_card_fields = CreditCardDisplay.available_fields
    @debit_card_fields = DebitCardDisplay.available_fields
    @stock_virtual_fields = StockVirtualDisplay.available_fields
    @stock_in_fields =  StockInDisplay.available_fields
    @stock_out_fields = StockOutDisplay.available_fields
    @user_fields = UserDisplay.available_fields
    @periodicity_fields = PeriodicityDisplay.available_fields
    @mass_mail_fields = MassMailDisplay.available_fields
    @document_fields = DocumentDisplay.available_fields
  end


  def parse_params_configuration(params)
    Configuration::DISPLAY_CONFIGURATION_CLASSES.each do |item|
      next if params[:configuration]["Set#{item}".tableize].nil?
      params[:configuration]["Set#{item}".tableize].reject! do |key, value|
        value.reject!{|k,v| k == 'none'}.blank?
      end
    end
    params
  end

end
