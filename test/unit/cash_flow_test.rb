require File.dirname(__FILE__) + '/../test_helper'

class CashFlowTest < Test::Unit::TestCase
  fixtures :cash_flows, :historicals, :stock_entries, :organizations, :products, :suppliers, :specifications, :sales, :sale_items, :customers

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

  def test_add_sale
    count = CashFlow.count
    cf = CashFlow.new
    sale = Sale.find(1)
    assert_valid sale
    cf.add_sale(sale.id)
    assert_equal count+1, CashFlow.count
  end

  def test_add_sale_custumer_nil
    count = CashFlow.count
    cf = CashFlow.new
    sale = Sale.find(2)
    assert_valid sale
    cf.add_sale(sale.id)
    assert_equal count+1, CashFlow.count
  end

  def test_total_value
    cash_flows = Array.new
    cf1 =CashFlow.find(1)
    cf2 = CashFlow.find(2)
    cash_flows.push(cf1)
    cash_flows.push(cf2)
    assert_equal cf1.value + cf2.value, CashFlow.total_value(cash_flows, false)
  end

  def test_month_total_value
    cash_flows = Array.new
    cf1 =CashFlow.find(1)
    cf2 = CashFlow.find(2)
    cash_flows.push(cf1)
    cash_flows.push(cf2)
    assert_equal cf1.value + cf2.value, CashFlow.month_total_value(5, cash_flows, false)
  end

end
