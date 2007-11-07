module DocumentsHelper


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
        button('view_small', _('Show'), :show,
              { :action => 'show',
                :id => item.id,
                :models_list => true }.merge(params) ),
        button('edit_small', _('Edit'), :edit,
              { :action => 'edit',
                :id => item.id,
                :models_list => true }.merge(params) ),
        button('del_small', _('Destroy'), :destroy,
              { :action => 'destroy',
                :id => item.id,
                :models_list => true }.merge(params),
                :method => 'post', :confirm => _('Are you sure?') ),
        button('documents_small', _('Documents'), :list,
              { :action => 'list',
                :document_model_id => item.id,
                :models_list => true }.merge(params) ),
        button('new_document_small', _('New Document'), :new,
              { :action => 'new',
                :document_model_id => item.id,
                :models_list => true }.merge(params) )
      ].join("\n"),
      :class => 'list_item_button'
    )
  end

  def display_show_info_documents_options(object, params = {},  html_options = {})
    content_tag(:div,
      [
        button('back', _('Back'), :back, {:action => 'list'}.merge(params)),
        button('edit', _('Edit'), :edit, {:action => 'edit', :id => object.id}.merge(params)),
        button('print', _('Print'), :print, {:action => 'print', :id => object.id}.merge(params), :popup => ['menubar=1'])
      ].join("\n"),
      html_options
    )
  end


end
