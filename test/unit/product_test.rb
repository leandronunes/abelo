require File.dirname(__FILE__) + '/../test_helper'

class ProductTest < Test::Unit::TestCase
  fixtures :products
  fixtures :organizations
  fixtures :product_categories

  def setup
    @organization = Organization.find(1)
  end

  def test_mandatory_fields
    count = Product.count

    p = Product.new
    assert(!p.save)

    p.description = 'Testing mandatory fields'
    assert(!p.save)

    p.sell_price = 10.50
    assert(!p.save)

    p.organization = @organization
    assert(!p.save)

    category = @organization.product_categories.find(1)
    p.category_id = category.id

    assert(p.save)

    assert_equal(count + 1, Product.count)
  end

  def test_suppliers
    p = Product.find(1)
    assert_not_nil p.suppliers
    assert_equal Array, p.suppliers.class
    p.suppliers.each { |s|
      assert_equal Supplier, s.class
    }
  end

end
