require File.dirname(__FILE__) + '/../test_helper'

class SupplierDisplayTest < Test::Unit::TestCase

  AVAILABLE_FIELDS_TEST = %w[
      name
      address
      description
      email
      category_id
      cnpj
      cpf
      rg
      birthday
  ]
  def test_availavle_fields
    assert_equal AVAILABLE_FIELDS_TEST, WorkerDisplay.available_fields
  end

  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, WorkerDisplay.describe(field)
    end
  end


end
