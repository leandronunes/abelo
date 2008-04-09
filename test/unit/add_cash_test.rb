require File.dirname(__FILE__) + '/../test_helper'

require 'payment_strategy/payment_strategy'
include PaymentStrategy

class AddCashTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
    @user = User.find(:first)
  end

  def test_setup
    assert @organization.valid?
    assert @user.valid?
  end   

  def test_is_money?
    m = AddCash.new
    assert !m.is_money?
  end

  def test_display_class
    m = AddCash.new
    assert_equal MoneyDisplay, m.display_class
  end

  def test_is_check?
    m = AddCash.new
    assert !m.is_check?
  end

  def test_is_debit_card?
    m = AddCash.new
    assert !m.is_debit_card?
  end

  def test_is_credit_card?
    m = AddCash.new
    assert !m.is_credit_card?
  end

  def test_is_add_cash?
    m = AddCash.new
    assert m.is_add_cash?
  end

  def test_is_remove_cash?
    m = AddCash.new
    assert !m.is_remove_cash?
  end

  def test_require_category?
    m = AddCash.new
    assert !m.require_category?
  end

  def test_set_as_done_when_save?
    m = AddCash.new
    assert m.set_as_done_on_save?
  end

  def test_create_printer_cmd_whithout_fiscal_printer
    @organization.configuration.fiscal_printer= false
    assert !@organization.has_fiscal_printer?

    l = Ledger.new(:payment_method => Payment::ADD_CASH)
    a  = AddCash.new
    a.create_printer_cmd!(l)
    assert_nil l.printer_command
  end

  def test_create_printer_cmd_whith_fiscal_printer
    @organization.configuration.fiscal_printer= true
    assert @organization.has_fiscal_printer?
    till = create_till
    l = Ledger.new(:payment_method => Payment::ADD_CASH, :owner => till, :organization => @organization)
    assert l.has_fiscal_printer?
    m  = AddCash.new
    m.create_printer_cmd!(l)
    assert_not_nil l.printer_command
    assert_equal PrinterCommand::TILL_ADD_CASH, l.printer_command.cmd
  end

  def test_initialize_remove_cash_with_date_today
    l = Ledger.new(:payment_method => Payment::ADD_CASH)
    assert_equal Date.today,l.date
  end

  def test_initialize_add_cash_with_type_of_income
    l = Ledger.new(:payment_method => Payment::ADD_CASH)
    assert_equal Payment::TYPE_OF_INCOME, l.type_of
  end

  def test_initialize_remove_cash_as_pending
    l = Ledger.new(:payment_method => Payment::ADD_CASH)
    assert l.pending?
  end

  def test_date_is_today
    cash = Ledger.new(:payment_method => Payment::ADD_CASH)
    cash.date = Date.today - 1
    cash.valid?
    assert cash.errors.invalid?(:date)
    cash.date = Date.today
    cash.valid?
    assert !cash.errors.invalid?(:date)
  end

  def test_type_of_is_income
    cash = Ledger.new(:payment_method => Payment::ADD_CASH)
    cash.type_of = Payment::TYPE_OF_EXPENSE
    cash.valid?
    assert cash.errors.invalid?(:type_of)
    cash.type_of = Payment::TYPE_OF_INCOME
    cash.valid?
    assert !cash.errors.invalid?(:type_of)
  end

  def test_cannot_schedule_add_cash
    cash = Ledger.new(:payment_method => Payment::ADD_CASH)
    cash.valid?
    assert !cash.errors.invalid?(:date)
    cash.date = Date.today + 2
    cash.valid?
    assert cash.errors.invalid?(:date)
  end

  def test_needs_printer_command
    cash = Ledger.new(:payment_method => Payment::ADD_CASH)
    assert cash.needs_fiscal_command
  end

  should "return the fiscal payment type" do
    l = Ledger.new(:payment_method => Payment::ADD_CASH)
    assert_equal '00', l.fiscal_payment_type
  end


end
