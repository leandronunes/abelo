require File.dirname(__FILE__) + '/../test_helper'
require 'organizations_controller'

# Re-raise errors caught by the controller.
class OrganizationsController; def rescue_action(e) raise e end; end

class OrganizationsControllerTest < Test::Unit::TestCase
  def setup
    @controller = OrganizationsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_create
    count = Organization.count
    post :create, :organization => {
      :name => 'Organization for testing organizations controller',
      :nickname => 'testing_organizations_controller',
      :cnpj => '78048802000169',
    }
    assert_equal(count + 1, Organization.count)
  end

  def test_remove
    org = Organization.new(:name => 'Organization for testing controller destroy', :nickname => 'destroy_me', :cnpj => '44383007000105')
    assert(org.save)

    count = Organization.count
    post :destroy, :id => org.id

    assert_equal(count - 1, Organization.count)
  end

end
