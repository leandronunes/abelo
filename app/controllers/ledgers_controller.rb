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
  verify :method => :post, :only => [ :update, :create, :destroy, :find_by_tag, 
                                      :display_table, :get_periodicity_informations, :get_interval_informations ],
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
      @bank_account = @organization.bank_accounts.find(params[:bank_account])
    rescue
      @bank_account = @organization.default_bank_account
    end

    ledgers = @organization.ledgers_by_bank_account(@bank_account)
    @tags = ledgers
    @bank_accounts = @organization.bank_accounts

    if @query.nil?
      @ledger_pages, @ledgers = paginate_by_collection ledgers
    else
      ledgers = ledgers.full_text_search(@query)
      @ledger_pages, @ledgers = paginate_by_collection ledgers
    end
  end


  # This method render a table with all ledgers of the bank account of
  # organization. 
  # If no bank account is passed as parameter it displays the ledgers
  # of the default bank account.
  def display_table
    @query = params[:query]
    @query ||= params[:ledger][:description] if params[:ledger]

    begin
      @bank_account = @organization.bank_accounts.find(params[:bank_account])
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

  def edit
    #TODO change this if someone make the relationship organizatin has_many ledgers works
    begin
      @ledger = @organization.find_ledger(params[:id])
      raise "Couldnt find a ledger with id %s" % params[:id] if @ledger.blank?
    rescue
      @message = _('Cannot edit ledger with id %s') % params[:id]
      render :template => 'shared/not_found'
      return
    end
    @bank_accounts = @organization.bank_accounts
    @ledger_categories =  @organization.ledger_categories_sorted
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
      @ledger_categories =  @organization.ledger_categories_sorted
      @bank_accounts = @organization.bank_accounts
      @ledger_categories =  @organization.ledger_categories_sorted
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
    @bank_account = ledger.bank_account
    ledger.destroy
    ledgers = @organization.ledgers_by_bank_account(@bank_account)
    @tags = ledgers
    @ledger_pages, @ledgers = paginate_by_collection ledgers
    render :partial => 'display_table'
  end

  def find_by_tag
    @tag = params[:tag]
    @query = params[:query]
    @query ||= params[:ledger][:description] if params[:ledger]

    begin
      @bank_account = @organization.bank_accounts.find(params[:bank_account])
    rescue
      @bank_account = @organization.default_bank_account
    end

    if @query.nil?
      ledgers = @organization.ledgers_by_bank_account(@bank_account)
      @tags = ledgers
      @ledger_pages, @ledgers = paginate_by_collection ledgers.find_tagged_with(params[:tag])
    else
      ledgers = @organization.ledgers_by_bank_account(@bank_account)
      @tags = ledgers
      tag_ledgers = ledgers.find_tagged_with(params[:tag])
      search_ledgers = ledgers.full_text_search(@query)
      ledgers = tag_ledgers & search_ledgers
      @ledger_pages, @ledgers = paginate_by_collection ledgers
    end

    render :partial => 'display_table'

  end

  #TODO remove this function when its block implementation be done
  def test_budgets 
    @date = params[:date].nil? ? Date.today : params[:date].to_time
    @earlier_month = @date << 1
    @last_month = @date >> 1
    @categories = @organization.ledger_categories
  end
 
end
