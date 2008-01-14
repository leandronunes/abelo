require File.dirname(__FILE__) + '/../test_helper'

class CheckDisplayTest < Test::Unit::TestCase

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
      check_owner_name
      check_bank_id
      check_account_agency
      check_account_number
      check_number
      check_cpf
      check_cnpj
  ]

  def test_available_fields
    assert_equal AVAILABLE_FIELDS_TEST, CheckDisplay.available_fields
  end
 
  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, CheckDisplay.describe(field)
    end
  end

  def test_presence_of_field_on_available_fields
    m = CheckDisplay.new
    m.field = 'some field'
    m.valid?
    assert m.errors.invalid?(:field)

    m.field = 'interests'
    m.valid?
    assert !m.errors.invalid?(:field)
  end


end
