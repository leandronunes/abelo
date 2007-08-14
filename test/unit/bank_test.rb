require File.dirname(__FILE__) + '/../test_helper'

class BankTest < Test::Unit::TestCase
  fixtures :banks

  def test_mandatory_field_name
    b = Bank.new
    assert !b.valid?
    assert b.errors.invalid?(:name) 
    b.name = "Some name"
    assert b.valid?
    assert !b.errors.invalid?(:name) 
  end

  def test_mandatory_field_code
    b = Bank.new
    assert !b.valid?
    assert b.errors.invalid?(:code) 
    b.code = "0-3323" #some test code
    assert b.valid? 
    assert !b.errors.invalid?(:code)
  end


end
