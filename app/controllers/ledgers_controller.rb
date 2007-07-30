class LedgersController < ApplicationController
  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :find_ledgers, :save, :destroy, :find_budgets, :find_by_tag, :navigation ],
         :redirect_to => { :action => :index }

  needs_organization

  uses_financial_tabs

  def index
    redirect_to :action => 'list'
  end

  def list
    @ledger_categories =  @organization.ledger_categories_sorted
    @tags = @organization.ledgers
    #TODO see if it's useful
    get_ledgers 
    get_budgets  
  end

  def new
    @ledger_categories =  @organization.ledger_categories_sorted
    @ledger = Ledger.new
    get_ledgers 
    get_budgets  
  end

  def create
    @ledger = Ledger.new(params[:ledger])
    @ledger.owner = current_user
    @ledger.organization = @organization
    
    if @ledger.save
      flash[:notice] = _('The ledger was successfully created')
      redirect_to :action => 'list'
    else
      render_action :new
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

    #TODO see if it's useful
  def save
    if params[:id]
      @ledger = Ledger.find(params[:id])
      @ledger.attributes = params[:ledger]
    else
      @ledger = Ledger.new(params[:ledger])
    end

    if @ledger.save
      index
      @ledger = nil
            
      render :update do |page|
        page.replace_html 'list', :partial => 'list'
        page.replace_html 'form', :partial => 'form'
        page.replace_html 'budget', :partial => 'budget'
        page.replace_html 'tag', :partial => 'tag'
      end
    else
      render_for :save, :error
    end
  end
  
  
    #TODO see if it's useful
  def edit
    @ledger = Ledger.find(params[:id])
    render_for :edit, :success
  end


    #TODO see if it's useful
  def destroy
    Ledger.find(params[:id]).destroy
    render_for :destroy, :success, "list_ledger_#{params[:id]}"
  end
  
  
  private
    #TODO see if it's useful
  def get_ledgers
    parameters = {:include => 'category', :order => 'ledgers.date DESC, ledgers.id DESC', :per_page => 50}
    unless params[:find].blank?
      flash[:filter] = "Descricao ou Categoria: #{params[:find]}"
      parameters.merge! :conditions => ["ledgers.description like ? or categories.name like ? ", "%#{params[:find]}%", "%#{params[:find]}%"]
    end
    
    @ledgers_page, @ledgers = paginate :ledgers, parameters
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
