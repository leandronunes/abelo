require File.dirname(__FILE__) + '/../test_helper'

class CategoryDisplayTest < Test::Unit::TestCase

  def test_available_fields   
    assert_equal ['name', 'parent'], CategoryDisplay.available_fields
  end

  def test_title_name
    assert_kind_of String, CategoryDisplay.title_name
  end

  def test_title_parent
    assert_kind_of String, CategoryDisplay.title_parent
  end

end
