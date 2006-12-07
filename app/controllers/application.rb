# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base

  layout 'admin'

  def self.needs_organization
    before_filter :load_organization
  end
  def load_organization
    @organization = Organization.find_by_nickname(params[:organization_nickname])
    render :text => _('There is no organization with nickname %s') % params[:organization_nickname] unless @organization
  end

end
