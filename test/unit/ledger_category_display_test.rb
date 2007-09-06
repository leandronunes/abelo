require File.dirname(__FILE__) + '/../test_helper'

class LedgerCategoryDisplayTest < Test::Unit::TestCase
  AVAILABLE_FIELDS_TEST = %w[
      name 
      interests
      interests_days
      number_of_parcels
      is_operational
      is_store
      type_of
  ]
  def test_available_fields
    assert_equal AVAILABLE_FIELDS_TEST, LedgerCategoryDisplay.available_fields
  end
 
  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, LedgerCategoryDisplay.describe(field)
    end
  end

end
