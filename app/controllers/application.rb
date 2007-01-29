# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base

  include AuthenticatedSystem
  before_filter :login_required

  before_filter :i18n_settings
  def i18n_settings
    headers['Content-Type'] = 'text/html; charset=utf-8'
  end

  layout 'admin'

  def self.needs_organization
    before_filter :load_organization
    layout 'organization'
  end
  def load_organization
    @organization = Organization.find_by_nickname(params[:organization_nickname])
    render :text => _('There is no organization with nickname %s') % params[:organization_nickname] unless @organization
  end

  def can(action)
    if self.current_user.nil?
      false
    else
      location = { :controller => self.controller_name, :action => action.to_s }
      location[:organization_nickname] = @organization.nickname if @organization
      self.current_user.allowed_to?()
    end
  end

end
