require File.dirname(__FILE__) + '/../test_helper'

class BalanceDisplayTest < Test::Unit::TestCase
  AVAILABLE_FIELDS_TEST = %w[
      bank_account
      value
      date
  ]
  def test_available_fields
    assert_equal AVAILABLE_FIELDS_TEST, BalanceDisplay.available_fields
  end
 
  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, BalanceDisplay.describe(field)
    end
  end

  def test_presence_of_field_on_available_fields
    m = BalanceDisplay.new
    m.field = 'some field'
    m.valid?
    assert m.errors.invalid?(:field)

    m.field = 'value'
    m.valid?
    assert !m.errors.invalid?(:field)
  end


end
