require File.dirname(__FILE__) + '/../test_helper'

class PaymentTest < Test::Unit::TestCase

  PAYMENT_METHODS_TEST = %w[
    check
    credit_card
    debit_card
    money
  ]
 
  TYPE_OF_TEST = ['I', 'E']

  def test_payment_methods
    assert_equal PAYMENT_METHODS_TEST, Payment::PAYMENT_METHODS
  end

  def test_income
    assert_equal 'I', Payment::TYPE_OF_INCOME
  end

  def test_expense
    assert_equal 'E', Payment::TYPE_OF_EXPENSE
  end

  def test_type_of
    assert_equal TYPE_OF_TEST, Payment::TYPE_OF
  end

  def test_income?
    assert Payment.income?('I')
  end

  def test_expense?
    assert Payment.expense?('E')
  end

  def test_describe
    TYPE_OF_TEST.each do |i|
      assert_not_equal i, Payment.describe(i)
    end
  end

  def test_describe_payment
    PAYMENT_METHODS_TEST.each do |p|
      assert_not_equal p, Payment.describe_payment(p)
    end
  end

end
