require File.dirname(__FILE__) + '/../test_helper'

class MoneyTest < Test::Unit::TestCase

  def test_precense_of_category
    c = LedgerCategory.new(:name => 'Some category', :organization_id => 1, :type_of => 'I', :payment_methods => ['money'])
    c.save!
    l = Money.new
    l.valid?
    assert l.errors.invalid?(:category_id)
    l.category = c 
    l.valid? 
    assert !l.errors.invalid?(:category_id)
  end

  def test_cannot_destroy_a_sale_ledger
    
  end

end
