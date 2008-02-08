require File.dirname(__FILE__) + '/../test_helper'

require 'payment_strategy/payment_strategy'
include PaymentStrategy

class AddCashTest < Test::Unit::TestCase

  def setup
    @organization = Organization.find(:first)
    @user = User.find(:first)
  end

  def create_printer(params= {})
    p = Printer.create({:serial => 'test printer', :organization => @organization, :computer_id => 'FF:EE:44:22:GG'}.merge(params))
    p
  end

  def test_setup
    assert @organization.valid?
    assert @user.valid?
  end   

  def create_till(organization = @organization, user = @user, printer = nil)
    till = Till.new(organization, user, printer)
    till.save!
    till
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
    l = Ledger.new(:payment_method => Payment::ADD_CASH)
    m  = AddCash.new
    m.create_printer_cmd!(l)
    assert_nil l.printer_command
  end

  def test_create_printer_cmd_whith_fiscal_printer
    @organization.configuration.fiscal_printer= true
    assert @organization.has_fiscal_printer?
    @till = create_till(@organization, @user, create_printer)
    assert @till.valid?
    l = Ledger.new(:payment_method => Payment::ADD_CASH, :owner => @till)
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

end
