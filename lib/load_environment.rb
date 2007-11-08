module LoadEnvironment
  def load_environment
    @environment = @organization.environment
    if @environment.nil?
      raise "There is no environment associated to organization %s" % @organization.name
    end
  end

end
