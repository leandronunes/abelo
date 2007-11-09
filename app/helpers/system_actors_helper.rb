module SystemActorsHelper
 
  def display_documents_list_options(object, method, params = {})
    [
      form_tag({:action => 'list_documents'}.merge(params), :class => 'search_itens'),
        display_autocomplete(object, method, params),
        button('search', _('Search Document'), :search),
        button('add', _("Add New Document"), :new, {:action => 'choose_document'}.merge(params) ),
        button('reset', _('Reset document search'), :list, {:action => 'list_documents'}.merge(params)),
      '</form>'
    ].join("\n")
    
  end
  
  def display_document_collection(collection = Array.new, params = {}, html_options = {})
    content = Array.new
    collection.each do |c|
      content.push(
        [
          display_document_collection_options(c, params),
          display_info(c, html_options, true )
        ]
      )
    end

    display_list_info(content, html_options)

  end

  def display_document_collection_options(item, params = {}, html_options = {})
    content_tag(:div,
      [
        button('view_small', _('Show'), :show, {:action => 'show_document', :document_id => item.id}.merge(params)),
       button('edit_small', _('Edit'), :edit, {:action => 'edit_document', :document_id => item.id}.merge(params)),
        button('del_small', _('Destroy'), :destroy, {:action => 'destroy_document', :document_id => item.id}.merge(params),
               :method => 'post', :confirm => _('Are you sure?'))
      ].join("\n"),
      :class => 'list_item_button'
    )
  end
  
  def display_show_info_documents_options(object, params = {},  html_options = {})
    content_tag(:div,
      [
        button('back', _('Back'), :back, {:action => 'list_documents'}.merge(params)),
        button('edit', _('Edit'), :edit, {:action => 'edit_document', :document_id => object.id}.merge(params))
      ].join("\n"),
      html_options
    )
  end
  
end
