class PublicController < ApplicationController

  skip_before_filter :check_access_control

  public_layout

  def index
    @organizations = current_user.organizations
  end

end
