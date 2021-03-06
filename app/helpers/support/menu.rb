  def main_menu
    params[:organization_nickname] ||= 'admin' if current_user.administrator?
    return '' if params[:organization_nickname].nil? 
    menu_items = [
      'departments',
      'system_actors', 
      'ledgers',
      'documents',
      'stock',
      'point_of_sale',  
      'categories',
      'public',
      'permissions',  
      'organizations',
      'banks',
      'cms',
      'sales',
      'tracker_organization',
      'mass_mails',
    ]
      
    menu_legend = {
      'categories'                          => t(:configurations),
      'stock'                               => t(:stock),
      'cms'                                 => t(:web_site),
      'public'                              => t(:organizations),
      'permissions'                         => t(:user_administration),
      'system_actors'                       => t(:registers),
      'point_of_sale'                       => t(:point_of_sale),
      'sales'                               => t(:sales),
      'mass_mails'                          => t(:mass_mail), #TODO implements this function
      'ledgers'                             => t(:financial),
      'documents'                           => (@organization.nil? or @organization.new_record?) ? '' : @organization.configuration.document_name_on_plural.camelcase, 
      'departments'                         => (@organization.nil? or @organization.new_record?) ? '' : @organization.configuration.department_name_on_plural.camelcase, #TODO see a better way to do that
      'organizations'                       => t(:organizations),
      'banks'                               => t(:banks),
      'tracker_organization'                => t(:tracker),
    }

    x = 0
   content_tag(
     'div',
     content_tag(
       'div',
       [content_tag(
         'ul',
          menu_items.map.select do |controller|
            can(:controller => controller)
          end.map do |controller|
            x = x+1
            content_tag('li',  
              design_display_button(controller, menu_legend[controller], 
                  { :organization_nickname => params[:organization_nickname], :controller => controller }, 
                  :id => controller, :class => "button_main pos_#{x} with_text"))
          end.join("\n")) ]
       ), :id => 'menu', :style => "display : none;" )
  end
