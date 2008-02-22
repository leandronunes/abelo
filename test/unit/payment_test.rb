require File.dirname(__FILE__) + '/../test_helper'
require 'payment_strategy/payment_strategy'
include PaymentStrategy


class PaymentTest < Test::Unit::TestCase

  MONEY = 'money'
  CHECK = 'check'
  CREDIT_CARD = 'credit_card'
  DEBIT_CARD = 'debit_card'
  ADD_CASH = 'add_cash'
  REMOVE_CASH = 'remove_cash'
  CHANGE = 'change'
  BALANCE = 'balance'

  PAYMENT_METHODS_TEST = {MONEY => Money, CHECK => Check, CREDIT_CARD => CreditCard, DEBIT_CARD => DebitCard}
  PAYMENT_TYPES_TEST = PAYMENT_METHODS_TEST.merge({ ADD_CASH => AddCash, REMOVE_CASH => RemoveCash,CHANGE => Change, BALANCE => Balance})
  TYPE_OF_TEST = ['I', 'E']

  def test_payment_types
    assert_equal PAYMENT_TYPES_TEST, Payment::PAYMENT_TYPES
  end

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
    PAYMENT_METHODS_TEST.keys.each do |p|
      assert_not_equal p, Payment.describe_payment(p)
    end
  end

end
