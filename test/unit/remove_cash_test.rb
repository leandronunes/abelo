require File.dirname(__FILE__) + '/../test_helper'

class RemoveCashTest < Test::Unit::TestCase

  def test_date_is_today
    cash = RemoveCash.new
    cash.date = Date.today - 1
    cash.valid?
    assert cash.errors.invalid?(:date)
    cash.date = Date.today
    cash.valid?
    assert !cash.errors.invalid?(:date)
  end

  def test_type_of_is_expense
    cash = RemoveCash.new
    cash.valid?
    assert cash.errors.invalid?(:type_of)
    cash.type_of = Payment::TYPE_OF_EXPENSE
    cash.valid?
    assert !cash.errors.invalid?(:type_of)
  end


end
