require File.dirname(__FILE__) + '/../test_helper'

require 'payment_strategy/payment_strategy'
include PaymentStrategy

class RemoveCashTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
    @user = User.find(:first)
    @till = create_till
  end

  def test_setup
    assert @till.valid?
    assert @organization.valid?
    assert @user.valid?
  end   

  def test_is_money?
    m = RemoveCash.new
    assert !m.is_money?
  end

  def test_display_class
    m = RemoveCash.new
    assert_equal MoneyDisplay, m.display_class
  end

  def test_is_check?
    m = RemoveCash.new
    assert !m.is_check?
  end

  def test_is_debit_card?
    m = RemoveCash.new
    assert !m.is_debit_card?
  end

  def test_is_credit_card?
    m = RemoveCash.new
    assert !m.is_credit_card?
  end

  def test_is_add_cash?
    m = RemoveCash.new
    assert !m.is_add_cash?
  end

  def test_is_remove_cash?
    m = RemoveCash.new
    assert m.is_remove_cash?
  end

  def test_require_category?
    m = RemoveCash.new
    assert !m.require_category?
  end

  def test_set_as_done_when_save?
    m = RemoveCash.new
    assert m.set_as_done_on_save?
  end

  def test_create_printer_cmd_whithout_fiscal_printer
    @organization.configuration.fiscal_printer= false
    @organization.configuration.save
 
    assert !@organization.has_fiscal_printer?
    l = Ledger.new(:payment_method => Payment::REMOVE_CASH)
    m  = RemoveCash.new
    m.create_printer_cmd!(l)
    assert_nil l.printer_command
  end

  def test_create_printer_cmd_whith_fiscal_printer
    @organization.configuration.fiscal_printer= true
    @organization.configuration.save
    assert @organization.has_fiscal_printer?
    l = Ledger.new(:payment_method => Payment::REMOVE_CASH, :owner => @till, :organization => @organization)
    m  = RemoveCash.new
    m.create_printer_cmd!(l)
    assert_not_nil l.printer_command
    assert_equal PrinterCommand::TILL_REMOVE_CASH, l.printer_command.cmd
  end

  def test_initialize_remove_cash_with_date_today
    l = Ledger.new(:payment_method => Payment::REMOVE_CASH)
    assert_equal Date.today,l.date
  end

  def test_initialize_remove_cash_with_type_of_expense
    l = Ledger.new(:payment_method => Payment::REMOVE_CASH)
    assert_equal Payment::TYPE_OF_EXPENSE, l.type_of
  end

  def test_initialize_remove_cash_as_pending
    l = Ledger.new(:payment_method => Payment::REMOVE_CASH)
    assert l.pending?
  end

  def test_date_is_today
    cash = Ledger.new(:payment_method => Payment::REMOVE_CASH)
    cash.date = Date.today - 1
    cash.valid?
    assert cash.errors.invalid?(:date)
    cash.date = Date.today
    cash.valid?
    assert !cash.errors.invalid?(:date)
  end

  def test_value_is_minor_then_zero
    cash = Ledger.new(:payment_method => Payment::REMOVE_CASH)
    cash.value =  2
    cash.valid?
    assert_equal -2, cash.value
    cash.value =  -4
    cash.valid?
    assert_equal -4, cash.value
  end

  def test_type_of_is_expense
    cash = Ledger.new(:payment_method => Payment::REMOVE_CASH)
    cash.type_of = Payment::TYPE_OF_INCOME
    cash.valid?
    assert cash.errors.invalid?(:type_of)
    cash.type_of = Payment::TYPE_OF_EXPENSE
    cash.valid?
    assert !cash.errors.invalid?(:type_of)
  end

end
