require File.dirname(__FILE__) + '/../test_helper'

class DepartmentDisplayTest < Test::Unit::TestCase

  def test_available_fields
    assert ['name'], DepartmentDisplay.available_fields
  end

  def test_title_name
    assert_kind_of String, DepartmentDisplay.title_name
  end

end
