module OrganizationsHelper

  def link_to_organization(text, org, options = {}, html_options = {})
    link_to text, { :controller => 'main', :organization_nickname => org.nickname }.merge(options), html_options
  end

  def display_collection_options(item, params = {}, html_options = {})
    content_tag(:div,
      [
        button('view_small', _('Show'), :show, {:action => 'show', :organization_id => item.id}.merge(params)),
        button('edit_small', _('Edit'), :edit, {:action => 'edit', :organization_id => item.id}.merge(params)),
        button('del_small', _('Destroy'), :destroy, {:action => 'destroy', :organization_id => item.id}.merge(params),
               :method => 'post', :confirm => _('Are you sure?'))
      ].join("\n"),
      :class => 'list_item_button'
    )
  end

end
