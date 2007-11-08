class CmsController < ComatoseAdminController

  include AccessControl
  include WebSiteTab
  include LoadEnvironment
  include LoadOrganization
  helper AccessControl

  uses_tabbed_navigation

  design :holder => 'environment'
  before_filter :load_organization
  before_filter :load_environment
  before_filter :create_web_site_tabs

  define_option :page_class, Article


end
