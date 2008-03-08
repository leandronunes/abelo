require File.dirname(__FILE__) + '/../test_helper'

class StockDownTest < Test::Unit::TestCase

  fixtures :system_actors, :categories

  def setup
    @organization = create_organization
    @category = ProductCategory.find(:first)
    @supplier = Supplier.find(:first)
  end

  def test_setup
    assert @organization.valid?
    assert @category.valid?
    assert @supplier.valid?
  end

  def test_remove_from_stock_more_than_amount_in_stock
     amount = 23     
     product = mock()
     product.stubs(:amount_in_stock).returns(amount)
     StockDown.any_instance.stubs(:product).returns(product)
     s = StockDown.new(:amount => amount + 1)
     s.valid?
     assert s.errors.invalid?(:amount) 
  end

  def test_amount_is_negative
    amount = 5.0
    entry = StockDown.new(:amount => amount)
    entry.valid?
    assert !entry.errors.invalid?(:amount) 
    assert_equal -amount, entry.amount
  end

  def test_status_is_done
    s = StockDown.new()
    s.valid?
    assert_equal s.status, Status::STATUS_DONE
  end

  def test_decimal_amount
    s = StockDown.new
    s.amount = '15'
    assert_equal 15, s.amount
    s.amount = '15.45'
    assert_equal 1545, s.amount
    s.amount = '15,23'
    assert_equal 15.23, s.amount
    s.amount = '1.345,23'
    assert_equal 1345.23, s.amount
  end

end
