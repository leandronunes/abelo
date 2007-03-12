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


  def test_customer
    s = Sale.find(1)
    assert_not_nil s.customer
    assert_kind_of Customer, s.customer
  end

  def test_payments
    s = Sale.find(1)
    assert_not_nil s.payments
    assert_kind_of Array, s.payments
    assert ! s.payments.empty?
    assert(s.payments.all? do |payment|
      payment.kind_of? Payment
    end)
  end

  def test_items
    s = Sale.find(1)
    assert_not_nil s.items
    assert_kind_of Array, s.items
    assert !s.items.empty?
    assert(s.items.all? do |item|
      item.kind_of? SaleItem
    end)
  end

end
