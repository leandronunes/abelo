class MainController < ApplicationController

  needs_organization

  def index
    @organization.presentation ||= _('Welcome to Abelo System')
#render :text => 'bli'
  end

end
