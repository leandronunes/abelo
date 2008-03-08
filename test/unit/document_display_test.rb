require File.dirname(__FILE__) + '/../test_helper'

class DocumentDisplayTest < Test::Unit::TestCase

  AVAILABLE_FIELDS_TEST = %w[
      name 
      body  
      departments
      owner 
      owner_class
      tag_list
  ]

  def test_available_fields
    assert_equal [], DocumentDisplay.available_fields - AVAILABLE_FIELDS_TEST
  end
  
  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, DocumentDisplay.describe(field)
    end
  end

end
