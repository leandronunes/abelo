require File.dirname(__FILE__) + '/../test_helper'

class TextArticleDisplayTest < Test::Unit::TestCase

  AVAILABLE_FIELDS_TEST = %w[
      name
      body
  ]
  def test_available_fields
    assert_equal [], TextArticleDisplay.available_fields - AVAILABLE_FIELDS_TEST
  end
  
  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, TextArticleDisplay.describe(field)
    end
  end

end
