class UsersController < ApplicationController
  # the user is not expected to be logged for logging in. :-)
  skip_before_filter :login_required
  skip_before_filter :check_access_control
  before_filter :check_admin_rights, :only => [ :create, :list, :new ]
  before_filter :extra_access_control , :only => [ :edit, :update ]

  default_environment

  def extra_access_control
    unless current_user.administrator || current_user.id == params[:id].to_i
      render :action => 'access_denied', :status => 403, :layout => false
    end
  end

  # say something nice, you goof!  something sweet.
  def index
    if User.count == 0
      redirect_to(:action => 'signup')
      return
    else
      unless logged_in?
        redirect_to(:action => 'login')
        return
      end
    end
    redirect_to :controller => 'public'
  end

  #Sets the layout used by the system
  layout 'login'

  def login
    return unless request.post?
    self.current_user = User.authenticate(params[:login], params[:password])
    if current_user
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      flash[:notice] = _("Logged in successfully")
      if self.current_user.organizations.count == 1
         if can(:controller => 'organization')
           redirect_to :controller => 'organization', :organization_nickname => self.current_user.organization.identifier
         elsif(can(:controller => 'ledgers'))
           redirect_to :controller => 'ledgers', :organization_nickname => self.current_user.organization.identifier
         elsif(can(:controller => 'point_of_sale', :action => 'index'))
           redirect_to :controller => 'point_of_sale', :organization_nickname => self.current_user.organization.identifier
         else
           redirect_to :controller => 'point_of_sale', :action => 'cancel', :organization_nickname => self.current_user.organization.identifier
         end
      elsif self.current_user.administrator
        redirect_to :controller => 'organizations'
      else
        redirect_to :controller => 'public'
      end
    end
    flash[:failed] = _('Wrong password or login')
  end

  def signup
    @user = User.new(params[:user])
    return unless request.post?
    @user.save!
    self.current_user = @user
    redirect_back_or_default(:controller => 'public')
    flash[:notice] = _("Thanks for signing up!")
#TODO see a better way to sent email
#    Notifier::deliver_signup_thanks(@user)
    rescue ActiveRecord::RecordInvalid
    render :action => 'signup'
  end
  
  def logout
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = _("You have been logged out.")
    redirect_back_or_default(:controller => '/users', :action => 'index')
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = _('User was successfully created.')
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
    
  end

  def list
    @user_pages, @users = paginate :users, :per_page => 10
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = _('User was successfully updated.')
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  #FIXME make this test
  skip_before_filter :check_navigator, :only => 'wrong_navigator'
  def wrong_navigator
    @wrong_navigator = true
    flash[:message] = _('This system only works properly with firefox navigator. Click here o get it now.')
    render :action => 'login'
  end

end
