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
      amount_in_stock
      minimum_amount
      image
  ]
  def test_available_fields
    assert_equal AVAILABLE_FIELDS_TEST, ProductDisplay.available_fields
  end
  
  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, ProductDisplay.describe(field)
    end
  end

  def test_title
    assert_not_nil ProductDisplay.title
  end

end
