class LedgersController < ApplicationController

  needs_organization

  uses_financial_tabs

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :find_ledgers, :save, :destroy, :find_budgets, :find_by_tag, :navigation ],
         :redirect_to => { :action => :index }

  def index
    redirect_to :action => 'list'
  end

  def get_foreseen_informations
    if params[:value] == "1"
      @schedule_ledger = ScheduleLedger.new
      @periodicities = @organization.periodicities
      render :partial => 'get_foreseen_informations', :layout => false
    else
      render :nothing => true
    end
  end

  def get_periodicity_informations
    if params[:value].blank?
      render :nothing => true
    else
      @schedule_ledger = ScheduleLedger.new
      render :partial => 'get_periodicity_informations', :layout => false
    end
  end

  #TODO see
  def list
    parameters = {:order => 'ledgers.effective_date DESC, ledgers.id DESC', :per_page => 5, :conditions => ['organization_id = ?', @organization]}
    get_tags
    get_budgets
    @ledgers_page, @ledgers = paginate :ledgers, parameters
  end

  #TODO see
  def new
    @ledger = Ledger.new
    get_ledger_cagetories
    get_tags
    get_budgets  
  end

  #TODO see
  def create
    render :text => params.inspect
    return
    @ledger = Ledger.new(params[:ledger])
    @ledger.owner = current_user
    @ledger.organization = @organization
    
    if @ledger.save
      flash[:notice] = _('The ledger was successfully created')
      redirect_to :action => 'list'
    else
      @ledger_categories =  @organization.ledger_categories_sorted
      get_tags
      get_budgets  
      render_action :new
    end
  end

  #TODO see
  def edit
    @ledger = @organization.ledgers.find(params[:id])
    get_ledger_cagetories
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

  
  private
 
  #TODO see
  def get_ledger_cagetories 
    @ledger_categories =  @organization.ledger_categories_sorted
  end

  #TODO see
  def get_tags
    @tags = @organization.ledgers
  end

    #TODO see if it's useful
  def get_budgets
    date = (params[:date]) ? params[:date].to_time : Time.now
    flash.merge! :date => date, :date_ago => date.months_ago(1), :date_since => date.months_since(1)
    @budgets = LedgerCategory.find(:all) 
#TODO old code see the better way to do that
#    @budgets = Budget.sum_ledgers_by_month(date, true)
  end

end
