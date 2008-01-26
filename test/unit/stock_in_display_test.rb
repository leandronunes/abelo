require File.dirname(__FILE__) + '/../test_helper'

class StockInDisplayTest < Test::Unit::TestCase

  AVAILABLE_FIELDS_TEST = %w[
    date
    amount
    supplier
    product
    validity
    price
  ]

  def test_available_fields
    assert_equal 0, (AVAILABLE_FIELDS_TEST - StockInDisplay.available_fields).length
  end
  
  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, StockInDisplay.describe(field)
    end
  end

  def test_fields_are_valid_methods
    s = StockIn.new
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_nothing_raised { s.send("#{field}") }
    end
  end

end
