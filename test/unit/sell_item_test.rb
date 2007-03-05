require File.dirname(__FILE__) + '/../test_helper'

class SellItemTest < Test::Unit::TestCase
  fixtures :sell_items, :sells, :products

  # Replace this with your real tests.
  def test_mandatory_fields
    item = SellItem.new
    assert(!item.save)
    item.sell = Sell.find(1)
    assert(!item.save)
    item.product = Product.find(1)
    assert(!item.save)
    item.ammount = 5
    assert(item.save)
  end

  def test_sell
    item = SellItem.find(1)
    assert_not_nil item.sell
    assert_kind_of Sell, item.sell
  end

  def test_product
    item = SellItem.find(1)
    assert_not_nil item.product
    assert_kind_of Product, item.product
  end
end
