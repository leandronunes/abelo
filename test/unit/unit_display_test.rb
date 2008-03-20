require File.dirname(__FILE__) + '/../test_helper'

class UnitDisplayTest < Test::Unit::TestCase

  AVAILABLE_FIELDS_TEST = %w[
      name
      abbreviation
  ]
  def test_available_fields
    assert_equal [], UnitDisplay.available_fields - AVAILABLE_FIELDS_TEST
  end
  
  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, UnitDisplay.describe(field)
    end
  end

end
