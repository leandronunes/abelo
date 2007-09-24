def create_register_tabs
  t = add_tab do
    links_to :controller => 'system_actors', :action => 'list', :actor => 'worker'
    in_set 'first'
    highlights_on :controller => 'system_actors', :actor => 'worker'
  end
  t.named _('Workers')

  t = add_tab do
    links_to :controller => 'system_actors', :action => 'list', :actor => 'customer'
    in_set 'first'
    highlights_on :controller => 'system_actors', :actor => 'customer'
  end
  t.named _('Customers')

  t = add_tab do
    links_to :controller => 'system_actors', :action => 'list', :actor => 'supplier'
    in_set 'first'
    highlights_on :controller => 'system_actors', :actor => 'supplier'
  end
  t.named _('Suppliers')

  t = add_tab do
    links_to :controller => 'products', :action => 'list'
    in_set 'first'
    highlights_on :controller => 'products'
  end
  t.named _('Products')
end
