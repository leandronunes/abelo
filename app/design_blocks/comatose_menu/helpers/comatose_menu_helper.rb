# Methods added to this helper will be available to all templates in the application.
module ComatoseMenuHelper

  def comatose_menu(menu_itens, html_class = '',  father_path = '')
    content_tag(:ul,
      menu_itens.map do |menu|
        link_path =  father_path.blank? ? menu.slug : File.join(father_path,menu.slug)
        [
          content_tag(:li, link_to(menu.title, :page => link_path), :id => menu.slug),
          if menu.has_children?
            comatose_menu(menu.children, html_class + ' sub_menu', link_path)
          else
            ''
          end   
        ].join("\n")
      end.join("\n"),
     :class => 'comatose_menu ' + html_class
    )
  end

end 
