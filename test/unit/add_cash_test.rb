require File.dirname(__FILE__) + '/../test_helper'

class AddCashTest < Test::Unit::TestCase

  def test_date_is_today
    cash = AddCash.new
    cash.date = Date.today - 1
    cash.valid?
    assert cash.errors.invalid?(:date)
    cash.date = Date.today
    cash.valid?
    assert !cash.errors.invalid?(:date)
  end

  def test_type_of_is_income
    cash = AddCash.new
    cash.valid?
    assert cash.errors.invalid?(:type_of)
    cash.type_of = Payment::TYPE_OF_INCOME
    cash.valid?
    assert !cash.errors.invalid?(:type_of)
  end


end
