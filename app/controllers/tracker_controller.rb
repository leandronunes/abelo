class TrackerController < ApplicationController

  needs_administrator

  uses_admin_organization_tabs

  def index
    redirect_to :action => 'show', :organization_id => params[:organization_id]
  end

  def show
    @organization = Organization.find(params[:organization_id])
    @tracker = @organization.tracker
  end

  def edit
    @organization = Organization.find(params[:organization_id])
    @tracker = @organization.tracker
  end

  def update
    @organization = Organization.find(params[:organization_id])
    @tracker = @organization.tracker
    if @tracker.update_attributes(params[:tracker]) 
      flash[:notice] = _('Tracker was successfully updated.')
      redirect_to :action => 'show', :organization_id => @organization
    else
      flash[:notice] = _('Tracker was not updated.')
      redirect_to :action => 'edit', :organization_id => @organization
    end
  end

end
