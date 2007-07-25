class PermissionsController < ApplicationController

  needs_organization
  # before_filter :check_admin_rights

  verify :method => :post, :only => [ :destroy, :create_with_template, :update_template ], :redirect_to => { :action => :index }

  before_filter :create_tabs

  def index
    @user_profiles = @organization.user_profiles
  end

  def select_template
    @user_profile = @organization.user_profiles.find(params[:id])
  end

  def update_template
    @user_profile = @organization.user_profiles.find(params[:id])
    if @user_profile.update_attributes(params[:user_profile])
      flash[:notice] = _('Profile updated successfully')
      redirect_to :action => 'index'
    else
      render :action => 'select_template'
    end
  end

  def new_with_template
    @user_profile = UserProfile.new
  end

  def create_with_template
    @user_profile = UserProfile.new(params[:user_profile])
    @user_profile.organization = @organization
    if @user_profile.save
      flash[:notice] = _('Profile successfully created.')
      redirect_to :action => 'index'
    else
      render :action => 'new_with_template'
    end
  end

  def destroy
    @organization.user_profiles.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

   def create_tabs
    add_tab do
      named 'Users and permissions'
      links_to :controller => 'permissions', :action => 'list'
      in_set 'first'
      highlights_on :controller => 'permissions'
    end
  end

end
