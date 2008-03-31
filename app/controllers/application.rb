# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base

  require 'extended_array'
  require 'extended_date'
  require 'extended_active_record'
  require 'extended_time'
  include LoadOrganization
  include LoadEnvironment

#TODO uncomment this when needed
#  def rescue_action(e)
#    render_error('', e)
#  end

  uses_tabbed_navigation

  # declares that the given <tt>actions</tt> cannot be accessed by other HTTP
  # method besides POST.
  def self.post_only(actions, redirect = { :action => 'index'})
    verify :method => :post, :only => actions, :redirect_to => redirect
  end


  ###########################################
  # Internationalization Settings 
  ###########################################
  GetText.locale = 'pt_BR'
  init_gettext 'abelo'
  
  ###########################################
  # MENU DETAILS 
  ###########################################
  MENU_ITEMS = {
    'organization' => [
      'organization'
    ],
    'configurations' => [
      'categories'
    ],
    'financial' => [
      'ledger_categories',
      'ledgers',
      'bank_accounts'
    ],
    'register' => [
      'products',
      'system_actors'
    ],
    'stock' => [
      'stock'
    ],
    'mass_mail' => [
      'mass_mails'
    ],
    'project' => [
    ],
    'education' => [
    ],
    'web' => [
    ],
    'commercial_proposals' => [
      'commercial_proposals'
    ],
    'users' => [
      'users'
    ],
    'store' => [
      'store'
    ],
    'administration' => [
      'permissions'
    ],
    'point_of_sale' => [
      'point_of_sale'
    ],
    'departments' => [
      'departments'
    ],
    'organizations' => [
      'organizations',
      'configuration'
    ]
  }


  def paginate_by_collection(collection, options = {})
    page = (params[:page] || 1).to_i
    items_per_page = options[:per_page].nil? ? 10 : options[:per_page].to_i
    offset = (page - 1) * items_per_page
    document_pages = Paginator.new(self, collection.size, items_per_page, page)
    collection = collection[offset..(offset + items_per_page - 1)]
    return document_pages, collection
  end

  ####################################
  #Tabs definitions
  ####################################

  require 'tabs/configuration'
  require 'tabs/register'
  require 'tabs/financial'
  require 'tabs/admin_organization'
  require 'tabs/website'
  require 'tabs/sales'
  require 'tabs/stock'
  require 'tabs/tracker_organization'

  def self.uses_register_tabs
    before_filter :create_register_tabs
  end

  def self.uses_configurations_tabs
    before_filter :create_configurations_tabs
  end
 
  def self.uses_financial_tabs
    before_filter :create_financial_tabs
  end 
 
  def self.uses_website_tabs
    before_filter :create_website_tabs
  end 
 
  def self.uses_admin_organization_tabs
    before_filter :create_admin_organization_tabs
  end

  def self.uses_stock_tabs
    before_filter :create_stock_tabs
  end

  def self.uses_sales_tabs
    before_filter :create_sales_tabs
  end

  def self.uses_tracker_organization_tabs
    before_filter :create_tracker_organization_tabs
  end

  # END TABS DEFINITION

  before_filter :define_location_path  

  def define_location_path
    MENU_ITEMS.keys.map do |k|
      if MENU_ITEMS[k].include? self.controller_name 
        @location = k
        break 
      end
    end
  end

  include DescribeMenu

  HTTP_FORCE_ERROR = 409
  include AuthenticatedSystem
  include AccessControl
  helper AccessControl
  before_filter :login_required
  before_filter :check_access_control

  def check_access_control
    unless can(params[:action])
      render_access_denied_screen
    end
  end

  def check_admin_rights
    unless current_user.administrator
      render_access_denied_screen
    end
  end

  before_filter :i18n_settings
  def i18n_settings
    headers['Content-Type'] = 'text/html; charset=utf-8'
  end

  def self.needs_administrator
    skip_before_filter :check_access_control
    before_filter :check_admin_rights
    default_environment
  end

  def self.default_environment
    design :holder => 'environment'
    before_filter :load_default_environment
    layout 'default'
  end

  # TODO: move this logic somewhere else (Domain class?)
  def detect_stuff_by_domain
    @domain = Domain.find_by_name(request.host)
    if @domain.nil?
      path = request.path.split('/')
      @organization = Organization.find_by_identifier(path[2]) if path[1] == 'homepage'
      @environment = @organization.environment
    else
      @environment = @domain.environment
    end
  end  

  def self.needs_organization
    design :holder => 'organization'
    before_filter :load_organization
    layout 'organization'
  end

  def self.needs_environment
    design :holder => 'environment'
    layout 'default'
    before_filter :load_organization
    before_filter :load_environment
  end

  def load_default_environment
    @environment = Environment.default 
  end

  def render_access_denied_screen
    raise "You don't have permission"
# FIXME see a better way to do this
#    design :holder => 'environment'
#    before_filter :load_default_environment
#    layout 'default'
#    render :template => 'users/access_denied'
  end

  def render_error(message = nil, error = nil)
# FIXME see a better way to do this
    raise "Some erro happen"
    @message = message ||  _("This system didn't works correctly. Please contact the administrator and inform the message below.")    
    @error = error
    @environment = Environment.default
    render :template => 'shared/error'
  end

  # Access Control Plugin 
  include PermissionCheck
  def organization
    @organization
  end

  def user
    current_user.person if logged_in?
  end

end
