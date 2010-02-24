require File.dirname(__FILE__) + '/../test_helper'

class ProductDisplayTest < Test::Unit::TestCase

  AVAILABLE_FIELDS_TEST = %w[
      image
      name
      size
      color
      sell_price 
      unit_measure
      category
      suppliers
      amount_in_stock
      minimum_amount
      info
      code
  ]
  def test_available_fields
    assert_equal [], ProductDisplay.available_fields - AVAILABLE_FIELDS_TEST
  end
  
  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, ProductDisplay.describe(field)
    end
  end

end
