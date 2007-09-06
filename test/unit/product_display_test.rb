require File.dirname(__FILE__) + '/../test_helper'

class ProductDisplayTest < Test::Unit::TestCase

  def test_available_fields
    assert_equal ['name', 'size', 'color', 'description', 'sell_price', 'unit', 'category', 'suppliers', 'minimum_amount'], ProductDisplay.available_fields
  end

  def test_title_size
    assert_kind_of String, ProductDisplay.title_size
  end

  def test_title_color
    assert_kind_of String, ProductDisplay.title_color
  end

  def test_title_description
    assert_kind_of String, ProductDisplay.title_description
  end

  def test_title_sell_price
    assert_kind_of String, ProductDisplay.title_sell_price
  end

  def test_title_unit
    assert_kind_of String, ProductDisplay.title_unit
  end

  def test_title_suppliers
    assert_kind_of String, ProductDisplay.title_suppliers
  end

  def test_title_image
    assert_kind_of String, ProductDisplay.title_image
  end

end
