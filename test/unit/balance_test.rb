require File.dirname(__FILE__) + '/../test_helper'
require 'payment_strategy/payment_strategy'
include PaymentStrategy

class BalanceTest < Test::Unit::TestCase

  fixtures :configurations

  def setup
    create_place
    @organization = create_organization
    @organization.configuration.fiscal_printer= true
    @user = User.find(:first)
    @till = create_till
  end

  def test_setup
    assert_not_nil @organization.configuration
    assert @till.valid?
    assert @organization.valid?
    assert @organization.has_fiscal_printer?
    assert @user.valid?
  end   

  def test_is_balance?
    m = Balance.new
    assert m.is_balance?
  end

  def test_is_money?
    m = Balance.new
    assert !m.is_money?
  end

  def test_display_class
    m = Balance.new
    assert_equal BalanceDisplay, m.display_class
  end

  def test_is_check?
    m = Balance.new
    assert !m.is_check?
  end

  def test_is_debit_card?
    m = Balance.new
    assert !m.is_debit_card?
  end

  def test_is_credit_card?
    m = Balance.new
    assert !m.is_credit_card?
  end

  def test_is_add_cash?
    m = Balance.new
    assert !m.is_add_cash?
  end

  def test_is_remove_cash?
    m = Balance.new
    assert !m.is_remove_cash?
  end

  def test_require_category?
    m = Balance.new
    assert m.require_category?
  end

  def test_set_as_done_when_save?
    m = Balance.new
    assert m.set_as_done_on_save?
  end

  def test_create_printer_cmd_whithout_fiscal_printer
    l = Ledger.new(:payment_method => Payment::BALANCE)
    m  = Balance.new
    m.create_printer_cmd!(l)
    assert_nil l.printer_command
  end

  def test_create_printer_cmd_whith_fiscal_printer
    l = Ledger.new(:payment_method => Payment::BALANCE, :owner => @till)
    m  = Balance.new
    m.create_printer_cmd!(l)
    assert_not_nil l.printer_command
    assert_equal PrinterCommand::ADD_PAYMENT, l.printer_command.cmd
  end

  def test_initialize_of_balance_objects
    l = Ledger.new(:payment_method => Payment::BALANCE)
    assert_equal Date.today, l.date
    assert_equal Payment::BALANCE, l.payment_method
    assert_equal Status::STATUS_PENDING, l.status
  end

  def test_presence_bank_account
    l = Ledger.new(:payment_method => Payment::BALANCE)
    l.valid?
    assert l.errors.invalid?(:bank_account_id)   
    l.bank_account = create_bank_account
    l.valid?
    assert !l.errors.invalid?(:bank_account_id)
  end

  def test_uniqueness_of_balance_in_a_month
    l = create_ledger(:payment_method => Payment::BALANCE, :date => Date.today)
    assert l.valid?
    l = Ledger.new(:payment_method => Payment::BALANCE, :date => Date.today)
    l.valid?
    assert l.errors.invalid?(:payment_method)
  end

end
