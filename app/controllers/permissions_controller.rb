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
    @new_user = User.new
    @profiles = @organization.profiles
  end

  #TODO: save a user in the system
  def create

    @new_user = User.new(params[:new_user])
    @profiles = []
    @profiles = params[:new_user][:profile_ids]
    @profiles.each do |item|
      p = Profile.find(item.to_i)
      @profile = p.clone
      @profile.user = @new_user 
      @profile.organization = @organization
      @profile.save 
    end

    @user 
    if @new_user.save
      flash[:notice] = _('User successfully created.')
      redirect_to :action => 'list'
    else
   render :text => params.inspect
   return

      @profiles = @organization.profiles 
      render :action => 'new'
    end
  end

  def edit
    begin
      @new_user = @organization.users.find(params[:id])
    rescue 
      @message = _('The user was not found')
      render :template => 'shared/not_found'
    end
    @profiles = @organization.profiles 

  end

  def show
    @new_user = @organization.users.find(params[:id])
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
