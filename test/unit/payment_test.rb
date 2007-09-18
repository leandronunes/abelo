require File.dirname(__FILE__) + '/../test_helper'

class PaymentTest < Test::Unit::TestCase

  PAYMENT_METHODS_TEST = %w[
    check
    credit_card
    debit_card
    money
  ]

  fixtures :sales, :bank_accounts

  def setup
    @sale = Sale.find(:first)
  end

  def test_setup
    assert @sale.valid?
  end

  def test_payment_methods
    assert_equal PAYMENT_METHODS_TEST, Payment::PAYMENT_METHODS
  end

  def test_payment_methods_are_describe
    PAYMENT_METHODS_TEST.each do |p|
      assert_not_equal p, Payment.describe(p)
    end
  end

  def test_value_is_at_least_0_01
    p = Payment.new()
    p.value = 0.0
    p.valid?
    assert p.errors.invalid?(:value)
    p.value = 0.01
    p.valid?
    assert !p.errors.invalid?(:value)    
  end

  def test_value_did_not_return_nil
    p = Payment.new()
    p.value = nil
    assert_not_nil p.value
  end

  def test_value_is_greater_than_0
    p = Payment.new()
    p.valid?
    assert p.errors.invalid?(:value)
    p.value = 1.0
    p.valid?
    assert !p.errors.invalid?(:value)    
  end

  def test_value_is_not_negative
    p = Payment.new()
    p.valid?
    assert p.errors.invalid?(:value)
    p.value = -1.0
    p.valid?
    assert p.errors.invalid?(:value)    
  end

#TODO make this works in future
#  def test_associated_to_ledger
#    p = Payment.new(:date => Date.today, :value => 2)
#    p.valid?
#    assert p.errors.invalid?(:ledger)
#    p.owner = @sale
#    p.valid?
#    assert !p.errors.invalid?(:ledger)
#  end

  def test_validates_presence_of_owner
    p = Payment.new()
    p.valid?
    assert p.errors.invalid?(:owner)
    p.owner = @sale
    p.valid?
    assert !p.errors.invalid?(:owner)
  end

  def test_validates_presence_of_date
    p = Payment.new()
    p.valid?
    assert p.errors.invalid?(:date)
    p.date = Date.today
    p.valid?
    assert !p.errors.invalid?(:date)
  end


end
