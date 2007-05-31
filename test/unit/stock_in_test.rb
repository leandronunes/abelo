require File.dirname(__FILE__) + '/../test_helper'

class StockInTest < Test::Unit::TestCase
  fixtures :stock_entries, :products, :suppliers

  def test_mandatory_fields
    count = StockIn.count

    entry = StockIn.new
    assert !entry.save
    
    entry.product = Product.find(1)
    assert !entry.save

    entry.supplier = Supplier.find(1)
    assert !entry.save

    entry.ammount = 10
    assert !entry.save

    entry.price = 9.99
    assert !entry.save

    entry.purpose = 'sell'
    assert !entry.save

    entry.payment_status = true
    assert !entry.save

    entry.date = Date.today
    assert entry.save

    assert_equal count + 1, StockIn.count
  end

  # One cannot add a invalid item to the stock. The validity date must always
  # be after the date in which the entry gets into the stock.
  def test_dates
    entry = StockIn.find(1)
    entry.date = Date.today
    
    entry.validity = (Date.today << 1) # a month ago (must be invalid)
    assert !entry.save

    entry.validity = (Date.today >> 1) # a month from today (must be valid)
    assert entry.save
  end

  def test_ammout_signal
    entry = StockIn.find(1)
    entry.ammount = -10
    assert !entry.save
    entry.ammount = 10
    assert entry.save
  end

end
