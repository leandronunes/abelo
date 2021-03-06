require File.dirname(__FILE__) + '/../test_helper'

require 'payment_strategy/payment_strategy'
include PaymentStrategy

class DebitCardTest < Test::Unit::TestCase

  fixtures :banks, :ledgers, :ledger_categories

  def setup
    create_place
    @organization = create_organization
    @user = create_user
    @till = create_till
  end

  def test_setup
    assert @till.valid?
    assert @organization.valid?
    assert @user.valid?
  end   

  def test_is_money?
    m = DebitCard.new
    assert !m.is_money?
  end

  def test_display_class
    m = DebitCard.new
    assert_equal DebitCardDisplay, m.display_class
  end

  def test_is_check?
    m = DebitCard.new
    assert !m.is_check?
  end

  def test_is_debit_card?
    m = DebitCard.new
    assert m.is_debit_card?
  end

  def test_is_credit_card?
    m = DebitCard.new
    assert !m.is_credit_card?
  end

  def test_is_add_cash?
    m = DebitCard.new
    assert !m.is_add_cash?
  end

  def test_is_remove_cash?
    m = DebitCard.new
    assert !m.is_remove_cash?
  end

  def test_require_category?
    m = DebitCard.new
    assert m.require_category?
  end

  def test_set_as_done_when_save?
    m = DebitCard.new
    assert !m.set_as_done_on_save?
  end

  def test_create_printer_cmd_whithout_fiscal_printer
    l = Ledger.new(:payment_method => Payment::DEBIT_CARD, :organization => @organization)
    m  = DebitCard.new
    m.create_printer_cmd!(l)
    assert_nil l.printer_command
  end

  def test_create_printer_cmd_whith_fiscal_printer
    Ledger.any_instance.expects(:is_fiscal_operation?).returns(true)
    l = Ledger.new(:payment_method => Payment::DEBIT_CARD, :owner => @till, :organization => @organization)
    m  = DebitCard.new
    m.create_printer_cmd!(l)
    assert_not_nil l.printer_command
    assert_equal PrinterCommand::ADD_PAYMENT, l.printer_command.cmd
  end

  def test_presence_automatic_debit_owner_name
    c = Ledger.new(:payment_method => Payment::DEBIT_CARD)
    c.valid?
    assert c.errors.invalid?(:automatic_debit_owner_name)
    c.automatic_debit_owner_name = "Some Name"
    c.valid?
    assert !c.errors.invalid?(:automatic_debit_owner_name)
  end

  def test_presence_automatic_debit_bank_id
    c = Ledger.new(:payment_method => Payment::DEBIT_CARD)
    c.valid?
    assert c.errors.invalid?(:automatic_debit_bank_id)
    c.automatic_debit_bank_id = 1
    c.valid?
    assert !c.errors.invalid?(:automatic_debit_bank_id)
  end

  def test_presence_of_automatic_debit_account_agency
    c = Ledger.new(:payment_method => Payment::DEBIT_CARD)
    c.valid?
    assert c.errors.invalid?(:automatic_debit_account_agency)
    c.automatic_debit_account_agency = 1232
    c.valid?
    assert !c.errors.invalid?(:automatic_debit_account_agency)
  end

  def test_presence_of_automatic_debit_account_number
    c = Ledger.new(:payment_method => Payment::DEBIT_CARD)
    c.valid?
    assert c.errors.invalid?(:automatic_debit_account_number)
    c.automatic_debit_account_number = 3434
    c.valid?
    assert !c.errors.invalid?(:automatic_debit_account_number)
  end

  should "return the fiscal payment type" do
    l = Ledger.new(:payment_method => Payment::DEBIT_CARD)
    assert_equal '03', l.fiscal_payment_type
  end

end
