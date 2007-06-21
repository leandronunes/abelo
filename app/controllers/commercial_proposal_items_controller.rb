class CommercialProposalItemsController < ApplicationController

  uses_popup_plugin
  needs_organization

  def new
    @commercial_proposal_item = CommercialProposalItem.new
    @commercial_section_id = params[:id]
    @commercial_proposal_id = params[:commercial_proposal_id]
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
 
  def edit
    @commercial_proposal_item = CommercialProposalItem.find(params[:id])
    @commercial_proposal_id = params[:commercial_proposal_id]
    render :template => 'commercial_proposal_items/edit', :layout => false
  end

  def update
    @commercial_proposal_item = CommercialProposalItem.find(params[:id])
    if @commercial_proposal_item.update_attributes(params[:commercial_proposal_item])
      @commercial_proposal = CommercialProposal.find(params[:commercial_proposal_id])
      @sections = @commercial_proposal.commercial_proposal_sections
      flash[:notice] = _('Commercial proposal item was successfuly updated.')
      render :partial => 'commercial_proposal_sections/list'
    else
      
    end
  end

  def destroy
    CommercialProposalItem.find(params[:id]).destroy
    @commercial_proposal = CommercialProposal.find(params[:commercial_proposal_id])
    @sections = @commercial_proposal.commercial_proposal_sections
    redirect_to :controller => 'commercial_proposals', :action => 'edit', :id => params[:commercial_proposal_id]
  end

end
