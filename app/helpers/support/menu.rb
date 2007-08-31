  def main_menu
    menu_items = {
      'categories'                          => _('Configurations'),
#TODO the commented menu items are the items that would be implemented on the next
#version 0.3.1.
#
#Uncomment this when the version 0.3.1 be implemented
#
#
#      'stock'                               => _('Stock'),
#      'store'                               => _('Store'),
#      'permissions'                         => _('User administration'),
      'system_actors'                       => _('Registers'),
#      'point_of_sale'                       => _('Point of sale'),
#      'mass_mails'                          => _('Mass mail'),
      'ledgers'                             => _('Financial'),
#      'documents'                           => _('Documents'),
#      'departments'                         => _('Departments'),
#      'admin_configurations'                => _('Configurations'),
      'organizations'                       => _('Organizations'),
      'banks'                               => _('Banks'),
    }
    x = 0
   content_tag(
     'div',
     content_tag(
       'div',
       [content_tag(
         'ul',
          menu_items.keys.select do |controller|
            can(:controller => controller)
          end.map do |controller|
            x = x+1
            content_tag('li',  design_display_button(controller, menu_items[controller], { :controller => controller }, :id => controller, :class => "button_main pos_#{x}"))
          end.join("\n")) ]
       ), :id => 'menu', :style => "display : none;" )
  end
                    
