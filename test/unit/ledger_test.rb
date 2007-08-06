require File.dirname(__FILE__) + '/../test_helper'

class LedgerTest < Test::Unit::TestCase

  def test_precense_of_owner
    o = Organization.new(:name => 'Some category', :cnpj =>'14.574.763/0001-50')
    o.save
    l = Ledger.new
    l.valid?
    assert l.errors.invalid?(:owner)
    l.owner = o
    l.valid?
    assert !l.errors.invalid?(:owner)
  end

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

  def test_precense_of_date
    l = Ledger.new
    l.valid?
    assert l.errors.invalid?(:date)
    l.date = Time.now
    l.valid?
    assert !l.errors.invalid?(:date)
  end

  def test_precense_of_value
    l = Ledger.new
    l.valid?
    assert l.errors.invalid?(:value)
    l.value = 1
    l.valid?
    assert !l.errors.invalid?(:value)
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
