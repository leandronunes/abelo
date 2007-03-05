require File.dirname(__FILE__) + '/../test_helper'

class PaymentTest < Test::Unit::TestCase
  fixtures :payments

  # is there anything to test here?
  def test_fixtures
    assert(Payment.count > 0)
  end

end
