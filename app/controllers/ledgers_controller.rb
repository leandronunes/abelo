class LedgersController < ApplicationController

  auto_complete_for :ledger, :description

  needs_organization

  include FinancialInformation

#  protect [:index, :list, :show, :autocomplete_description, :select_category, :get_periodicity_informations, :get_interval_informations], 'view_ledger', :organization
#  protect [:new, :edit, :create, :update ], 'edit_ledger', :organization

  uses_financial_tabs

  def autocomplete_description
    escaped_string = Regexp.escape(params[:ledger][:description])
    re = Regexp.new(escaped_string, "i")
    bank_accounts = @organization.bank_accounts(params[:chosen_accounts])
    @ledgers = @organization.ledgers_by_bank_account(bank_accounts).select{|l| l.description.match re}
    render :layout=>false
  end


  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  post_only [ :update, :create, :destroy, :find_by_tag, :display_table, :get_periodicity_informations, :get_interval_informations ]

  def index
    redirect_to :action => 'list'
  end

  # List all ledgers of an organization.
  # The ledgers are of the bank account passed as parameter. If no bank account is passed
  # as parameter the ledgers are of the default bank account of the organization.
  def list
    get_financial_variables(@organization)

    ledgers = @organization.ledgers_by_all(@chosen_accounts, @chosen_tags, @chosen_categories, @start_date, @end_date, @query)

    @ledger_pages, @ledgers = paginate_by_collection ledgers

  end

  # This method render a table with all ledgers of the bank account of
  # organization. 
  # If no bank account is passed as parameter it displays the ledgers
  # of the default bank account.
  def display_financial_table
    get_financial_variables(@organization)

    ledgers = @organization.ledgers_by_all(@chosen_accounts, @chosen_tags, @chosen_categories, @start_date, @end_date, @query)

    @ledger_pages, @ledgers = paginate_by_collection ledgers

    render :partial => 'shared_financial/display_financial_table'
  end

  def show
    @ledger = @organization.find_ledger(params[:id])
    @bank_accounts = @organization.bank_accounts
    @ledger_categories =  @organization.ledger_categories_sorted_by_name
  end

  def new
    @ledger = Ledger.new_ledger
    @bank_accounts = @organization.bank_accounts
    @ledger_categories =  @organization.ledger_categories_by_payment_method(@ledger.payment_method)
  end

  def select_category
    payment_method = params[:payment_method]
    if !payment_method.blank?
      @ledger = Ledger.new_ledger(:payment_method => payment_method)
      @banks = Bank.find(:all)
      @ledger_categories =  @organization.ledger_categories_by_payment_method(@ledger.payment_method)
      render :partial => 'shared_payments/select_category'
    else
      render :nothing => true
    end
  end

  def get_periodicity_informations
    if params[:value] == "true"
      @ledger = Ledger.new_ledger
      @periodicities = @organization.periodicities
      render :partial => 'get_periodicity_informations'
    else
      render :nothing => true
    end
  end

  def get_interval_informations
    if params[:value].blank?
      render :nothing => true
    else
      @ledger = Ledger.new_ledger
      render :partial => 'get_interval_informations'
    end
  end

  def create
    @ledger = Ledger.new_ledger(params[:ledger])    
    @ledger.owner = @organization
  
    if @ledger.save
      flash[:notice] = _('The ledger was successfully created')
      redirect_to :action => 'list'
    else
      @banks = Bank.find(:all)
      @bank_accounts = @organization.bank_accounts
      @ledger_categories =  @organization.ledger_categories_by_payment_method(@ledger.payment_method)
      @periodicities = @organization.periodicities
      render_action :new
    end
  end

  def edit
    #TODO change this if someone make the relationship organizatin has_many ledgers works
    @ledger = @organization.find_ledger(params[:id])
    @bank_accounts = @organization.bank_accounts
    @ledger_categories =  @organization.ledger_categories_sorted_by_name
  end

  def update
    #TODO changue this if someone make the relationship organizatin has_many ledgers works
    begin
      @ledger = @organization.find_ledger(params[:id])
      raise "Couldnt find a ledger with id %s" % params[:id] if @ledger.blank?
    rescue
      @message = _('Cannot edit ledger with id %s') % params[:id]
      render :template => 'shared/not_found'
      return
    end

    if @ledger.update_attributes(params[:ledger])
      flash[:notice] = _('The ledger was successfully created')
      redirect_to :action => 'list'
    else
      @ledger_categories =  @organization.ledger_categories_sorted_by_name
      @bank_accounts = @organization.bank_accounts
      @ledger_categories =  @organization.ledger_categories_sorted_by_name
      @periodicities = @organization.periodicities
      render :action => 'edit'
    end
  end

  def destroy
    begin
      ledger = @organization.find_ledger(params[:id])
      raise "Couldnt find a ledger with id %s" % params[:id] if ledger.blank?
    rescue
      @message = _("Cannot remove ledger with id %s it wasn't found") % params[:id]
      render :template => 'shared/not_found'
      return
    end
    ledger.destroy
    get_financial_variables(@organization)
    ledgers = @organization.ledgers_by_all(@chosen_accounts, @chosen_tags, @chosen_categories, @start_date, @end_date, @query)

    @ledger_pages, @ledgers = paginate_by_collection ledgers

    render :partial => 'shared_financial/display_financial_table'
  end

end
