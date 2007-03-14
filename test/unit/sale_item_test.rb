require File.dirname(__FILE__) + '/../test_helper'

class SaleItemTest < Test::Unit::TestCase
  fixtures :sale_items, :sales, :products

  # Replace this with your real tests.
  def test_mandatory_fields
    item = SaleItem.new
    assert(!item.save)
    item.sale = Sale.find(1)
    assert(!item.save)
    item.product = Product.find(1)
    assert(!item.save)
    item.ammount = 5
    assert(item.save)
  end

  def test_sale
    item = SaleItem.find(1)
    assert_not_nil item.sale
    assert_kind_of Sale, item.sale
  end

  def test_product
    item = SaleItem.find(1)
    assert_not_nil item.product
    assert_kind_of Product, item.product
  end

  def test_description
    item = SaleItem.find(1)
    assert_equal(item.product.description, item.description)
  end

  def test_unitary_price
    item = SaleItem.new
    product = Product.find(:first)
    item.product = product
    assert_equal(product.sell_price, item.unitary_price)
  end

end
