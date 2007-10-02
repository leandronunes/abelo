module AccessControl

  def can(where, user = nil)
    user ||= self.current_user
    if user.nil?
      false
    else
      if where.kind_of?(Hash) || where.kind_of?(Array)
        parse_organization(where)
        return user.allowed_to?(where)
      else
        location = { :controller => self.controller_name, :action => where.to_s }
        parse_organization(location)
        user.allowed_to?(location)
      end
    end
  end

  def parse_organization(locations)
    return locations if @organization.nil?
    locations = [locations] unless locations.kind_of?(Array)
    locations.each do |item|
      item[:organization_nickname] ||= @organization.identifier 
    end
  end

end
