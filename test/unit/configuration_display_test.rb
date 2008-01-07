require File.dirname(__FILE__) + '/../test_helper'

class ConfigurationDisplayTest < Test::Unit::TestCase
  AVAILABLE_FIELDS_TEST = %w[
      name
      organization_name
      product_name 
      department_name
      customer_name
      document_name
      fiscal_printer
      worker_displays
      worker_category_displays
      customer_displays
      customer_category_displays
      supplier_displays
      supplier_category_displays
      product_displays
      product_category_displays
      department_displays
      ledger_category_displays
      bank_account_displays
      money_displays
      check_displays
      credit_card_displays
      debit_card_displays
      stock_virtual_displays
      stock_in_displays
      stock_out_displays
      user_displays
      periodicity_displays
      document_displays
  ]


  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, ConfigurationDisplay.describe(field)
    end
  end

  def test_available_fields
    assert_equal AVAILABLE_FIELDS_TEST, ConfigurationDisplay.available_fields
  end

  def test_inlist_available_fields
    assert_not_nil ConfigurationDisplay.inlist_available_fields
  end

  def test_break_lines
    assert_not_nil ConfigurationDisplay.break_lines
  end

  def test_titles
    assert_not_nil ConfigurationDisplay.titles
  end

end
