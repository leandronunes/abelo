module OrganizationsHelper

  def link_to_organization(text, org, options = {}, html_options = {})
    link_to text, { :controller => 'main', :organization_nickname => org.nickname }.merge(options), html_options
  end

  def main_menu
    menu_items = {
      'categories'  => _('Categories'),   
      'products'            => _('Products'),             
      'suppliers'           => _('Suppliers'),            
      'stock'               => _('Stock'),                
      'store'               => _('Store'),                
      'permissions'         => _('User administration'),  
      'customers'           => _('Customers'),            
      'contact_positions'   => _('Contact Positions'),    
      'workers'             => _('Workers'),
      'point_of_sale'       => _('Point of sale'),
      'mass_mails'          => _('Mass Mails'),
      'cash_flows'          => _('Cash Flow'),
      'ledgers'             => _('Ledgers'),
      'configuration'       => _('Configurations'),
      'departments'         => _('Departments'),
      'commercial_proposals'=> _('Commercial Proposals'),
    }
    x = 0
   content_tag('div', [content_tag('ul', 
                  menu_items.keys.select do |controller|
                    can(:controller => controller)
                  end.map do |controller|
		              x = x+1
                    content_tag('li', (link_to "<span>#{menu_items[controller]}</span>", { :controller => controller }, :id => controller, :class => "button_main pos_#{x}"))
                end.join('')) ], :id => 'nav' )
  end

end
