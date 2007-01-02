require File.dirname(__FILE__) + '/../test_helper'

class StockOutTest < Test::Unit::TestCase
  fixtures :stock_entries, :products, :suppliers

  def test_mandatory_fields
    count = StockOut.count

    entry = StockOut.new
    assert !entry.save
    
    entry.product = Product.find(1)
    assert !entry.save

    entry.ammount = -10
    assert !entry.save

    entry.purpose = 'sell'
    assert !entry.save

    entry.date = Date.today
    assert entry.save

    assert_equal count + 1, StockOut.count
  end

  def test_ammout_signal
    entry = StockOut.new({
      :product_id => 1,
      :purpose => 'sell',
      :date => '2007-01-01',
    })
    entry.ammount = 10
    assert !entry.save
    entry.ammount = -10
    assert entry.save
  end

end
