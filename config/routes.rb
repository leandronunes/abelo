ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  #map.connect ':controller/service.wsdl', :action => 'wsdl'

  # documentation browser
  map.connect 'doc', :controller => 'doc'

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  map.connect '', :controller => 'users'
  map.connect 'public', :controller => 'public'


#FIXME se if it's needed
#  # content administration 
#  map.cms 'cms/:organization_nickname/:action/:id', :controller => 'cms'

  map.connect ':organization_nickname/', :controller => 'organization'
  map.connect ':organization_nickname/:controller/:action/:id'
  map.connect 'admin/organizations/:action/:id', :controller => 'organizations'

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.connect ':organization_nickname/:controller/service.wsdl', :action => 'wsdl'

  # non-organization-based controllers
  map.connect 'users/:action/:id', :controller => 'users'

  # *content viewing*
  # XXX this route must come last so other tasks have priority over it.
  map.article_page '/homepage/:organization_nickname/:controller/:action/:id'
  map.homepage '/homepage/:organization_nickname/*page', :controller => 'content_viewer', :action => 'view_page'

  map.connect ':controller/:action/:id'

end
