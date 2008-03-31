####################################
#Configuration Tabs definitions
####################################

def create_website_tabs
  t = add_tab do
    links_to :controller => 'organization_website_interface'
    in_set 'first'
    highlights_on :controller => 'organization_website_interface'
  end
  t.named _('Manage Layout')

  t = add_tab do
    links_to :controller => 'cms'
    in_set 'first'
    highlights_on :controller => 'cms'
  end
  t.named _('Manage Content')

end

