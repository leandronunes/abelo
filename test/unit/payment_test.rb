require File.dirname(__FILE__) + '/../test_helper'

class PaymentTest < Test::Unit::TestCase

  PAYMENT_METHODS_TEST = %w[
    check
    credit_card
    debit_card
    money
  ]

  def test_payment_methods
    assert_equal PAYMENT_METHODS_TEST, Payment::PAYMENT_METHODS
  end

  def test_payment_methods_are_describe
    PAYMENT_METHODS_TEST.each do |p|
      assert_not_equal p, Payment.decribe(p)
    end
  end

end
