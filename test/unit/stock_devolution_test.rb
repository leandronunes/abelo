require File.dirname(__FILE__) + '/../test_helper'

class StockDevolutionTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
    @category = create_product_category
    @supplier = create_supplier
    @invoice  = create_invoice
  end

  def test_setup
    assert @organization.valid?
    assert @category.valid?
    assert @supplier.valid?
    assert @invoice.valid?
  end

  def test_amount_is_positive
    s = StockDevolution.new(:amount => -5)
    s.valid?
    assert s.amount > 0
  end

  def test_amount_is_not_zero
    s = StockDevolution.new(:amount => 0)
    s.valid?
    assert s.errors.invalid?(:amount) 
  end

  def test_status_is_done
    s = StockDevolution.new()
    s.valid?
    assert_equal s.status, Status::STATUS_DONE
  end
 
 
end
