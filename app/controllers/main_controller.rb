class MainController < ApplicationController

  needs_organization

  # bypass access control on index, but do not allow external people do see the
  # menu
  skip_before_filter :check_access_control, :only => 'index'
  before_filter :only_organization_people
  def only_organization_people
    unless current_user.organizations.include?(@organization)
      render_access_denied_screen
    end
  end

end
