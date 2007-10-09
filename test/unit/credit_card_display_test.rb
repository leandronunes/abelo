require File.dirname(__FILE__) + '/../test_helper'

class CreditCardDisplayTest < Test::Unit::TestCase

  AVAILABLE_FIELDS_TEST = %w[
      type
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
      is_foreseen
      schedule_repeat
      schedule_periodicity_id
      schedule_interval
      credit_card_number
      credit_card_validity
      credit_card_secutiry_code
      credit_card_owner_name
      credit_card_cnpj
      credit_card_cpf
  ]

  def test_available_fields
    assert_equal AVAILABLE_FIELDS_TEST, CreditCardDisplay.available_fields
  end
 
  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, CreditCardDisplay.describe(field)
    end
  end

  def test_presence_of_field_on_available_fields
    m = CreditCardDisplay.new
    m.field = 'some field'
    m.valid?
    assert m.errors.invalid?(:field)

    m.field = 'interests'
    m.save!
    assert !m.errors.invalid?(:field)
  end

end
