class LedgersController < ApplicationController

  auto_complete_for :ledger, :description

  needs_organization

  include FinancialInformation

  uses_financial_tabs

  def autocomplete_ledger_description
    escaped_string = Regexp.escape(params[:ledger][:description])
    re = Regexp.new(escaped_string, "i")
    get_financial_variables(@organization)

    @ledgers = @organization.ledgers_by_all(@chosen_accounts, @chosen_tags, @chosen_categories, @start_date, @end_date, @query)
    @ledgers = @ledgers.select{|l| l.description.match re}
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
    @ledger_categories = @organization.common_ledger_categories

    @query ||= params[:ledger][:description] unless params[:ledger].nil?
    ledgers = @organization.ledgers_by_all(@chosen_accounts, @chosen_tags, @chosen_categories, @start_date, @end_date, @query)

    @ledgers = ledgers.paginate(:per_page => 20,:page => params[:page] )

    balance_value = @last_balance.nil? ? 0 : @last_balance.value
    @total_income = Ledger.total_income(@ledgers, (balance_value if balance_value >= 0)) 
    @total_expense = Ledger.total_expense(@ledgers, (balance_value if balance_value < 0 ))
    @geral_total_income = Ledger.total_income(ledgers, (balance_value if balance_value >= 0)) 
    @geral_total_expense = Ledger.total_expense(ledgers, (balance_value if balance_value < 0)) 
  end

  # This method render a table with all ledgers of the bank account of
  # organization. 
  # If no bank account is passed as parameter it displays the ledgers
  # of the default bank account.
  def display_financial_table
    get_financial_variables(@organization)
    @ledger_categories = @organization.common_ledger_categories

    ledgers = @organization.ledgers_by_all(@chosen_accounts, @chosen_tags, @chosen_categories, @start_date, @end_date, @query)
   
    if params[:show]  == 'all'
      @ledgers = ledgers.paginate
    else
      @ledgers = ledgers.paginate(:per_page => 20,:page => params[:page])
    end

    balance_value = @last_balance.nil? ? 0 : @last_balance.value
    @total_income = Ledger.total_income(@ledgers, (balance_value if balance_value >= 0)) 
    @total_expense = Ledger.total_expense(@ledgers, (balance_value if balance_value < 0 ))
    @geral_total_income = Ledger.total_income(ledgers, (balance_value if balance_value >= 0)) 
    @geral_total_expense = Ledger.total_expense(ledgers, (balance_value if balance_value < 0)) 
    render :partial => 'shared_financial/display_financial_table'
  end

  def show
    @ledger = @organization.ledgers.find(params[:id])
    @bank_accounts = @organization.bank_accounts
    @ledger_categories =  @organization.ledger_categories_sorted_by_name
  end

  def new
    @ledger = Ledger.new(:bank_account => @organization.default_bank_account)
    @bank_accounts = @organization.bank_accounts
    @periodicities = @organization.periodicities
    @ledger_categories =  @organization.ledger_categories_by_payment_method(@ledger.payment_method)
  end

  def select_category
    payment_method = params[:payment_method]
    if !payment_method.blank?
      @ledger = Ledger.new(:payment_method => payment_method)
      @banks = Bank.find(:all)
      @ledger_categories =  @organization.ledger_categories_by_payment_method(@ledger.payment_method)
      render :partial => 'shared_payments/select_category'
    else
      render :nothing => true
    end
  end

  def create
    @ledger = Ledger.new(params[:ledger].merge(:organization => @organization))
 
    if @ledger.save
      flash[:notice] = t(:the_ledger_was_successfully_created)
      redirect_to :action => 'list'
    else
      @banks = Bank.find(:all)
      @bank_accounts = @organization.bank_accounts
      @ledger_categories =  @organization.ledger_categories_by_payment_method(@ledger.payment_method)
      @periodicities = @organization.periodicities
      render :action => 'new'
    end
  end

  def edit
    @ledger = @organization.ledgers.find(params[:id])
    @bank_accounts = @organization.bank_accounts
    @periodicities = @organization.periodicities
    @ledger_categories =  @organization.ledger_categories_sorted_by_name
  end

  def update
    @ledger = @organization.ledgers.find(params[:id])

    if @ledger.update_attributes(params[:ledger])
      flash[:notice] = t(:the_ledger_was_successfully_updated)
      redirect_to :action => 'list'
    else
      @ledger_categories =  @organization.ledger_categories_sorted_by_name
      @bank_accounts = @organization.bank_accounts
      @ledger_categories =  @organization.ledger_categories_sorted_by_name
      @periodicities = @organization.periodicities
      render :action => 'edit'
    end
  end

  def show_hide
    render :update do |page|
      page.replace_html('blo', 'testando')
    end
  end

  def unschedule_ledger
    @ledger = @organization.ledgers.find(params[:id])
    ledger = @organization.ledgers.find(params[:ledger_id])    
    @ledger.unschedule!(ledger)
    render :partial => 'schedule_ledgers'
  end

  def unschedule_all_ledger
    ledger = @organization.ledgers.find(params[:id])
    ledger.unschedule_all!
    redirect_to :action => 'edit', :id => ledger
  end

  def destroy
    ledger = @organization.ledgers.find(params[:id])
    ledger.destroy
    get_financial_variables(@organization)
    @ledger_categories = @organization.common_ledger_categories
    ledgers = @organization.ledgers_by_all(@chosen_accounts, @chosen_tags, @chosen_categories, @start_date, @end_date, @query)

    @ledgers = ledgers.paginate(:per_page => 20,:page => params[:page] )

    @total_income = Ledger.total_income(@ledgers) 
    @total_expense = Ledger.total_expense(@ledgers) 
    @geral_total_income = Ledger.total_income(ledgers) 
    @geral_total_expense = Ledger.total_expense(ledgers) 
    render :partial => 'shared_financial/display_financial_table'
  end

end
