require File.dirname(__FILE__) + '/../test_helper'

class StockDownTest < Test::Unit::TestCase

  fixtures :system_actors, :categories

  def setup
    @organization = Organization.find(:first)
    @category = ProductCategory.find(:first)
    @supplier = Supplier.find(:first)
  end
  def test_setup
    assert @organization.valid?
    assert @category.valid?
    assert @supplier.valid?
  end

  def create_product(params = {})
    p = Product.create!({:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization => @organization, :category => @category}.merge(params))
    StockIn.create!(:product => p, :status => Status::STATUS_DONE, :price => 45, :amount => 10, :date => Date.today, :supplier => @supplier)
    p
  end

  def test_remove_from_stock_more_than_amount_in_stock
     StockIn.destroy_all
     p = create_product
     entry = StockIn.find(:first)
     amount = entry.amount
     out = StockDown.new(:date => Date.today, :amount => amount + 1, :product => p)
     out.valid?
     assert out.errors.invalid?(:amount) 
  end

  def test_amount_is_negative
    amount = 5.0
    entry = StockDown.new(:amount => amount)
    entry.valid?
    assert !entry.errors.invalid?(:amount) 
    assert_equal -amount, entry.amount
  end
 
end
