require File.dirname(__FILE__) + '/../test_helper'
require 'application_helper'

# Re-raise errors caught by the controller. 
class ApplicationHelperTestController <  ApplicationController
  skip_before_filter :check_access_control
  skip_before_filter :login_required

  def select_status
    render :inline => '<%= select_status("invoice", "status") %>'
  end

end 

class ApplicationHelperTestController; def rescue_action(e) raise e end; end

class ApplicationHelperTest < Test::Unit::TestCase

  def setup
    @controller = ApplicationHelperTestController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_select_status
    get :select_status
    assert_tag :tag => 'select', :descendant => {:tag => 'option', :attributes => {:value => Status::STATUS_PENDING}}
    assert_tag :tag => 'select', :descendant => {:tag => 'option', :attributes => {:value => Status::STATUS_CANCELLED}}
    assert_tag :tag => 'select', :descendant => {:tag => 'option', :attributes => {:value => Status::STATUS_DONE}}
  end


end
