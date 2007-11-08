  ####################################
  #Configuration Tabs definitions
  ####################################

def create_web_site_tabs
  t = add_tab do
    links_to :controller => 'web_site_interface', :action => 'design_editor'
    in_set 'first'
    highlights_on :controller => 'web_site_interface', :action => 'design_editor'
  end
  t.named _('Manage Layout')

  t = add_tab do
    links_to :controller => 'cms'
    in_set 'first'
    highlights_on :controller => 'cms'
  end
  t.named _('Manage Content')

end
