require File.dirname(__FILE__) + '/../test_helper'

class DepartmentDisplayTest < Test::Unit::TestCase
  AVAILABLE_FIELDS_TEST = %w[
      name 
  ]
  def test_available_fields
    assert_equal AVAILABLE_FIELDS_TEST, DepartmentDisplay.available_fields
  end

  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, DepartmentDisplay.describe(field)
    end
  end


  def test_title
    assert_not_nil DepartmentDisplay.title
  end

end
