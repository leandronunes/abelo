require File.dirname(__FILE__) + '/../test_helper'

class WorkerDisplayTest < Test::Unit::TestCase

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
      actor_type
      info
  ]
  def test_available_fields
    assert_equal AVAILABLE_FIELDS_TEST, WorkerDisplay.available_fields
  end

  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, WorkerDisplay.describe(field)
    end
  end

  def test_presence_of_field_on_available_fields
    w = WorkerDisplay.new
    w.field = 'some field'
    w.valid?
    assert w.errors.invalid?(:field)

    w.field = 'name'
    w.valid?
    assert !w.errors.invalid?(:field)    
  end

end
