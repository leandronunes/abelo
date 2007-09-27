class MainController < ApplicationController

  needs_organization

  def index
    @organization.presentation ||= _('Welcome to Abelo System')
  end

end
