class PermissionsController < ApplicationController

  needs_organization
  # before_filter :check_admin_rights


  before_filter :create_tabs

  def index
    list
    render :action => 'list'
  end

  verify :method => :post, :only => [ :destroy, :create_with_template, :update_template ], 
         :redirect_to => { :action => :list }


  def list
    @query = params[:query]
    @query ||= params[:users][:name] if params[:users]

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
    @user = User.new
    permissions = Array.new
    @user_profile = Profile.new
    @user_profile.permissions = permissions   
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      @user_profile = Profile.new
      @user_profile.name = Profile.describe(params[:user_profile][:template])
      @user_profile.template = params[:user_profile][:template]
      @user_profile.organization = @organization
      @user_profile.user = @user
      if @user_profile.save 
        flash[:notice] = _('User successfully created.')
        redirect_to :action => 'list'
        return
      end
    else
      render :action => 'new'
    end
  end

  def edit
    begin
      @user = @organization.users.find(params[:id])
    rescue 
      @message = _('The user was not found')
      render :template => 'shared/not_found'
    end
  end

  def update
    @user = @organization.users.find(params[:id])

    if @user.update_attributes(params[:user])
      @user_profile = @user.profiles.first
      @user_profile.name = Profile.describe(params[:user_profile][:template])
      @user_profile.template = params[:user_profile][:template]
      @user_profile.update 
      flash[:notice] = _('User was successfully upated.')
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
    
  end

  def show
    @new_user = @organization.users.find(params[:id])
  end

  def destroy
    @organization.users.find(params[:id]).destroy    
    redirect_to :action => 'list'
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
