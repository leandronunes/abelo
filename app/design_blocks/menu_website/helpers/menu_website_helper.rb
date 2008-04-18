# Methods added to this helper will be available to all templates in the application.
module MenuWebsiteHelper
  def website_menu(menu_itens, html_class = '',  father_path = '', heigth = 0)
    heigth = heigth + 1
    item = 0
    content_tag(:ul,
      menu_itens.map do |menu|
        item = item + 1
        link_path =  father_path.blank? ? menu.slug : File.join(father_path,menu.slug)
        [
          content_tag(:li, link_to(content_tag(:span, menu.title), hash_for_homepage_url.merge({:page => link_path})), :id => "menu_item_#{item}"),
          if menu.has_children? and heigth < @design_block.maximum_subitems
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
