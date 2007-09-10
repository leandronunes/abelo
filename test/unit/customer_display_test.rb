require File.dirname(__FILE__) + '/../test_helper'

class CustomerDisplayTest < Test::Unit::TestCase

  AVAILABLE_FIELDS_TEST = %w[
      name
      address
      description
      email
      category
      cnpj
      cpf
      rg
      birthday
      person_type
  ]
  def test_availavle_fields
    assert_equal AVAILABLE_FIELDS_TEST, CustomerDisplay.available_fields
  end
 
  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, CustomerDisplay.describe(field)
    end
  end

end
