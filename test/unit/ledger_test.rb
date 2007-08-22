require File.dirname(__FILE__) + '/../test_helper'

class LedgerTest < Test::Unit::TestCase

  def test_precense_of_category
    c = LedgerCategory.new(:name => 'Some category', :organization_id => 1, :type_of => 'I')
    c.save!
    l = Ledger.new
    l.valid?
    assert l.errors.invalid?(:category_id)
    l.category = c 
    l.valid?
    assert !l.errors.invalid?(:category_id)
  end

  def test_precense_of_foreseen_date
    l = Ledger.new
    l.valid?
    assert l.errors.invalid?(:foreseen_date)
    assert_raise(RuntimeError){l.foreseen_date = 1}
    l.date = Date.today
    l.valid?
    assert !l.errors.invalid?(:foreseen_date)
  end

  def test_precense_of_effective_date
    l = Ledger.new
    l.valid?
    assert l.errors.invalid?(:effective_date)
    assert_raise(RuntimeError){l.effective_date = 1}
    l.date = Date.today
    l.valid?
    assert !l.errors.invalid?(:effective_date)
  end
  
  def test_precense_of_effective_date_when_is_foreseen
    l = Ledger.new
    l.is_foreseen = true
    l.date =  Date.today
    l.valid?
    assert !l.errors.invalid?(:effective_date)
    assert_raise(RuntimeError){l.effective_date = Date.today}
  end


  def test_precense_of_foressen_value
    l = Ledger.new
    l.valid?
    assert l.errors.invalid?(:foreseen_value)
    assert_raise(RuntimeError){l.foreseen_value = 1}
    l.value = 1
    l.valid?
    assert !l.errors.invalid?(:foreseen_value)
  end

  def test_precense_of_effective_value
    l = Ledger.new
    l.valid?
    assert l.errors.invalid?(:effective_value)
    assert_raise(RuntimeError){l.effective_value = 1}
    l.value = 1
    l.valid?
    assert !l.errors.invalid?(:effective_value)
  end

  def test_precense_of_effective_value_when_is_foreseen
    l = Ledger.new
    l.is_foreseen = true
    l.value = 1
    l.valid?
    assert !l.errors.invalid?(:effective_value)
    assert_raise(RuntimeError){l.effective_value = 1}
  end

  def test_numericality_of_value
    l = Ledger.new
    l.value = 'a'
    l.valid?
    assert l.errors.invalid?(:value)
    l.value = ''
    l.valid?
    assert l.errors.invalid?(:value)
    l.value = 12
    l.valid?
    assert !l.errors.invalid?(:value)
  end

  def test_value_must_be_greater_then_zero
    l = Ledger.new
    l.value = 0.0
    l.valid?
    assert l.errors.invalid?(:value)
    l.value = -1
    l.valid?
    assert l.errors.invalid?(:value)
    l.value = 0.01
    l.valid?
    assert !l.errors.invalid?(:value)
  end

end
