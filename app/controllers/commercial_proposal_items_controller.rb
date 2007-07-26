class CommercialProposalItemsController < ApplicationController

  needs_organization

  def new
    @commercial_proposal_item = CommercialProposalItem.new
    @commercial_section_id = params[:id]
    @commercial_proposal_id = params[:commercial_proposal_id]
    render :partial => 'new'
  end

  def add
    @commercial_proposal_item = CommercialProposalItem.new(params[:commercial_proposal_item])
    @commercial_proposal_item.commercial_proposal_section_id = params[:id]
    if @commercial_proposal_item.save
      @commercial_proposal = CommercialProposal.find(params[:commercial_proposal_id])
      @sections = @commercial_proposal.commercial_proposal_sections
      render :partial => 'commercial_proposal_sections/list'
    else
      render :partial => 'new', :id => params[:id], :commercial_proposal_id => params[:commercial_proposal_id], :status => HTTP_FORCE_ERROR
    end
  end
 
  def edit
    @commercial_proposal_item = CommercialProposalItem.find(params[:id])
    @commercial_proposal_id = params[:commercial_proposal_id]
    render :partial => 'edit'
  end

  def update
    @commercial_proposal_item = CommercialProposalItem.find(params[:id])
    if @commercial_proposal_item.update_attributes(params[:commercial_proposal_item])
      @commercial_proposal = CommercialProposal.find(params[:commercial_proposal_id])
      @sections = @commercial_proposal.commercial_proposal_sections
      flash[:notice] = _('Commercial proposal item was successfuly updated.')
      render :partial => 'commercial_proposal_sections/list'
    else
      rendet :text => 'blih' 
    end
  end

  def destroy
    CommercialProposalItem.find(params[:id]).destroy
    @commercial_proposal = CommercialProposal.find(params[:commercial_proposal_id])
    @sections = @commercial_proposal.commercial_proposal_sections
    render :partial => 'commercial_proposal_sections/list'
  end

  def cancel   
    render :nothing => true
  end
  
end
