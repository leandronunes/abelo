require File.dirname(__FILE__) + '/../test_helper'

class StockEntryTest < Test::Unit::TestCase
  fixtures :stock_entries

  def test_relation_with_product
    entry = StockEntry.find(1)
    assert_not_nil entry.product
    assert_equal Product, entry.product.class
  end

  def test_purpose
    count = StockEntry.count

    entry = StockIn.new({
      :product_id => 1,
      :supplier_id => 1,
      :ammount => 1,
      :price => 1.99,
      :purpose => 'blabalble', # invalid purpose
      :date =>  '2007-01-01',
    })

    assert !entry.save

    entry.purpose = 'sell'
    assert entry.save

    entry.purpose = 'production'
    assert entry.save

    entry.purpose = 'kkkkk' # other invalid purpose
    assert !entry.save

    assert_equal count + 1, StockEntry.count

  end

end
