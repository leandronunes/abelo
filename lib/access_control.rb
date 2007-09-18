module AccessControl

  def can(where, user = nil)
    user ||= self.current_user
    if user.nil?
      false
    else
      if where.kind_of? Hash
        user.allowed_to?(where)
      else
        location = { :controller => self.controller_name, :action => where.to_s }
        location[:organization_nickname] = @organization.identifier if @organization
        user.allowed_to?(location)
      end
    end
  end

end
