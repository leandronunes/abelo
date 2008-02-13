require File.dirname(__FILE__) + '/../test_helper'
require 'payment_strategy/payment_strategy'
include PaymentStrategy

class MoneyTest < Test::Unit::TestCase

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

  def test_is_money?
    m = Money.new
    assert m.is_money?
  end

  def test_display_class
    m = Money.new
    assert_equal MoneyDisplay, m.display_class
  end

  def test_is_check?
    m = Money.new
    assert !m.is_check?
  end

  def test_is_debit_card?
    m = Money.new
    assert !m.is_debit_card?
  end

  def test_is_credit_card?
    m = Money.new
    assert !m.is_credit_card?
  end

  def test_is_add_cash?
    m = Money.new
    assert !m.is_add_cash?
  end

  def test_is_remove_cash?
    m = Money.new
    assert !m.is_remove_cash?
  end

  def test_require_category?
    m = Money.new
    assert m.require_category?
  end

  def test_set_as_done_when_save?
    m = Money.new
    assert !m.set_as_done_on_save?
  end

  def test_create_printer_cmd_whithout_fiscal_printer
    l = Ledger.new(:payment_method => Payment::MONEY)
    m  = Money.new
    m.create_printer_cmd!(l)
    assert_nil l.printer_command
  end

  def test_create_printer_cmd_whith_fiscal_printer
    l = Ledger.new(:payment_method => Payment::MONEY, :owner => @till)
    m  = Money.new
    m.create_printer_cmd!(l)
    assert_not_nil l.printer_command
    assert_equal PrinterCommand::ADD_PAYMENT, l.printer_command.cmd
  end

end
