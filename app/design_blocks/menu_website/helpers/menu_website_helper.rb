# Methods added to this helper will be available to all templates in the application.
module MenuWebsiteHelper
  def website_menu(menu_itens, html_class = '',  father_path = '', heigth = 0)
    heigth = heigth + 1
    content_tag(:ul,
      menu_itens.map do |menu|
        next if (heigth > @design_block.maximum_subitems)
        link_path =  father_path.blank? ? menu.slug : File.join(father_path,menu.slug)
        [
          content_tag(:li, link_to(menu.title, hash_for_homepage_url.merge({:page => link_path})), :id => "menu_item_#{menu.position}"),
          if menu.has_children?
            website_menu(menu.children, html_class + ' sub_menu', link_path, heigth)
          else
            ''
          end   
        ].join("\n")
      end.join("\n"),
     :class => 'website_menu ' + html_class
    )
  end

end 
