require File.dirname(__FILE__) + '/../test_helper'

class StockVirtualTest < Test::Unit::TestCase
  
  def test_cannot_save
    s = StockVirtual.new
    assert_raise(RuntimeError){s.save}
  end

  def test_create_virtuals_with_nil_param
    assert_equal Array.new, StockVirtual.create_virtuals(nil)
  end

  def test_create_virtuals_with_string_as_parameter
    assert_equal Array.new, StockVirtual.create_virtuals(String.new)    
  end

  def test_create_virtuals_with_array_of_product_as_parameter
    @organization = create_organization
    @product_category = create_product_category
    @unit = create_unit
    p1 = create_product
    p2 = create_product
    assert_equal 2, StockVirtual.create_virtuals([p1,p2]).length
  end

end
