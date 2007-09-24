  
  #########################################
  # Admin Organization Tabs Definition
  #########################################

def create_admin_organization_tabs

  is_not_organization = false
  if params[:controller] == 'configuration'
    is_not_organization = true if Configuration.is_model?(params[:id])
  end

  t = add_tab do
    in_set 'first'
    highlights_on :controller => 'organizations'
  end
  t.links_to :action => 'show', :id => params[:id]
  t.named _('Show')
  locations = [ {:action => 'edit'}, {:action => 'update'}, {:action => 'show'} ]
  if is_not_organization == true
    t.show_if  "false"
  else
    t.show_if  match_location(locations) ? "true" : "false"
  end

  t = add_tab do
    in_set 'first'
    highlights_on :controller => 'configuration'
  end
  t.links_to :controller => 'configuration', :action => 'show', :id => params[:id]
  t.named _('Configurations')
  locations = [ {:action => 'edit'}, {:action => 'update'}, { :action => 'show'} ]
  if is_not_organization == true
    t.show_if  "false"
  else
    t.show_if  match_location(locations) ? "true" : "false"
  end


  t = add_tab do
    in_set 'first'
    links_to :controller => 'organizations', :action => 'list'
    highlights_on :controller => 'organizations', :action => 'list'
    highlights_on :controller => 'organizations', :action => 'new'
    highlights_on :controller => 'organizations', :action => 'create'
  end
  t.named _("Organizations") 
  t.show_if  is_not_organization.to_s
  locations = [ {:action => 'list'},{ :action => 'new'}, {:action => 'create'}]
  if is_not_organization != true
    t.show_if  match_location(locations) ? "true" : "false"
  end

  t = add_tab do
    in_set 'first'
    highlights_on :controller => 'configuration'
    links_to :controller => 'configuration', :action => 'list'
  end
  t.named _('Organizations Profiles')
  t.show_if  is_not_organization.to_s
  locations = [{:action => 'list'}, {:action => 'new'}, {:action => 'create'}]
  if is_not_organization != true
    t.show_if  match_location(locations) ? "true" : "false"
  end
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

