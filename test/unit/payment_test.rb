require File.dirname(__FILE__) + '/../test_helper'

class PaymentTest < Test::Unit::TestCase
  fixtures :payments, :sells

  # is there anything to test here?
  def test_sell
    p = Payment.find(1)
    assert_not_nil p.sell
    assert_kind_of Sell, p.sell
  end

end
