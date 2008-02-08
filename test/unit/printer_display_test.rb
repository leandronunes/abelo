require File.dirname(__FILE__) + '/../test_helper'

class PrinterDisplayTest < Test::Unit::TestCase

  AVAILABLE_FIELDS_TEST = %w[
      serial
      computer_id
  ]
  def test_available_fields
    assert_equal AVAILABLE_FIELDS_TEST, PrinterDisplay.available_fields
  end

  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, PrinterDisplay.describe(field)
    end
  end

end
