class CommercialProposalItemsController < ApplicationController

  uses_popup_plugin

  def new
    @commercial_proposal_item = CommercialProposalItem.new
    @commercial_section_id = params[:id]
    @commercial_proposal_id = params[:commercial_proposal_id]
    @title = _('New item')
    @button_name = _('Add item')
    render :template => 'commercial_proposal_items/new', :layout => false
  end

  def add
    item = CommercialProposalItem.new(params[:commercial_proposal_item])
    item.commercial_proposal_section_id = params[:id]
    if item.save
      @commercial_proposal = CommercialProposal.find(params[:commercial_proposal_id])
      @sections = @commercial_proposal.commercial_proposal_sections
      render :partial => 'commercial_proposal_sections/list'
    else
      render :text => 'nao salvou'
    end
  end


end
