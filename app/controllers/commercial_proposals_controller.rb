class CommercialProposalsController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @commercial_proposal_pages, @commercial_proposals = paginate :commercial_proposals, :per_page => 10
  end

  def show
    @commercial_proposal = CommercialProposal.find(params[:id])
  end

  def new
    @commercial_proposal = CommercialProposal.new
  end

  def create
    @commercial_proposal = CommercialProposal.new(params[:commercial_proposal])
    if @commercial_proposal.save
      flash[:notice] = 'CommercialProposal was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @commercial_proposal = CommercialProposal.find(params[:id])
  end

  def update
    @commercial_proposal = CommercialProposal.find(params[:id])
    if @commercial_proposal.update_attributes(params[:commercial_proposal])
      flash[:notice] = 'CommercialProposal was successfully updated.'
      redirect_to :action => 'show', :id => @commercial_proposal
    else
      render :action => 'edit'
    end
  end

  def destroy
    CommercialProposal.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
