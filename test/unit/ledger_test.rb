require File.dirname(__FILE__) + '/../test_helper'

class LedgerTest < Test::Unit::TestCase
  fixtures :categories
  fixtures :ledgers

  # Replace this with your real tests.
  def test_precense_of
    l = Ledger.new
   
    assert !l.valid?
    
    assert l.errors.invalid?(:value)
    assert l.errors.invalid?(:category_id)
    assert l.errors.invalid?(:date)
    assert !l.errors.invalid?(:description)
  end
  
  def test_numericality_of
    l = ledgers(:income)
    l.value = 'fff'
    
    assert !l.valid?
    assert l.errors.invalid?(:value)
  end
  
  def test_saldo
    saldo = Ledger.sum_saldo_until_time Time.now
    assert_equal 300.00, saldo
  end
  
  def test_find_all_ordened
    l = Ledger.find_all_ordened
    assert l.first.date > l.last.date
  end
end
