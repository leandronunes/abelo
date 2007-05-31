require File.dirname(__FILE__) + '/../test_helper'

class CashFlowTest < Test::Unit::TestCase
  fixtures :cash_flows, :historicals, :stock_entries

  def test_belongs_to_historical
    cf = CashFlow.find(1)
    assert_valid cf
    h = Historical.find(1)
    assert_valid h
    cf.historical = h
    assert_equal cf.historical, h
  end

  def test_belongs_to_organization
    cf = CashFlow.find(1)
    assert_valid cf
    o = Organization.find(1)
    assert_valid o
    cf.organization = o
    assert_equal cf.organization, o
  end

  def test_add_stock_entry
    count = CashFlow.count
    cf = CashFlow.new
    entry = StockIn.find(1)
    assert_valid entry
    cf.add_stock_entry(entry.id)
    assert_equal count+1, CashFlow.count
  end

end
