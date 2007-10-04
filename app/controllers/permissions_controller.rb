class PermissionsController < ApplicationController

  auto_complete_for :user, :login

  needs_organization

  def autocomplete_login
    escaped_string = Regexp.escape(params[:user][:login])
    re = Regexp.new(escaped_string, "i")
    @users = User.find(:all).select { |dp| dp.login.match re}
    render :layout => false
  end

  before_filter :create_tabs

  def index
    list
    render :action => 'list'
  end

  verify :method => :post, :only => [ :destroy, :create_with_template, :update_template ], 
         :redirect_to => { :action => :list }


  def list
    @query = params[:query]
    @query ||= params[:user][:login] if params[:user]

    if @query.nil?
      @users = @organization.users
      @users.map{|u| u.profile_organization = @organization }
      @user_pages, @users = paginate_by_collection @users
    else
      @users = @organization.users.full_text_search(@query)
      @users.map{|u| u.profile_organization = @organization }
      @user_pages, @users = paginate_by_collection @users
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.validates_profile = true

    template = params[:user][:template] unless params[:user].nil?
    if can(Profile.locations_by_template(template))
      @user.template_valid = true
    end
    
    @user.profile_organization = @organization
    begin
      if @user.save
        flash[:notice] = _('User successfully created.')
        redirect_to :action => 'list'
      else
        render :action => 'new'
      end
    rescue
      render :action => 'new'
    end
  end

  def edit
    @user = @organization.users.find(params[:id])
    @user.profile_organization= @organization
  end

  def update
    @user = @organization.users.find(params[:id])
    @user.validates_profile = true

    template = params[:user][:template] unless params[:user].nil?
    if can(Profile.locations_by_template(template))
      @user.template_valid = true
    end
    
    @user.profile_organization = @organization
    if @user.update_attributes(params[:user])
      flash[:notice] = _('User was successfully upated.')
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
    
  end

  def show
    @user = @organization.users.find(params[:id])
    @user.profile_organization = @organization
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
