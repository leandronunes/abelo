class MainController < ApplicationController

  needs_organization

  def index
    @organization.presentation ||= _('Welcome to Abelo System')
  end

  def list
    redirect_to :action => 'index'
  end

  def update
    if @organization.update_attributes(params[:organization])
      redirect_to :action => 'index'
    else
      render :action => 'edit'
    end
  end

end
