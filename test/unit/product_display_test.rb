require File.dirname(__FILE__) + '/../test_helper'

class ProductDisplayTest < Test::Unit::TestCase

  AVAILABLE_FIELDS_TEST = %w[
      name
      size
      color
      description
      sell_price 
      unit
      category
      suppliers
      minimum_amount
  ]
  def test_availavle_fields
    assert_equal AVAILABLE_FIELDS_TEST, ProductDisplay.available_fields
  end
  
  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, ProductDisplay.describe(field)
    end
  end

end
