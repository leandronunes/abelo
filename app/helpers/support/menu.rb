  def main_menu
    params[:organization_nickname] ||= 'admin' if current_user.administrator?
    return '' if params[:organization_nickname].nil? 
    menu_items = {
      'categories'                          => _('Configurations'),
      'stock'                               => _('Stock'),
#      'web_site_interface'                  => _('Web Site'), TODO implements it
      'permissions'                         => _('User administration'),
      'system_actors'                       => _('Registers'),
      'point_of_sale'                       => _('Point of sale'),
      'sales'                               => _('Sales'),
#      'mass_mails'                          => _('Mass mail'), #TODO implements this function
      'ledgers'                             => _('Financial'),
      'documents'                           => (@organization.nil? or @organization.id.nil?) ? '' : @organization.configuration.document_name_on_plural.camelcase, 
      'departments'                         => (@organization.nil? or @organization.id.nil?) ? '' : @organization.configuration.department_name_on_plural.camelcase, #TODO see a better way to do that
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
            content_tag('li',  
              design_display_button(controller, menu_items[controller], 
                  { :organization_nickname => params[:organization_nickname], :controller => controller }, 
                  :id => controller, :class => "button_main pos_#{x} with_text"))
          end.join("\n")) ]
       ), :id => 'menu', :style => "display : none;" )
  end
                    
