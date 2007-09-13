require File.dirname(__FILE__) + '/../test_helper'
require 'test_controller'

# Re-raise errors caught by the controller.
class TestController; def rescue_action(e) raise e end; end

class ApplicationControllerTest < Test::Unit::TestCase

  under_organization :one

  def setup
    @controller = TestController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as('quentin')
  end

  def test_num_to_currency_nil
    get :num_to_currency_nil
    assert_tag :content => '0,00'
  end

  def test_num_to_currency_0
    get :num_to_currency_0
    assert_tag :content => '0,00'
  end

  def test_num_to_currency_1_01
    get :num_to_currency_1_01
    assert_tag :content => '1,01'
  end

  def test_num_to_currency_1
    get :num_to_currency_1
    assert_tag :content => '1,00'
  end

  def test_num_to_currency_1_012
    get :num_to_currency_1_012
    assert_tag :content => '1,01'
  end

  def test_num_to_currency_1_018
    get :num_to_currency_1_018
    assert_tag :content => '1,02'
  end

  def test_num_to_currency_1_99
    get :num_to_currency_1_99
    assert_tag :content => '1,99'
  end

  def test_num_to_currency_1_992
    get :num_to_currency_1_992
    assert_tag :content => '1,99'
  end

  def test_num_to_currency_1_998
    get :num_to_currency_1_998
    assert_tag :content => '2,00'
  end

  def test_num_to_currency_1_9999
    get :num_to_currency_1_9999
    assert_tag :content => '2,00'
  end

  def test_num_to_currency_12
    get :num_to_currency_12
    assert_tag :content => '12,00'
  end

  def test_num_to_currency_12_01
    get :num_to_currency_12_01
    assert_tag :content => '12,01'
  end

  def test_num_to_currency_12_012
    get :num_to_currency_12_012
    assert_tag :content => '12,01'
  end

  def test_num_to_currency_12_018
    get :num_to_currency_12_018
    assert_tag :content => '12,02'
  end

  def test_num_to_currency_12_112
    get :num_to_currency_12_112
    assert_tag :content => '12,11'
  end

  def test_num_to_currency_12_118
    get :num_to_currency_12_118
    assert_tag :content => '12,12'
  end

  def test_num_to_currency_12_11
    get :num_to_currency_12_11
    assert_tag :content => '12,11'
  end

  def test_num_to_currency_123
    get :num_to_currency_123
    assert_tag :content => '123,00'
  end

  def test_num_to_currency_1234
    get :num_to_currency_1234
    assert_tag :content => '1.234,00'
  end

  def test_num_to_currency_12345
    get :num_to_currency_12345
    assert_tag :content => '12.345,00'
  end

  def test_num_to_currency_123456
    get :num_to_currency_123456
    assert_tag :content => '123.456,00'
  end

  def test_num_to_currency_1234567
    get :num_to_currency_1234567
    assert_tag :content => '1.234.567,00'
  end

  def test_num_to_currency__1
    get :num_to_currency__1
    assert_tag :content => '-1,00'
  end




  def test_num_to_currency___1_01
    get :num_to_currency__1_01
    assert_tag :content => '-1,01'
  end

  def test_num_to_currency___1
    get :num_to_currency__1
    assert_tag :content => '-1,00'
  end

  def test_num_to_currency___1_012
    get :num_to_currency__1_012
    assert_tag :content => '-1,01'
  end

  def test_num_to_currency___1_018
    get :num_to_currency__1_018
    assert_tag :content => '-1,02'
  end

  def test_num_to_currency___1_99
    get :num_to_currency__1_99
    assert_tag :content => '-1,99'
  end

  def test_num_to_currency___1_992
    get :num_to_currency__1_992
    assert_tag :content => '-1,99'
  end

  def test_num_to_currency___1_998
    get :num_to_currency__1_998
    assert_tag :content => '-2,00'
  end

  def test_num_to_currency___1_9999
    get :num_to_currency__1_9999
    assert_tag :content => '-2,00'
  end

  def test_num_to_currency___12
    get :num_to_currency__12
    assert_tag :content => '-12,00'
  end

  def test_num_to_currency___12_01
    get :num_to_currency__12_01
    assert_tag :content => '-12,01'
  end

  def test_num_to_currency___12_012
    get :num_to_currency__12_012
    assert_tag :content => '-12,01'
  end

  def test_num_to_currency___12_018
    get :num_to_currency__12_018
    assert_tag :content => '-12,02'
  end

  def test_num_to_currency___12_112
    get :num_to_currency__12_112
    assert_tag :content => '-12,11'
  end

  def test_num_to_currency___12_118
    get :num_to_currency__12_118
    assert_tag :content => '-12,12'
  end

  def test_num_to_currency___12_11
    get :num_to_currency__12_11
    assert_tag :content => '-12,11'
  end

  def test_num_to_currency___123
    get :num_to_currency__123
    assert_tag :content => '-123,00'
  end

  def test_num_to_currency___1234
    get :num_to_currency__1234
    assert_tag :content => '-1.234,00'
  end

  def test_num_to_currency___12345
    get :num_to_currency__12345
    assert_tag :content => '-12.345,00'
  end

  def test_num_to_currency___123456
    get :num_to_currency__123456
    assert_tag :content => '-123.456,00'
  end

  def test_num_to_currency___1234567
    get :num_to_currency__1234567
    assert_tag :content => '-1.234.567,00'
  end



end
