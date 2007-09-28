require File.dirname(__FILE__) + '/../test_helper'

class StockVirtualDisplayTest < Test::Unit::TestCase
  AVAILABLE_FIELDS_TEST = %w[
    product_in_list
    amount_in_list
  ]
  def test_available_fields
    assert_equal AVAILABLE_FIELDS_TEST, StockVirtualDisplay.available_fields
  end
 
  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, StockVirtualDisplay.describe(field)
    end
  end

  def test_presence_of_field_on_available_fields
    m = StockVirtualDisplay.new
    m.field = 'some field'
    m.valid?
    assert m.errors.invalid?(:field)

    m.field = 'product_in_list'
    m.save!
    assert !m.errors.invalid?(:field)
  end


end
