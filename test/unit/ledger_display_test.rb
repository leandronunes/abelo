require File.dirname(__FILE__) + '/../test_helper'

class LedgerDisplayTest < Test::Unit::TestCase
  AVAILABLE_FIELDS_TEST = %w[
      category_id   
      payment_method
      value
      description
      tag_list
      date
      interests
      interests_days
      number_of_parcels
      parcel_number
      operational
      bank_account_id
      status
      schedule_repeat
      schedule_periodicity_id
      schedule_interval
  ]
  def test_available_fields
    assert_equal AVAILABLE_FIELDS_TEST, LedgerDisplay.available_fields
  end
 
  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, LedgerDisplay.describe(field)
    end
  end

end
