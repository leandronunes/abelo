class PublicController < ApplicationController

  skip_before_filter :check_access_control

  default_environment

  def index
    @organizations = current_user.organizations
  end

  def edit_user
    @user = current_user
  end 

  def update_user
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = _('User was successfully updated.')
      redirect_to :action => 'index'
    else
      render :action => 'edit'
    end
  end


end
