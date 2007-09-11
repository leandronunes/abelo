module AccessControl

  def can(where)
    if self.current_user.nil?
      false
    else
      if where.kind_of? Hash
        self.current_user.allowed_to?(where)
      else
        location = { :controller => self.controller_name, :action => where.to_s }
        location[:organization_nickname] = @organization.identifier if @organization
        self.current_user.allowed_to?(location)
      end
    end
  end

end
