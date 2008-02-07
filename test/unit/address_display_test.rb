require File.dirname(__FILE__) + '/../test_helper'

class AddressDisplayTest < Test::Unit::TestCase

  AVAILABLE_FIELDS_TEST = %w[
      city
      state
      country
      street
      number
      complement
      district
      zip_code
  ]
  def test_available_fields
    assert_equal AVAILABLE_FIELDS_TEST, AddressDisplay.available_fields
  end

  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, AddressDisplay.describe(field)
    end
  end

end
