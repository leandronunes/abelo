module MassMailGroupsHelper

  def display_groups_collection(collection = Array.new, params = {}, html_options = {})

    content = Array.new
    collection.each do |c|
      content.push(
        [
          display_groups_collection_options(c, params),
          display_info(c, html_options, true )
        ]
      )
    end

    display_list_info(content, html_options)

  end

  def display_groups_collection_options(item, params ={})
    content_tag(:div,
      [
        link_to(_('Add'), :action => 'add_system_actor', :id => 3, :system_actor => item),
      ].join("\n"),
      :class => 'list_item_button'
    )
  end


end
