require File.dirname(__FILE__) + '/../test_helper'

class DebitCardDisplayTest < Test::Unit::TestCase

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
      bank_account
      status
      schedule_repeat
      schedule_periodicity_id
      schedule_interval
      automatic_debit_owner_name
      automatic_debit_bank_id
      automatic_debit_account_agency
      automatic_debit_account_number
  ]

  def test_available_fields
    assert_equal AVAILABLE_FIELDS_TEST, DebitCardDisplay.available_fields
  end
 
  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, DebitCardDisplay.describe(field)
    end
  end

  def test_presence_of_field_on_available_fields
    m = DebitCardDisplay.new
    m.field = 'some field'
    m.valid?
    assert m.errors.invalid?(:field)

    m.field = 'interests'
    m.valid?
    assert !m.errors.invalid?(:field)
  end

end
