class PermissionsController < PermissionsBaseController

  needs_organization
  
  before_filter :create_tabs

  def create_tabs 
    t = add_tab do
      links_to :controller => 'permissions', :action => 'list'
      in_set 'first'
      highlights_on :controller => 'permissions'
    end
    t.named _('Users and permissions')
  end

end
