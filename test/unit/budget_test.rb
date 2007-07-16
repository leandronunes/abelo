require File.dirname(__FILE__) + '/../test_helper'

class BudgetTest < Test::Unit::TestCase
  fixtures :categories
  fixtures :budgets

  
  def test_precense_of
    b = Budget.new
    assert !b.valid?
    assert b.errors.invalid?(:value)
    assert b.errors.invalid?(:category_id)
  end
  
  def test_numericality_of
    b = Budget.new(:value => 'fff', :category_id => 3)
    assert !b.valid?
    assert b.errors.invalid?(:value)
  end
  
  def test_value
    b = Budget.new(:category_id => 3)   
    assert !b.valid?
    assert b.errors.invalid?(:value)
    
    b.value = 0
    assert !b.valid?
    assert b.errors.invalid?(:value)
    
    b.value = 1
    assert b.valid?, b.errors.full_messages
  end
  
  def test_find_all_ordened
    b = Budget.find_all_ordened
    assert b.first.category.income?
    assert b.last.category.expense?
  end
end
