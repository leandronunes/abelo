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

  design :holder => 'virtual_community'


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

  def self.uses_configurations_tabs
    before_filter :create_configurations_tabs
  end

  def create_configurations_tabs
    t = add_tab do
      links_to :controller => 'categories', :action => 'list', :category_type => 'customer'
      in_set 'first'
      highlights_on :controller => 'categories', :category_type => 'customer'
    end
    t.named _('Customer categories')

    t = add_tab do
      links_to :controller => 'categories', :action => 'list', :category_type => 'worker'
      in_set 'first'
      highlights_on :controller => 'categories', :category_type => 'worker'
    end
    t.named _('Worker categories')

    t = add_tab do
      links_to :controller => 'categories', :action => 'list', :category_type => 'supplier'
      in_set 'first'
      highlights_on :controller => 'categories', :category_type => 'supplier'
    end
    t.named _('Supplier categories')

    t = add_tab do
      links_to :controller => 'categories', :action => 'list', :category_type => 'product'
      in_set 'first'
      highlights_on :controller => 'categories', :category_type => 'product'
    end
    t.named _('Product categories')


#    t = add_tab do
#      links_to :controller => 'interface'
#      in_set 'first'
#      highlights_on :controller => 'interface'
#    end
#    t.named _('Interface')

#    t = add_tab do
#      links_to :controller => 'organization_configuration'
#      in_set 'first'
#      highlights_on :controller => 'organization_configuration'
#    end
#    t.named _('Field Configuration')
  end

  def self.uses_register_tabs
    before_filter :create_register_tabs
  end

  def create_register_tabs
    t = add_tab do
      links_to :controller => 'system_actors', :action => 'list', :actor => 'worker'
      in_set 'first'
      highlights_on :controller => 'system_actors', :actor => 'worker'
    end
    t.named _('Workers')

    t = add_tab do
      links_to :controller => 'system_actors', :action => 'list', :actor => 'customer'
      in_set 'first'
      highlights_on :controller => 'system_actors', :actor => 'customer'
    end
    t.named _('Customers')

    t = add_tab do
      links_to :controller => 'system_actors', :action => 'list', :actor => 'supplier'
      in_set 'first'
      highlights_on :controller => 'system_actors', :actor => 'supplier'
    end
    t.named _('Suppliers')

    t = add_tab do
      links_to :controller => 'products', :action => 'list'
      in_set 'first'
      highlights_on :controller => 'products'
    end
    t.named _('Products')
  end
 
  def self.uses_financial_tabs
    before_filter :create_financial_tabs
  end 
 
  def create_financial_tabs
    t = add_tab do
      links_to :controller => 'ledgers'
      in_set 'first'
    end
    t.named _('Ledgers')

    t = add_tab do
      links_to :controller => 'bank_accounts'
      in_set 'first'
    end
    t.named _('Bank Accounts')

    t = add_tab do
      links_to :controller => 'ledger_categories'
      in_set 'first'
    end
    t.named _('Ledger Category')

  end

  def self.uses_admin_organization_tabs
    before_filter :create_admin_organization_tabs
  end

  def create_admin_organization_tabs

    t = add_tab do
      in_set 'first'
      highlights_on :controller => 'organizations'
    end
    t.show_if "!['list', 'new_configuration', 'create_configuration', 'list_configuration'].include?(params[:action])"
    if params[:id]
      t.links_to :action => 'show', :id => params[:id]
    else
      t.links_to :action => 'new'
    end
    t.named _('Show')

    t = add_tab do
      in_set 'first'
      highlights_on :controller => 'configuration'
    end
    t.show_if "!['list', 'new_configuration', 'create_configuration', 'list_configuration'].include?(params[:action])"
    t.links_to :controller => 'configuration', :action => 'edit', :id => params[:id]
    t.named _('Configurations')

    t = add_tab do
      in_set 'first'
      links_to :controller => 'organizations', :action => 'list'
      highlights_on :controller => 'organizations', :action => 'list'
    end
    t.named _('Organizations')
    locations = [ {:action => 'list'}]
    if match_location(locations)
      t.show_if "true"
    else
      t.show_if "false"
    end

    t = add_tab do
      in_set 'first'
      highlights_on :controller => 'configuration', :action => 'list'
      links_to :controller => 'configuration', :action => 'list'
    end
    locations = [{:action => 'list'}]
    if match_location(locations)
      t.show_if "true"
    else
      t.show_if "false"
    end
    t.named _('Organizations Profiles')
  end
  # END TABS DEFINITION

  def match_location(location = [])

    return false if !location.kind_of? Array

    test = params.reject { |key,value| key.to_s == 'organization_nickname' }

    location.each{ |hash|
      match = true
      hash.each{ |k,v|         
        unless test[k.to_s] == v
          match = false           
          break
        end
      }
      return true if match == true and !hash.blank?
    }

    false
  end


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
    non_organization_layout
  end

  def self.public_layout
    non_organization_layout
  end

  def self.non_organization_layout
    layout 'administration'

    design :fixed => {
       :template => 'default',
       :theme => 'default',
       :icon_theme => 'default'
     }
  end

#  before_filter :detect_stuff_by_domain

  # TODO: move this logic somewhere else (Domain class?)
#  def detect_stuff_by_domain
#    @domain = Domain.find_by_name(request.host)
#    if @domain.nil?
#      @virtual_community = VirtualCommunity.default
#    else
#      @virtual_community = @domain.virtual_community
#      @profile = @domain.profile
#    end
#  end  

  def self.needs_organization
    before_filter :load_organization
    before_filter :load_virtual_community
    layout 'organization'
  end

  def load_organization
    @organization = Organization.find_by_identifier(params[:organization_nickname])
    render :text => _('There is no organization with identifier %s') % params[:organization_nickname] unless @organization
    @organization
  end

  def load_virtual_community
    if @organization.nil?
#TODO search by domain
#     @virtual_community = @organization.virtual_community 
    else
      @virtual_community = @organization.virtual_community 
    end
  end

  def render_access_denied_screen
    render :template => 'users/access_denied', :status => 403, :layout => false
  end

  def render_error(message = nil, error = nil)
    @message = _("This system didn't works correctly. Please contact the administrator and inform the message below.")
    @error = error
    render :template => 'shared/error'
  end

end
