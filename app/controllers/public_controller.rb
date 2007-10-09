class PublicController < ApplicationController

  skip_before_filter :check_access_control

  default_environment

  def index
    @organizations = current_user.organizations
  end

end
