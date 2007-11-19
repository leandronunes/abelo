require File.dirname(__FILE__) + '/../test_helper'

class BankAccountDisplayTest < Test::Unit::TestCase

  AVAILABLE_FIELDS_TEST = %w[
      bank
      agency
      variation
      account
      is_default
  ]
  def test_available_fields
    assert_equal AVAILABLE_FIELDS_TEST, BankAccountDisplay.available_fields
  end

  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, BankAccountDisplay.describe(field)
    end
  end

end
