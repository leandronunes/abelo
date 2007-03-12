# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base

  include AuthenticatedSystem
  include AccessControl
  helper AccessControl
  before_filter :login_required
  before_filter :check_access_control
  def check_access_control
    unless can(params[:action])
      render_access_denied_screen
    end
  end
  def check_admin_rights
    unless current_user.administrator
      render_access_denied_screen
    end
  end

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

  def render_access_denied_screen
      render :template => 'users/access_denied', :status => 403, :layout => false
  end

end
