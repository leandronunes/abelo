module OrganizationsHelper

  def link_to_organization(text, org, options = {}, html_options = {})
    link_to text, { :controller => 'organization', :organization_nickname => org.nickname }.merge(options), html_options
  end

  def display_collection_options(item, params = {}, html_options = {})
    content_tag(:div,
      [
        button('view_small', t(:show), :show, {:action => 'show', :organization_id => item.id}.merge(params)),
        button('edit_small', t(:edit), :edit, {:action => 'edit', :organization_id => item.id}.merge(params)),
        button('del_small', t(:destroy), :destroy, {:action => 'destroy', :organization_id => item.id}.merge(params),
               :method => 'post', :confirm => t(:are_you_sure?))
      ].join("\n"),
      :class => 'list_item_button'
    )
  end

end
