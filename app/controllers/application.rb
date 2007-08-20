# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base

  uses_tabbed_navigation

  design :holder => 'organization'


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
      'ledgers'
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

  def flexible_template_owner
    load_organization unless params[:organization_nickname].nil?

  end

  ####################################
  #Tabs definitions
  ####################################

  def self.uses_configurations_tabs
    before_filter :create_configurations_tabs
  end

  def create_configurations_tabs
    t = add_tab do
      links_to :controller => 'categories', :action => 'list', :category_type => 'product'
      in_set 'first'
      highlights_on :controller => 'categories', :category_type => 'product'
    end
    t.named _('Product categories')

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
      links_to :controller => 'interface'
      in_set 'first'
      highlights_on :controller => 'interface'
    end
    t.named _('Interface')

    t = add_tab do
      links_to :controller => 'organization_configuration'
      in_set 'first'
      highlights_on :controller => 'organization_configuration'
    end
    t.named _('Field Configuration')
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
    t.named _('Ledger Categories')

  end

  # END TABS DEFINITION

  before_filter :define_path  

  def define_path
    @item = 'products'
    MENU_ITEMS.keys.map do |k|
      if MENU_ITEMS[k].include? self.controller_name 
        @item = k
        break 
      end
    end

#TODO fix it
#    if @item.nil?
#      render_error _('You have a controller not defined in path')
#      return
#    end
  end


  # maps a template code (a key in TEMPLATES) to an human-readable string
  def describe(item)
    {
      'register' => _('Register'),
      'configurations' => _('Configurations'),
      'financial' => _('Financial'),
      'stock' => _('Stock'),
      'mass_mail' => _('Mass mail'),
      'project' => _('Project'),
      'education' => _('Education'),
      'web' => _('Web'),
      'commercial_proposals' => _('Commercial proposals'),
      'users' => _('Users'),
      'store' => _('Store'),
      'administration' => _('Administration of users'),
      'point_of_sale' => _('Point of sale'),
      'departments' => _('Departments')
    }[item] || item
  end


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
    layout 'administration'

    design :fixed => {
       :template => 'default',
       :theme => 'default',
       :icon_theme => 'default'
     }
  end

  def self.needs_organization
    before_filter :load_organization
    layout 'organization'
  end

  def load_organization
    @organization = Organization.find_by_nickname(params[:organization_nickname])
    render :text => _('There is no organization with nickname %s') % params[:organization_nickname] unless @organization
    @organization
  end

  def render_access_denied_screen
    render :template => 'users/access_denied', :status => 403, :layout => false
  end

  def render_error(message = nil)
    @message = message.nil? ? _('Access error') : message
    render :template => 'shared/access_error'
  end

end
