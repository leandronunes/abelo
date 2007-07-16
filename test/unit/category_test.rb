require File.dirname(__FILE__) + '/../test_helper'

class CategoryTest < Test::Unit::TestCase
  fixtures :categories


  def test_income
    assert categories(:income).income?
    assert !categories(:income).expense?
  end
  
  def test_expense
    assert categories(:expense).expense?
    assert !categories(:expense).income?
  end
  
  def test_precense_of
    c = Category.new
    assert !c.valid?
    assert c.errors.invalid?(:name)
    assert c.errors.invalid?(:type_of)
  end
  
  def test_incluson_of
    c = Category.new(:name => 'incluson_of', :type_of => 'X')
    assert !c.valid?
    assert c.errors.invalid?(:type_of)
    
    c.type_of = 'I'
    assert c.valid?
  end
  
  def test_uniq
    c = Category.new(:name => categories(:income).name, :type_of => categories(:income).type_of)
    assert !c.valid?
    assert c.errors.invalid?(:name)
  end
  
  def test_size
    c = Category.new(:name => '1234567890123456', :type_of => categories(:income).type_of)
    assert !c.valid?
    assert_equal "is too long (maximum is 15 characters)", c.errors.on(:name)
  end
  
  def test_find_all_ordened
    c = Category.find_all_ordened
    assert !(c.nil? || c.empty?)
    assert c.first.income?, "first is not 'income'"
    assert c.last.expense?, "last is not 'expense'"
  end
end
