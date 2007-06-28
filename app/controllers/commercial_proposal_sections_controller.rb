class CommercialProposalSectionsController < ApplicationController

  uses_popup_plugin

  def new
    @commercial_proposal_section = CommercialProposalSection.new
    @commercial_proposal_id = params[:id]
    render :template => 'commercial_proposal_sections/new', :layout => false
  end

  def add
    section = CommercialProposalSection.new(params[:commercial_proposal_section])
    section.commercial_proposal = CommercialProposal.find(params[:id])
    if section.save
      @commercial_proposal = CommercialProposal.find(params[:id])
      @sections = @commercial_proposal.commercial_proposal_sections
      render :partial => 'list' 
    else
      
    end
  end

  def edit
    @commercial_proposal_section = CommercialProposalSection.find(params[:id])
    @commercial_proposal_id = params[:commercial_proposal_id]
    render :template => 'commercial_proposal_sections/edit', :layout => false
  end

  def update
    @commercial_proposal_section = CommercialProposalSection.find(params[:id])
    if @commercial_proposal_section.update_attributes(params[:commercial_proposal_section])
      @commercial_proposal = CommercialProposal.find(params[:commercial_proposal_id])
      @sections = @commercial_proposal.commercial_proposal_sections
      flash[:notice] = _('Commercial proposal section was successfuly updated.')
      render :partial => 'list'
    else
    end
  end
  
  def destroy
    CommercialProposalSection.find(params[:id]).destroy
    @commercial_proposal = CommercialProposal.find(params[:commercial_proposal_id])
    @sections = @commercial_proposal.commercial_proposal_sections
    redirect_to :controller => 'commercial_proposals', :action => 'edit', :id => params[:commercial_proposal_id]
  end

  def set_name
    @commercial_proposal_section =  CommercialProposalSection.find(params[:id])
    if @commercial_proposal_section.update_attributes(:name => params[:value])
      render :text => @commercial_proposal_section.name
    else
      render :text => CommercialProposalSection.find(params[:id]).name
    end
  end

end
