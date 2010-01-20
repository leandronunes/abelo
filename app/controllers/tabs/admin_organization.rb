  
  #########################################
  # Admin Organization Tabs Definition
  #########################################

def create_admin_organization_tabs

  t = add_tab do
    in_set 'first'
    highlights_on :controller => 'organizations'
  end
  t.links_to :controller => 'organizations', :action => 'show', :organization_id => params[:organization_id]
  t.named t(:show)
  t.show_if "!params[:organization_id].nil?"

  t = add_tab do
    in_set 'first'
    highlights_on :controller => 'configuration'
  end
  t.links_to :controller => 'configuration', :action => 'show', :organization_id => params[:organization_id]
  t.named t(:configurations)
  t.show_if "!params[:organization_id].nil?"

  t = add_tab do
    in_set 'first'
    highlights_on :controller => 'tracker'
  end
  t.links_to :controller => 'tracker', :organization_id => params[:organization_id]
  t.named t(:tracker)
  t.show_if "!params[:organization_id].nil?"

  t = add_tab do
    in_set 'first'
    highlights_on :controller => 'permissions_admin'
  end
  t.links_to :controller => 'permissions_admin', :action => 'list', :organization_id => params[:organization_id]
  t.named t(:users_and_permissions)
  t.show_if "!params[:organization_id].nil?"

  t = add_tab do
    in_set 'first'
    links_to :controller => 'organizations', :action => 'list'
     highlights_on :controller => 'organizations'
  end
  t.named _("Organizations") 
  t.show_if "params[:organization_id].nil?"

  t = add_tab do
    in_set 'first'
    highlights_on :controller => 'configuration'
    links_to :controller => 'configuration', :action => 'list'
  end
  t.named t(:organizations_profiles)
  t.show_if "params[:organization_id].nil?"

end
