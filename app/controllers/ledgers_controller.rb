class LedgersController < ApplicationController

  auto_complete_for :ledger, :description

  needs_organization

  uses_financial_tabs

  def autocomplete_description
    escaped_string = Regexp.escape(params[:ledger][:description])
    re = Regexp.new(escaped_string, "i")
    bank_account = @organization.bank_accounts.find(params[:bank_account])
    @ledgers = bank_account.ledgers.select{ |l| l.description.match re}
    render :layout=>false
  end


  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :update, :create, :destroy, :find_by_tag, :display_table ],
         :redirect_to => { :action => :index }

  # Redirect to action list
  def index
    redirect_to :action => 'list'
  end

  # List all ledgers of an organization.
  # The ledgers are of the bank account passed as parameter. If no bank account is passed
  # as parameter the ledgers are of the default bank account of the organization.
  def list

    @query = params[:query]
    @query ||= params[:ledger][:description] if params[:ledger]

    begin
      @bank_account = @organization.bank_accounts.find(params[:bank_account_id])
    rescue
      @bank_account = @organization.default_bank_account
    end

    if @query.nil?
      ledgers = @organization.ledgers_by_bank_account(@bank_account)
      @tags = ledgers
      @ledger_pages, @ledgers = paginate_by_collection ledgers
    else
      ledgers = @organization.ledgers_by_bank_account(@bank_account)
      @tags = ledgers
      ledgers = ledgers.full_text_search(@query)
      @ledger_pages, @ledgers = paginate_by_collection ledgers
    end
  end


  # This method render a table with all ledgers of the bank account of
  # organization. 
  # If no bank account is passed as parameter it displays the ledgers
  # of the default bank account.
  def display_table
    begin
      @bank_account = @organization.bank_accounts.find(params[:bank_account_id])
    rescue
      @bank_account = @organization.default_bank_account
    end
    @query = nil
    ledgers = @organization.ledgers_by_bank_account(@bank_account)
    @tags = ledgers
    @ledger_pages, @ledgers = paginate_by_collection ledgers
    render :partial => 'display_table'
  end


  def new
    @ledger = Ledger.new
    @bank_accounts = @organization.bank_accounts
    @ledger_categories =  @organization.ledger_categories_sorted
  end

  def get_periodicity_informations
    if params[:value] == "true"
      @ledger = Ledger.new
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
      @ledger = Ledger.new
      render :partial => 'get_interval_informations'
    end
  end

  def create
    @ledger = Ledger.new(params[:ledger])
    
    if @ledger.save
      flash[:notice] = _('The ledger was successfully created')
      redirect_to :action => 'list'
    else
      @bank_accounts = @organization.bank_accounts
      @ledger_categories =  @organization.ledger_categories_sorted
      @periodicities = @organization.periodicities
      render_action :new
    end
  end

  #TODO move it to a block on a Desgin plugin
  def get_budgets
    @date = params[:date].nil? ? Date.today : params[:date].to_time
    @earlier_month = @date << 1
    @last_month = @date >> 1
    @categories = @organization.ledger_categories
  end


  #TODO see
  def edit
    @ledger = @organization.ledgers.find(params[:id])
    @ledger_categories =  @organization.ledger_categories_sorted
    get_tags 
    get_budgets
  end

  #TODO see
  def update
    @ledger = @organization.ledgers.find(params[:id])
    
    if @ledger.update_attributes(params[:ledger])
      flash[:notice] = _('The ledger was successfully created')
      redirect_to :action => 'list'
    else
      @ledger_categories =  @organization.ledger_categories_sorted
      get_tags
      get_budgets  
      render_action :edit
    end
  end


  #TODO see
  def clean
    @ledger_categories =  @organization.ledger_categories_sorted
    @ledger = Ledger.new
    render :update do |page|
      page.replace_html 'form', :partial => 'form'
    end
  end

#TODO how can I test page.remove?
  def destroy
    @organization.ledgers.find(params[:id]).destroy
    render :update do |page|
      page.remove "list_ledger_#{params[:id]}"
    end
  end
  

    #TODO see if it's useful
  def navigation
    get_ledgers
    render :update do |page|
      page.replace_html 'list', :partial => 'list'
    end
  end
  
    #TODO see if it's useful
  def find_budgets
    get_budgets
    render :update do |page|
      page.replace_html 'budget', :partial => 'budget'
    end
  end
  
    #TODO see if it's useful
  def find_ledgers
    flash[:filter] = nil
  	get_ledgers
    render_for :index, :success
  end
  
    #TODO see if it's useful
  def find_by_tag
    flash[:filter] = "Tag: #{params[:tag]}"
    @ledgers = @organization.ledgers.find_tagged_with(params[:tag])
    render :update do |page|
      page.replace_html 'box_content_2', :partial => 'list'
    end
  end

#
#    @bank_account = @organization.default_bank_account
#    @query = nil
#    parameters = {:order => 'ledgers.effective_date DESC, ledgers.id DESC', :per_page => 15, :conditions => ['bank_account_id = ?', @bank_account]}
#    get_tags
#    get_budgets
#    @ledgers_page, @ledgers = paginate :ledgers, parameters


  #TODO remove this function when its block implementation be done
  def test_budgets 
    get_budgets
  end
 
end
