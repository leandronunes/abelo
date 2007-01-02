require File.dirname(__FILE__) + '/../test_helper'

class StockEntryTest < Test::Unit::TestCase
  fixtures :stock_entries

  #def test_mandatory_fields_in
  #  entry = StockIn.new
  #end
  #def test_mandatory_fields_out
  #  entry = StockOut.new
  #end

  def test_relation_with_product
    entry = StockEntry.find(1)
    assert_not_nil entry.product
    assert_equal Product, entry.product.class
  end
end
