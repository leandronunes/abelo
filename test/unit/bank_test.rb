require File.dirname(__FILE__) + '/../test_helper'

class BankTest < Test::Unit::TestCase
  fixtures :banks

  def test_mandatory_field_name
    b = Bank.new
    !b.valid?
    assert b.errors.invalid?(:name) 
    b.name = "Some name"
    b.valid?
    assert !b.errors.invalid?(:name) 
  end

  def test_mandatory_field_code
    b = Bank.new
    !b.valid?
    assert b.errors.invalid?(:code) 
    b.code = "0-3323" #some test code
    b.valid? 
    assert !b.errors.invalid?(:code)
  end

  def test_uniqueness_of_code
    Bank.create!(:name => 'Test', :code => 'some code')

    b = Bank.new(:code => 'some code')
    b.valid?
    assert b.errors.invalid?(:code)

  end


end
