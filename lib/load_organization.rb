module LoadOrganization
  def load_organization
    @organization = Organization.find_by_identifier(params[:organization_nickname])
    
    if @organization.nil?
#FIXME See the better way to generate the exception.
#I think the raise way it's better
#      render_error(_("There is no organization with nickname %s") % params[:organization_nickname])
      raise "There is no organization with nickname %s" % params[:organization_nickname]
    end
  end

end
