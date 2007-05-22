class CashFlowsController < ApplicationController

  needs_organization
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @cash_flow_pages, @cash_flows = paginate :cash_flows, :per_page => 10
  end

  def show
    @cash_flow = CashFlow.find(params[:id])
  end

  def new
    @cash_flow = CashFlow.new
  end

  def create
    @cash_flow = CashFlow.new(params[:cash_flow])
    @cash_flow.organization = @organization
    if @cash_flow.save
      flash[:notice] = 'CashFlow was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @cash_flow = CashFlow.find(params[:id])
  end

  def update
    @cash_flow = CashFlow.find(params[:id])
    if @cash_flow.update_attributes(params[:cash_flow])
      flash[:notice] = 'CashFlow was successfully updated.'
      redirect_to :action => 'show', :id => @cash_flow
    else
      render :action => 'edit'
    end
  end

  def destroy
    CashFlow.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def extract_period
    @option = params[:option]
    render :partial => 'extract_period'
  end

  def generate_extract
    if params[:extract] == nil
      @notice = _('No type of extract was chosen.')
    else 
      @extract = params[:extract]     
      historicals = @organization.historicals
      @operational_entrances = Array.new
      @operational_exits = Array.new
      @not_operational_entrances = Array.new
      @not_operational_exits = Array.new
      historicals.each{ |h|
        if h.operational
	  if h.type_of == 'C'
            @operational_entrances.push(h.name)
	  else
            @operational_exits.push(h.name)
	  end
	else
	  if h.type_of == 'C'
            @not_operational_entrances.push(h.name)
	  else
            @not_operational_exits.push(h.name)
	  end
        end
      }        
      @operational_entrances = @operational_entrances.uniq
      @operational_exits = @operational_exits.uniq
      @not_operational_entrances = @not_operational_entrances.uniq
      @not_operational_exits = @not_operational_exits.uniq
    end
  end


end
