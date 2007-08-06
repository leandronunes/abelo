class CommercialProposalsController < ApplicationController

  auto_complete_for :commercial_proposal, :name

  needs_organization
  
  before_filter :create_tabs

  def autocomplete_name
    is_template = params[:is_template] == 't' ? true : false
    re = Regexp.new("#{params[:commercial_proposal][:name]}", "i")
    @commercial_proposals = CommercialProposal.find(:all, :conditions => ['is_template = ?', is_template]).select { |cp| cp.name.match re}
    render :layout=>false
  end

  def index
    redirect_to :action => 'list', :is_template => 'false'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @is_template = params[:is_template]
    if @is_template == 'true'
      is_template = 't'
      @commercial_proposals = @organization.commercial_proposals_templates
      @title = _('Commercial Proposals Templates')
    else
      is_template = 'f'
      @commercial_proposals = @organization.commercial_proposals_not_templates
      @title = _('Commercial Proposals')
    end
    
    @query = params[:query] ? params[:query] : nil
    if @query.nil?
      @query = params[:commercial_proposal] ? params[:commercial_proposal][:name] : nil
    end

    if !@query.nil?
      page = (params[:page] || 1).to_i
      items_per_page = 10
      offset = (page - 1) * items_per_page

      @commercial_proposals = CommercialProposal.find_by_contents(@query, {:limit => :all, :offset => 0}, :conditions => ["is_template = ?", is_template])
      @commercial_proposal_pages = Paginator.new(self, @commercial_proposals.size, items_per_page, page)
      @commercial_proposals = @commercial_proposals[offset..(offset + items_per_page - 1)]
    else 
      @commercial_proposal_pages, @commercial_proposals = paginate :commercial_proposals, :per_page => 10, :conditions => [ "organization_id = ? AND is_template = ?", @organization.id, is_template ]
    end
  end

  def show
    @commercial_proposal = CommercialProposal.find(params[:id])
  end

  def new
    @departments = @organization.departments
    render :partial => 'new'
  end

  def create
    @departments = @organization.departments
    @commercial_proposal = CommercialProposal.new(params[:commercial_proposal])  
    @commercial_proposal.organization = @organization
    @sections = @commercial_proposal.commercial_proposal_sections
    if params[:template]
      template = CommercialProposal.find(params[:template])
      @sections = template.commercial_proposal_sections
      @commercial_proposal.body = template.body
    end
    if @commercial_proposal.save
      flash[:notice] = _('The commercial proposal was successfully created.')
      redirect_to :action => 'edit', :id => @commercial_proposal.id
    else
      @commercial_proposals_templates = @organization.commercial_proposals_templates
      @commercial_proposals = @organization.commercial_proposals_not_templates
      render :action => 'list'
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

  def new_from_template
    @commercial_proposal = CommercialProposal.find(params[:id]).clone
    @commercial_proposal.name = ''
    @commercial_proposal.departments.clear
    @commercial_proposal.is_template = false
    @commercial_proposal.body = CommercialProposal.find(params[:id]).body
    @departments = @organization.departments
    @sections = @commercial_proposal.commercial_proposal_sections
    render :action => 'new'
  end

  def get_template
    if params[:value] == '1'
      @templates = @organization.commercial_proposals_templates
      render :partial => 'templates'
    else
      render :nothing => true
    end
  end

  def create_tabs
    t = add_tab do      
      links_to :controller => 'commercial_proposals', :action => 'list', :is_template => 'true'
      in_set 'first'
      highlights_on :controller => 'commercial_proposals', :is_template => 'true'
    end
    t.named _("Commercial Proposal Templates")
    
    t = add_tab do      
      links_to :controller => 'commercial_proposals', :action => 'list', :is_template => 'false'
      in_set 'first'
      highlights_on :controller => 'commercial_proposals', :is_template => 'false'
    end
    t.named _('Commercial Proposals')
  end

end
