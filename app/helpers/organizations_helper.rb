module OrganizationsHelper

  def link_to_organization(text, org, options = {}, html_options = {})
    link_to text, { :controller => 'main', :organization_nickname => org.nickname }.merge(options), html_options
  end

  def main_menu
    menu_items = {
      'product_categories'  => _('Product Categories'),   
      'products'            => _('Products'),             
      'suppliers'           => _('Suppliers'),            
      'stock'               => _('Stock'),                
      'store'               => _('Store'),                
      'permissions'         => _('User administration'),  
      'customers'           => _('Customers'),            
      'customer_categories' => _('Customer Categories'),  
      'contact_positions'   => _('Contact Positions'),    
      'workers'             => _('Workers'),
      'point_of_sale'       => _('Point of sale'),
      'mass_mails'          => _('Mass Mails'),
      'cash_flows'          => _('Cash Flow'),
      'configuration'       => _('Configurations'),
      'departments'       => _('Departments')
    }
    content_tag('ul', 
                menu_items.keys.select do |controller|
                  can(:controller => controller)
                end.map do |controller|
                  content_tag('li', (link_to menu_items[controller], { :controller => controller }))
                end.join(''))
  end

end
