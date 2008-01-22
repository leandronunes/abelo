require File.dirname(__FILE__) + '/../test_helper'

class InvoiceDisplayTest < Test::Unit::TestCase

  AVAILABLE_FIELDS_TEST = %w[
    number
    serie
    supplier_id
    issue_date
    status
  ]

  def test_available_fields
    assert_equal AVAILABLE_FIELDS_TEST, InvoiceDisplay.available_fields
  end
  
  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, InvoiceDisplay.describe(field)
    end
  end

  def test_fields_are_valid_methods
    s = StockIn.new
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_nothing_raised { s.send("#{field}") }
    end
  end

end
