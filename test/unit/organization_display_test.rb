require File.dirname(__FILE__) + '/../test_helper'

class OrganizationDisplayTest < Test::Unit::TestCase

  AVAILABLE_FIELDS_TEST = %w[
      name
      cnpj
      presentation
      country
  ]

  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, OrganizationDisplay.describe(field)
    end
  end

  def test_available_fields
    assert_equal [], OrganizationDisplay.available_fields - AVAILABLE_FIELDS_TEST
    assert_equal [], AVAILABLE_FIELDS_TEST - OrganizationDisplay.available_fields
  end

  def test_inlist_available_fields
    assert_not_nil OrganizationDisplay.inlist_available_fields
  end

  def test_break_lines
    assert_not_nil OrganizationDisplay.break_lines
  end

  def test_titles
    assert_not_nil OrganizationDisplay.titles
  end

end
