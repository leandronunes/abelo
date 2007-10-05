class PermissionsBaseController < ApplicationController

  auto_complete_for :user, :login

  def autocomplete_login
    escaped_string = Regexp.escape(params[:user][:login])
    re = Regexp.new(escaped_string, "i")
    @users = User.find(:all).select { |dp| dp.login.match re}
    render :layout => false
  end

  def index
    list
  end

  verify :method => :post, :only => [ :destroy, :create_with_template, :update_template ], 
         :redirect_to => { :action => :list }


  def list
    @organization ||= Organization.find(params[:organization_id])
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

    render :template => 'permissions_base/list'
  end

  def new
    @user = User.new
    render :template => 'permissions_base/new' 
  end

  def create
    @organization ||= Organization.find(params[:organization_id])
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
        render :template => 'permissions_base/new'
      end
    rescue
      render :template => 'permissions_base/new'
    end
  end

  def edit
    @organization ||= Organization.find(params[:organization_id])
    @user = @organization.users.find(params[:id])
    @user.profile_organization= @organization
    render :template => 'permissions_base/edit'
  end

  def update
    @organization ||= Organization.find(params[:organization_id])
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
      render :template => 'permissions_base/edit'
    end
    
  end

  def show
    @organization ||= Organization.find(params[:organization_id])
    @user = @organization.users.find(params[:id])
    @user.profile_organization = @organization
    render :template => 'permissions_base/show'
  end

  def destroy
    @organization ||= Organization.find(params[:organization_id])
    @organization.users.find(params[:id]).destroy    
    redirect_to :action => 'list'
  end

end
