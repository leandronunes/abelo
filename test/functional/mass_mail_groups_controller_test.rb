require File.dirname(__FILE__) + '/../test_helper'
require 'mass_mail_groups_controller'

# Re-raise errors caught by the controller.
class MassMailGroupsController; def rescue_action(e) raise e end; end

class MassMailGroupsControllerTest < Test::Unit::TestCase

  under_organization :some

  def setup
    @controller = MassMailGroupsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as('quentin')
    @organization = create_organization(:identifier => 'some')
    @mass_mail_group = create_mass_mail_group
  end

  #TODO 
  def test_index
    assert true
  end
end
