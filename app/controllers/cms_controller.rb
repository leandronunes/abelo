class CmsController < ComatoseAdminController

  uses_tabbed_navigation

  define_option :page_class, Article

  before_filter :load_organization

  include AccessControl
  helper AccessControl

  def load_organization
    @organization = Organization.find_by_identifier(params[:organization_nickname])
  end


end
