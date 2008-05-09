module MassMailGroupsHelper


  def select_groups_collection(collection = Array.new, params = {}, html_options = {})

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
      	check_box_tag("options[#{item.id}]", 1)
      ].join("\n"),
      :class => 'list_item_button'
    )
  end


end
