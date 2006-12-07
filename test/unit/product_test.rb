require File.dirname(__FILE__) + '/../test_helper'

class ProductTest < Test::Unit::TestCase
  fixtures :products
  fixtures :organizations

  def test_mandatory_fields
    count = Product.count

    p = Product.new
    assert(!p.save)

    p.description = 'Testing mandatory fields'
    assert(!p.save)

    p.sell_price = 10.50
    assert(!p.save)

    p.organization = Organization.find(1)
    assert(p.save)

    assert_equal(count + 1, Product.count)
  end
end
