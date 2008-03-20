require File.dirname(__FILE__) + '/../test_helper'

class StockOutTest < Test::Unit::TestCase
  fixtures :system_actors, :categories

  #FIXME make more test of the kind of stock
  def setup
    UnitMeasure.destroy_all
    @organization = create_organization
    @product_category = create_product_category
    @supplier = Supplier.find(:first)
    @invoice  = create_invoice
  end

  def test_setup
    assert @organization.valid?
    assert @product_category.valid?
    assert @supplier.valid?
    assert @invoice.valid?
  end

  def test_remove_from_stock_more_than_amount_in_stock
     StockIn.destroy_all
     p = create_product
     entry = create_stock_in(:product => p)
     amount = entry.amount
     out = StockOut.new(:date => Date.today, :amount => amount + 1, :product => p)
     out.valid?
     assert out.errors.invalid?(:amount)
  end

  def test_amount_is_negative
    amount = 5.0
    entry = StockOut.new(:amount => amount)
    entry.valid?
    assert !entry.errors.invalid?(:amount)
    assert_equal -amount, entry.amount
  end


end
