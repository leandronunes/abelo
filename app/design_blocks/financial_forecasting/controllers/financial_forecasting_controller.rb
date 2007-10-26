class FinancialForecastingController < ApplicationController

  needs_organization

  acts_as_design_block

  CONTROL_ACTION_OPTIONS = {
    'edit' => _('Edit')
  } 

  ###########################
  # Mandatory methods
  ###########################  
  
  def index
    @date = params[:date].nil? ? Date.today : Date.civil_by_string(params[:date])
    @earlier_month = @date << 1
    @last_month = @date >> 1
    @categories = @organization.ledger_categories
    design_render
  end
  
  ###########################
  # Other Sample of methods
  ###########################
  
  def edit
    design_render_on_edit
  end
  
  def save
    @design_block.update_attributes(params[:design_block])
    design_render_on_edit :nothing => true
  end


end
