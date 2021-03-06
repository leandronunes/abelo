module DocumentsHelper


  # displays an icon corresponding to the document passed in +doc+.
  #
  # The class of the document can define its icon by providing an +icon+
  # method (i.e. +doc.class.icon+ will be called)
  #FIXME see if it's correct
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
  
  #FIXME see if it's correct
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

  #FIXME see if it's correct
  def display_document_model_collection_options(item, params ={})
    content_tag(:div,
      [
        button('view_small', t(:show), :show,
              { :action => 'show',
                :id => item.id,
                :models_list => true }.merge(params) ),
        button('edit_small', t(:edit), :edit,
              { :action => 'edit',
                :id => item.id,
                :models_list => true }.merge(params) ),
        button('del_small', t(:destroy), :destroy,
              { :action => 'destroy',
                :id => item.id,
                :models_list => true }.merge(params),
                :method => 'post', :confirm => t(:are_you_sure?) ),
        button('documents_small', t(:documents), :list,
              { :action => 'list',
                :document_model_id => item.id,
                :models_list => true }.merge(params) ),
        button('new_document_small', t(:new_document), :new,
              { :action => 'new',
                :document_model_id => item.id,
                :models_list => true }.merge(params) )
      ].join("\n"),
      :class => 'list_item_button'
    )
  end

  #FIXME see if it's correct
  def display_show_info_documents_options(object, params = {},  html_options = {})
    html_options[:class] = html_options[:class].nil? ? 'display_info_options' : 'display_show ' + html_options[:class]
    content_tag(:div,
      [
        button('back', t(:back), :back, {:action => 'list'}.merge(params)),
        button('edit', t(:edit), :edit, {:action => 'edit', :id => object.id}.merge(params)),
        button('print', t(:print), :print, {:action => 'print', :id => object.id}.merge(params), :popup => ['menubar=1'])
      ].join("\n"),
      html_options
    )
  end


end
