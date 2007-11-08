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

end
