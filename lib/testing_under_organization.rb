module TestingUnderOrganization

#TODO This is a deprecated method now you can use the method "under_organization :organization_codename"
# as you can see in departments_controller_test 

  def get(path, parameters = nil, headers = nil)
    raise "@organization_nickname must be set for this test case" unless @organization_nickname
    local_params = { :organization_nickname => @organization_nickname }
    super(path, parameters ? parameters.merge(local_params) : local_params , headers)
  end

  def post(path, parameters = nil, headers = nil)
    raise "@organization_nickname must be set for this test case" unless @organization_nickname
    local_params = { :organization_nickname => @organization_nickname }
    super(path, parameters ? parameters.merge(local_params) : local_params , headers)
  end
end
