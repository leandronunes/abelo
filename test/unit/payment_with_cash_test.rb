require File.dirname(__FILE__) + '/../test_helper'

class PaymentWithCashTest < Test::Unit::TestCase
  fixtures :payments

  def test_mandatory_fields
    p = PaymentWithCash.new
    assert(!p.save)
    p.sell_id = 1
    assert(!p.save)
    p.value = 10.0
    assert(!p.save)
    p.date = Date.today
    assert(!p.save)
    p.received = true
    assert(!p.save)
    p.cash = 11.0
    assert(p.save)
  end

  def test_cash_and_change
    p = PaymentWithCash.find(1)
    assert_in_delta 1.5, p.value, 0.001
    assert_in_delta 2.0, p.cash, 0.001
    assert_in_delta 0.5, p.change, 0.001
  end

end
