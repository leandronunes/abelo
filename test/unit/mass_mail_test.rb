require File.dirname(__FILE__) + '/../test_helper'

class MassMailTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :identifier => 'org')
  end

  #TODO make this tests
  def test_true
    assert true
  end

end
