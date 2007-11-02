# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base


  require 'extended_array'
  require 'extended_date'
  
#TODO uncomment this when needed
#  def rescue_action(e)
#    render_error('', e)
#  end

  uses_tabbed_navigation

  design :holder => 'organization'

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
    'main' => [
      'main'
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

  def self.uses_register_tabs
    before_filter :create_register_tabs
  end

  def self.uses_configurations_tabs
    before_filter :create_configurations_tabs
  end
 
  def self.uses_financial_tabs
    before_filter :create_financial_tabs
  end 
 
  def self.uses_admin_organization_tabs
    before_filter :create_admin_organization_tabs
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
    before_filter :load_environment
    layout 'default'
  end

  before_filter :detect_stuff_by_domain

  # TODO: move this logic somewhere else (Domain class?)
  def detect_stuff_by_domain
    @domain = Domain.find_by_name(request.host)
    unless @domain.nil?
      @environment = @domain.environment
    end
  end  

  def self.needs_organization
    before_filter :load_organization
    layout 'organization'
  end

  def load_organization
    @organization = current_user.organizations.find_by_identifier(params[:organization_nickname])
    if @organization.nil?
#FIXME See the better way to generate the exception.
#I think the raise way it's better
#      render_error(_("There is no organization with nickname %s") % params[:organization_nickname])
      raise "There is no organization with nickname %s" % params[:organization_nickname]
    end
  end

  def load_environment
    return nil unless @environment.nil?
    if @organization.nil?
      @environment = Environment.default 
    else
      @environment = @organization.environment 
    end
  end

  def render_access_denied_screen
    @environment = Environment.default
    render :template => 'users/access_denied'
  end

  def render_error(message = nil, error = nil)
    @message = message ||  _("This system didn't works correctly. Please contact the administrator and inform the message below.")    
    @error = error
    @environment = Environment.default
    render :template => 'shared/error'
  end

  # Access Control Plugin 
  extend PermissionCheck
  def organization
    @organization
  end

end
