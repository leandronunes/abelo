class PublicController < ApplicationController

  skip_before_filter :check_access_control

  default_environment

  def index
    @organizations = current_user.organizations
  end

  def edit_user
#   render :text => params.inspect
#   return
    @user = current_user
   # @user = User.find(params[:id])
  end 

  def update_user
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = _('User was successfully updated.')
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end


end
