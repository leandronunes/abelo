require File.dirname(__FILE__) + '/../test_helper'

class ProductTest < Test::Unit::TestCase
  fixtures :products
  fixtures :organizations
  fixtures :product_categories
  fixtures :suppliers

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

    p.unit = 'un'
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

  def test_stock
    p = Product.new({
      :description => 'Product for testing stock ammount',
      :organization_id => 1,
      :unit => 'un',
      :sell_price => 5.99,
      :category_id => 1
    })
    assert p.save


    # generate 10 stock ins
    total = 0.0
    (1..10).each { |n|
      entry = StockIn.new
      entry.ammount = n

      entry.product = p
      entry.supplier = p.organization.suppliers.find(:first)

      assert_not_nil entry.supplier

      entry.price = 1.99
      entry.purpose = 'sell'
      entry.date = Date.today
      
      assert entry.save

      total += n
    }

    assert_equal total, p.ammount_in_stock # 55 = 1 + 2 + ... + 10

    out_ammount = 15

    out = StockOut.new
    out.product = p
    out.purpose = 'sell'
    out.date = Date.today
    out.ammount = - out_ammount
    assert out.save

    assert_equal (total - out_ammount), p.ammount_in_stock

    overflow = StockOut.new
    overflow.product = p
    overflow.purpose = 'sell'
    overflow.date = Date.today
    overflow.ammount = -1000
    assert !overflow.save

    assert(p.ammount_in_stock >= 0)

  end

end
