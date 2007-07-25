class CashFlowsController < ApplicationController

  needs_organization

  before_filter :create_tabs
  
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
      @period = params[:option]

      if params[:option] == 'day'
        option = Date.strptime("#{params[:date]['year']}-#{params[:date]['month']}-#{params[:date]['day']}","%Y-%m-%d")
      else
        option = "#{params[:date][params[:option]]}"
	option = option.to_i
      end

      @operational_entrances_detailed = Array.new
      @operational_entrances = @organization.operational_entrances
      @operational_entrances.each{ |oe|
        cf = oe.send("cash_flows_for_#{params[:option]}", option )
	if cf.empty?
	  @operational_entrances.delete(oe)
	else
	  @operational_entrances_detailed.concat(cf)
	end
      }


      @operational_exits_detailed = Array.new
      @operational_exits = @organization.operational_exits
      @operational_exits.each{ |oe|
        cf = oe.send("cash_flows_for_#{params[:option]}", option )
	if cf.empty?
	  @operational_exits.delete(oe)
	else
          @operational_exits_detailed.concat(cf)
	end
      }

      @not_operational_entrances_detailed = Array.new
      @not_operational_entrances = @organization.not_operational_entrances
      @not_operational_entrances.each{ |oe|
        cf = oe.send("cash_flows_for_#{params[:option]}", option )
	if cf.empty?
	  @not_operational_entrances.delete(oe)
	else
	  @not_operational_entrances_detailed.concat(cf)
	end
      }


      @not_operational_exits_detailed = Array.new
      @not_operational_exits = @organization.not_operational_exits
      @not_operational_exits.each{ |oe|
        cf = oe.send("cash_flows_for_#{params[:option]}", option )
	if cf.empty?
	  @not_operational_exits.delete(oe)
	else
	  @not_operational_exits_detailed.concat(cf)
	end
      } 
    end

    @total_entrances = CashFlow.total_value(@operational_entrances_detailed, false) + CashFlow.total_value(@not_operational_entrances_detailed, false)

    @total_entrances_foreseen = CashFlow.total_value(@operational_entrances_detailed, true) + CashFlow.total_value(@not_operational_entrances_detailed, true)

    @total_exits = CashFlow.total_value(@operational_exits_detailed, false) + CashFlow.total_value(@not_operational_exits_detailed, false)

    @total_exits_foreseen = CashFlow.total_value(@operational_exits_detailed, true) + CashFlow.total_value(@not_operational_exits_detailed, true)

    @balance_operational = CashFlow.total_value(@operational_entrances_detailed, false) - CashFlow.total_value(@operational_exits_detailed, false)

    @balance_operational_foreseen = CashFlow.total_value(@operational_entrances_detailed, true) - CashFlow.total_value(@operational_exits_detailed, true)

    @balance_not_operational = CashFlow.total_value(@not_operational_entrances_detailed, false) - CashFlow.total_value(@not_operational_exits_detailed, false)

    @balance_not_operational_foreseen = CashFlow.total_value(@not_operational_entrances_detailed, true) - CashFlow.total_value(@not_operational_exits_detailed, true)

    @balance_total = CashFlow.total_value(@operational_entrances_detailed, false) + CashFlow.total_value(@not_operational_entrances_detailed, false) - CashFlow.total_value(@operational_exits_detailed, false) - CashFlow.total_value(@not_operational_exits_detailed, false)

    @balance_total_foreseen = CashFlow.total_value(@operational_entrances_detailed, true) + CashFlow.total_value(@not_operational_entrances_detailed, true) - CashFlow.total_value(@operational_exits_detailed, true) - CashFlow.total_value(@not_operational_exits_detailed, true)

  end

  def create_tabs
    add_tab do
      named 'Cash flows'
      links_to :controller => 'cash_flows', :action => 'list'
      in_set 'first'
      highlights_on :controller => 'cash_flows'
    end
    add_tab do
      named 'Ledgers'
      links_to :controller => 'ledgers'
      in_set 'first'
      highlights_on :controller => 'ledgers'
    end
  end

end
