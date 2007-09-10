class PermissionsController < ApplicationController

  needs_organization
  # before_filter :check_admin_rights


  before_filter :create_tabs

  def index
    list
    render :action => 'list'
#    @profiles = @organization.profiles
  end

  verify :method => :post, :only => [ :destroy, :create_with_template, :update_template ], 
         :redirect_to => { :action => :list }


  def list

    @query = params[:query]
    @query ||= params[:users][:name] if params[:users]
#   render :text => params.inspect
#   return

    if @query.nil?
      @users = @organization.users
      @user_pages, @users = paginate_by_collection @users
    else
      @users = @organization.users.full_text_search(@query)
      @user_pages, @users = paginate_by_collection @users
    end
  end

  def select_template
    @user_profile = @organization.profiles.find(params[:id])
  end

  def update_template
    @user_profile = @organization.profiles.find(params[:id])
    if @user_profile.update_attributes(params[:user_profile])
      flash[:notice] = _('Profile updated successfully')
      redirect_to :action => 'index'
    else
      render :action => 'select_template'
    end
  end

  def new
    permissions = Array.new
    @user = User.new
    @user_profile = Profile.new
    @profiles = Profile.find(:all)
    @user_profile.permissions = permissions
  end

  #TODO: save a user in the system
  def create

    @user = User.new(params[:user])
    @user_profile = Profile.new(params[:user_profile])
    @user_profile.organization = @organization
    if @user.save
      flash[:notice] = _('Profile successfully created.')
      redirect_to :action => 'list'
    else

#   render :text => params.inspect
#   return

      @profiles = Profile.find(:all)
      render :action => 'new'
    end
  end


  def show
    @user = @organization.users.find(params[:id])
  end


  def destroy
    @organization.profiles.find(params[:id]).destroy
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
