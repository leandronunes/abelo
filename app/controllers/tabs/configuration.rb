  ####################################
  #Configuration Tabs definitions
  ####################################

def create_configurations_tabs
  t = add_tab do
    links_to :controller => 'categories', :action => 'list', :category_type => 'customer'
    in_set 'first'
    highlights_on :controller => 'categories'
  end
  t.named t(:categories)

  t = add_tab do
    links_to :controller => 'interface'
    in_set 'first'
    highlights_on :controller => 'interface', :action => 'design_editor_change_template'
    highlights_on :controller => 'interface', :action => 'design_editor_change_icon_theme'
    highlights_on :controller => 'interface', :action => 'design_editor_change_theme'
  end
  t.named t(:manage_interface)

  t = add_tab do
    links_to :controller => 'interface', :action => 'design_editor'
    in_set 'first'
    highlights_on :controller => 'interface', :action => 'design_editor'
  end
  t.named t(:manage_content)

#TODO put it to works
#  t = add_tab do
#    links_to :controller => 'organization_configuration'
#    in_set 'first'
#    highlights_on :controller => 'organization_configuration'
#  end
#  t.named t(:fields_configurations)

  t = add_tab do
    links_to :controller => 'periodicities'
    in_set 'first'
    highlights_on :controller => 'periodicities'
  end
  t.named t(:periodicities)

  t = add_tab do
    links_to :controller => 'units'
    in_set 'first'
    highlights_on :controller => 'units'
  end
  t.named t(:units)

  t = add_tab do
    links_to :controller => 'fiscal_printer'
    in_set 'first'
    highlights_on :controller => 'fiscal_printer'
  end
  t.named t(:fiscal_printers)

end
