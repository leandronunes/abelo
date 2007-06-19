class CommercialProposalsController < ApplicationController

  needs_organization
  uses_popup_plugin

  def index
    redirect_to :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @commercial_proposals_templates = @organization.commercial_proposals_templates
    @commercial_proposals = @organization.commercial_proposals_not_templates
  end

  def show
    @commercial_proposal = CommercialProposal.find(params[:id])
  end

  def new
    @commercial_proposal = CommercialProposal.new
    @departments = @organization.departments
  end

  def create
    @commercial_proposal = CommercialProposal.new(params[:commercial_proposal])
    @commercial_proposal.organization = @organization
    if @commercial_proposal.save
      flash[:notice] = _('The commercial proposal was successfully created.')
      redirect_to :action => 'list'
    else
      @departments = @organization.departments
      render :action => 'new'
    end
  end

  def edit
    @commercial_proposal = CommercialProposal.find(params[:id])
    @departments = @organization.departments
    @sections = @commercial_proposal.commercial_proposal_sections
  end

  def update
    @commercial_proposal = CommercialProposal.find(params[:id])
    if @commercial_proposal.update_attributes(params[:commercial_proposal])
      flash[:notice] = 'CommercialProposal was successfully updated.'
      redirect_to :action => 'show', :id => @commercial_proposal
    else
      @departments = @organization.departments
      @sections = @commercial_proposal.commercial_proposal_sections
      render :action => 'edit'
    end
  end

  def destroy
    CommercialProposal.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def choose_template
    @templates = @organization.commercial_proposals_templates
  end

  def new_from_template
    @commercial_proposal = CommercialProposal.find(params[:id]).clone
    @commercial_proposal.name = ''
    @commercial_proposal.departments.clear
    @commercial_proposal.is_template = false
    @commercial_proposal.body = CommercialProposal.find(params[:id]).body
    @departments = @organization.departments
    render :action => 'new'
  end

  def new_section
    @commercial_proposal_section = CommercialProposalSection.new
    @commercial_proposal_id = params[:id]
    render :template => 'commercial_proposals/add_section', :layout => false
  end

  def add_section
    section = CommercialProposalSection.new(params[:commercial_proposal_section])
    section.commercial_proposal = CommercialProposal.find(params[:id])
    if section.save
      @commercial_proposal = CommercialProposal.find(params[:id])
      @sections = @commercial_proposal.commercial_proposal_sections
      render :partial => 'sections' 
    else
      
    end
  end

  def new_item
    @commercial_proposal_item = CommercialProposalItem.new
    @commercial_section_id = params[:id]
    @commercial_proposal_id = params[:commercial_proposal_id]
    @title = _('New item')
    @button_name = _('Add item')
    render :template => 'commercial_proposals/add_item', :layout => false
  end

  def add_item
    item = CommercialProposalItem.new(params[:commercial_proposal_item])
    item.commercial_proposal_section_id = params[:id]
    if item.save
      @commercial_proposal = CommercialProposal.find(params[:commercial_proposal_id])
      @sections = @commercial_proposal.commercial_proposal_sections
      render :partial => 'sections'
    else
      render :text => 'nao salvou'
    end
  end

  def edit_section
    @commercial_proposal_section = CommercialProposalSection.find(params[:id])
    @commercial_proposal_id = params[:commercial_proposal_id]
    render :template => 'commercial_proposals/edit_section', :layout => false
  end

  def update_section
    @commercial_proposal_section = CommercialProposalSection.find(params[:id])
    if @commercial_proposal_section.update_attributes(params[:commercial_proposal_section])
      @commercial_proposal = CommercialProposal.find(params[:commercial_proposal_id])
      @sections = @commercial_proposal.commercial_proposal_sections
      flash[:notice] = _('Commercial proposal section was successfuly updated.')
      render :partial => 'sections'
    else
    end
  end
  
  def remove_section
    CommercialProposalSection.find(params[:id]).destroy
    @commercial_proposal = CommercialProposal.find(params[:commercial_proposal_id])
    @sections = @commercial_proposal.commercial_proposal_sections
    render :partial => 'sections'    
  end

end
