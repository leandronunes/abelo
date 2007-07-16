module OrganizationsHelper

  def link_to_organization(text, org, options = {}, html_options = {})
    link_to text, { :controller => 'main', :organization_nickname => org.nickname }.merge(options), html_options
  end

end
