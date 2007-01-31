class UsersController < ApplicationController
  layout :set_user_layout
  # the user is not expected to be logged for logging in. :-)
  skip_before_filter :login_required
  skip_before_filter :check_access_control

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

    @organizations = current_user.organizations
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
      redirect_back_or_default(:controller => '/users', :action => 'index')
      flash[:notice] = _("Logged in successfully")
    end
  end

  def signup
    @user = User.new(params[:user])
    return unless request.post?
    @user.save!
    self.current_user = @user
    redirect_back_or_default(:controller => '/users', :action => 'index')
    flash[:notice] = _("Thanks for signing up!")
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

end
