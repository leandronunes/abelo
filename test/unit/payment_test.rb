require File.dirname(__FILE__) + '/../test_helper'

class PaymentTest < Test::Unit::TestCase
  fixtures :payments, :sales

  # is there anything to test here?
  def test_sale
    p = Payment.find(1)
    assert_not_nil p.sale
    assert_kind_of Sale, p.sale
  end

end
