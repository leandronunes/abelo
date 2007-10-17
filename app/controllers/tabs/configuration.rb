  ####################################
  #Configuration Tabs definitions
  ####################################

def create_configurations_tabs
  t = add_tab do
    links_to :controller => 'categories', :action => 'list', :category_type => 'customer'
    in_set 'first'
    highlights_on :controller => 'categories'
  end
  t.named _('Categories')

  t = add_tab do
    links_to :controller => 'periodicities'
    in_set 'first'
    highlights_on :controller => 'periodicities'
  end
  t.named _('Periodicties')


#    t = add_tab do
#      links_to :controller => 'interface'
#      in_set 'first'
#      highlights_on :controller => 'interface'
#    end
#    t.named _('Interface')

#    t = add_tab do
#      links_to :controller => 'organization_configuration'
#      in_set 'first'
#      highlights_on :controller => 'organization_configuration'
#    end
#    t.named _('Field Configuration')
end
