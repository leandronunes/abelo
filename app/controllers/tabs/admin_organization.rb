  
  #########################################
  # Admin Organization Tabs Definition
  #########################################

def create_admin_organization_tabs

  t = add_tab do
    in_set 'first'
    highlights_on :controller => 'organizations'
  end
  t.links_to :controller => 'organizations', :action => 'show', :organization_id => params[:organization_id]
  t.named _('Show')
  locations = [ 
    {:controller => 'organizations', :action => 'edit'}, 
    {:controller => 'organizations', :action => 'update'}, 
    {:controller => 'organizations', :action => 'show'},
    {:controller => 'configuration', :action => 'edit'}, 
    {:controller => 'configuration', :action => 'update'}, 
    {:controller => 'configuration', :action => 'show'} ,
    {:controller => 'permissions_admin'},
  ]
  t.show_if  match_location(locations) ? "true" : "false"

  t = add_tab do
    in_set 'first'
    highlights_on :controller => 'configuration'
  end
  t.links_to :controller => 'configuration', :action => 'show', :organization_id => params[:organization_id]
  t.named _('Configurations')
  t.show_if  match_location(locations) ? "true" : "false"

  t = add_tab do
    in_set 'first'
    highlights_on :controller => 'permissions_admin'
  end
  t.links_to :controller => 'permissions_admin', :action => 'list', :organization_id => params[:organization_id]
  t.named _('Users and Permissions')
  t.show_if  match_location(locations) ? "true" : "false"

  t = add_tab do
    in_set 'first'
    links_to :controller => 'organizations', :action => 'list'
     highlights_on :controller => 'organizations'
  end
  t.named _("Organizations") 
  t.show_if  match_location(locations) ? "false" : "true"

  t = add_tab do
    in_set 'first'
    highlights_on :controller => 'configuration'
    links_to :controller => 'configuration', :action => 'list'
  end
  t.named _('Organizations Profiles')
  t.show_if  match_location(locations) ? "false" : "true"
end

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

