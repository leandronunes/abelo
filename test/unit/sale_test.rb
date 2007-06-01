require File.dirname(__FILE__) + '/../test_helper'

class SaleTest < Test::Unit::TestCase
  fixtures :sales, :customers, :payments, :organizations, :sale_items

  def test_mandatory_fields
    s = Sale.new
    assert(!s.save)
    s.date = Date.today
    assert(!s.save)
    s.organization = Organization.find(1)
    assert(!s.save)
    s.user = User.find(7)
    assert(s.save)
  end


  def test_should_have_a_customer
    s = Sale.find(1)
    assert_not_nil s.customer
    assert_kind_of Customer, s.customer
  end

  def test_should_have_payments
    s = Sale.find(1)
    assert_not_nil s.payments
    assert_kind_of Array, s.payments
    assert ! s.payments.empty?
    assert(s.payments.all? do |payment|
      payment.kind_of? Payment
    end)
  end

  def test_should_have_items
    s = Sale.find(1)
    assert_not_nil s.items
    assert_kind_of Array, s.items
    assert !s.items.empty?
    assert(s.items.all? do |item|
      item.kind_of? SaleItem
    end)
  end

  def test_should_have_user
    s = Sale.find(1)
    assert_not_nil s.user
    assert_kind_of User, s.user
  end

  def test_default_status
    s = Sale.new
    assert(s.open?)
  end

  def test_close
    s = Sale.find(1)
    s.close!
    assert(s.closed?)
  end

  def test_cancel
    s = Sale.find(1)
    s.cancel!
    assert(s.cancelled?)
  end

  def test_total_value
    s = Sale.find(4)
    item1 = SaleItem.find(3)
    item2 = SaleItem.find(4)
    assert_valid item1
    assert_valid item2
    s.add_items(item1)
    s.add_items(item2)
    assert_equal 2, s.items.size
    value_expected = item1.price + item2.price
    assert_equal value_expected, s.total_value
  end

end
