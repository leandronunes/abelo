module DocumentHelper

  # displays an icon corresponding to the document passed in +doc+.
  #
  # The class of the document can define its icon by providing an +icon+
  # method (i.e. +doc.class.icon+ will be called)
  def icon_for_document(doc)
    icon =
      case doc
        when Comatose::Page
          'text-x-generic'
        else
          if doc.class.respond_to?(:icon)
            doc.class.icon
          else
            'none'
          end
        end
    design_display_icon(icon)
  end
  
  def display_document_model_collection(collection = Array.new, params = {}, html_options = {})

    content = Array.new
    collection.each do |c|
      content.push(
        [
          display_document_model_collection_options(c, params),
          display_info(c, html_options, true )
        ]
      )
    end

    display_list_info(content, html_options)

  end

  def display_document_model_collection_options(item, params ={})
    content_tag(:div,
      [
        button('view_small', t(:show), :show,
              {:action => 'show', :id => item.id}.merge(params)),
        button('edit_small', t(:edit), :edit,
              {:action => 'edit', :id => item.id}.merge(params)),
        button('del_small', t(:destroy), :destroy,
              {:action => 'destroy', :id => item.id}.merge(params),
               :method => 'post', :confirm => t(:are_you_sure?)),
        button('document_small', t(:documents), :list,
              {:action => 'list', :show_documents => true}.merge(params)),
        button('new_document_small', t(:new_document), :new,
              {:action => 'new',
               :document_model_id => params[:document_model_id] }.merge(params))
      ].join("\n"),
      :class => 'list_item_button'
    )
  end

end
