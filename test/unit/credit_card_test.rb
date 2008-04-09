require File.dirname(__FILE__) + '/../test_helper'

require 'payment_strategy/payment_strategy'
include PaymentStrategy

class CreditCardTest < Test::Unit::TestCase

  fixtures :banks, :ledgers, :ledger_categories

  def setup
    create_place
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
    m = CreditCard.new
    assert !m.is_money?
  end

  def test_display_class
    m = CreditCard.new
    assert_equal CreditCardDisplay, m.display_class
  end

  def test_is_check?
    m = CreditCard.new
    assert !m.is_check?
  end

  def test_is_debit_card?
    m = CreditCard.new
    assert !m.is_debit_card?
  end

  def test_is_credit_card?
    m = CreditCard.new
    assert m.is_credit_card?
  end

  def test_is_add_cash?
    m = CreditCard.new
    assert !m.is_add_cash?
  end

  def test_is_remove_cash?
    m = CreditCard.new
    assert !m.is_remove_cash?
  end

  def test_require_category?
    m = CreditCard.new
    assert m.require_category?
  end

  def test_set_as_done_when_save?
    m = CreditCard.new
    assert !m.set_as_done_on_save?
  end

  def test_create_printer_cmd_whithout_fiscal_printer
    l = Ledger.new(:payment_method => Payment::CREDIT_CARD, :organization => @organization)
    m  = CreditCard.new
    m.create_printer_cmd!(l)
    assert_nil l.printer_command
  end

  def test_create_printer_cmd_whith_fiscal_printer
    Ledger.any_instance.expects(:is_fiscal_operation?).returns(true)
    l = Ledger.new(:payment_method => Payment::CREDIT_CARD, :owner => @till, :organization => @organization)
    m  = CreditCard.new
    m.create_printer_cmd!(l)
    assert_not_nil l.printer_command
    assert_equal PrinterCommand::ADD_PAYMENT, l.printer_command.cmd
  end


  def test_presence_credit_card_owner_name
    c = Ledger.new(:payment_method => Payment::CREDIT_CARD)
    c.valid?
    assert c.errors.invalid?(:credit_card_owner_name)
    c.credit_card_owner_name = "Some Name"
    c.valid?
    assert !c.errors.invalid?(:credit_card_owner_name)
  end

  def test_presence_of_credit_card_secutiry_code
    c = Ledger.new(:payment_method => Payment::CREDIT_CARD)
    c.valid?
    assert c.errors.invalid?(:credit_card_secutiry_code)
    c.credit_card_secutiry_code = 1232
    c.valid?
    assert !c.errors.invalid?(:credit_card_secutiry_code)
  end

  def test_presence_of_credit_card_number
    c = Ledger.new(:payment_method => Payment::CREDIT_CARD)
    c.valid?
    assert c.errors.invalid?(:credit_card_number)
    c.credit_card_number = 3434
    c.valid?
    assert !c.errors.invalid?(:credit_card_number)
  end

  def test_presence_of_credit_card_validity
    c = Ledger.new(:payment_method => Payment::CREDIT_CARD)
    c.valid?
    assert c.errors.invalid?(:credit_card_validity)
    c.credit_card_validity = Date.today
    c.valid?
    assert !c.errors.invalid?(:credit_card_validity)
  end

#  def test_presence_of_credit_card_cpf
#    c = Ledger.new(:payment_method => Payment::CREDIT_CARD)
#    c.valid?
#    assert c.errors.invalid?(:credit_card_cpf)
#    c.credit_card_cpf = '051.332.374-05'
#    c.valid?
#    assert !c.errors.invalid?(:credit_card_cpf)
#  end
#
#  def test_presence_of_credit_card_cpf_when_if_not_natural
#    c = Ledger.new(:payment_method => Payment::CREDIT_CARD)
#    c.person_type = 'juristic'
#    c.valid?
#    assert !c.errors.invalid?(:credit_card_cpf)
#  end
#
#
#  def test_presence_of_credit_card_cnpj_if_not_juristic
#    c = Ledger.new(:payment_method => Payment::CREDIT_CARD)
#    c.credit_card_cnpj = '26.246.128/0001-23'
#    c.valid?
#    assert !c.errors.invalid?(:credit_card_cnpj)
#  end
#
#  def test_presence_of_credit_card_cnpj_if_juristic
#    c = Ledger.new(:payment_method => Payment::CREDIT_CARD)
#    c.person_type = PersonType::JURISTIC
#    c.valid?
#    assert c.errors.invalid?(:credit_card_cnpj)
#    c.credit_card_cnpj = '26.246.128/0001-23'
#    c.valid?
#    assert !c.errors.invalid?(:credit_card_cnpj)
#  end
#
#  def test_credit_card_person_type_is_only_natural_or_juristic
#    c = Ledger.new(:payment_method => Payment::CREDIT_CARD)
#    assert_equal PersonType::NATURAL, c.person_type
#
#    c.person_type= 'natural'
#    assert_equal PersonType::NATURAL, c.person_type
#
#    c.person_type= 'juristic'
#    assert_equal PersonType::JURISTIC, c.person_type
#
#    c.person_type= 'anything'
#    assert_equal PersonType::NATURAL, c.person_type
#  end
#
  def test_cannot_access_type_person_protected_variable
    c = CreditCard.new
    assert_raise(NoMethodError){c.type_person = 'something'}
  end

  def test_presence_of_category
    c = LedgerCategory.new(:name => 'Some category', :organization_id => 1, :type_of => 'I', :payment_methods => ['money'])
    c.save!
    l = Ledger.new(:payment_method => Payment::CREDIT_CARD)
    l.valid?
    assert l.errors.invalid?(:category_id)
    l.category = c
    l.valid?
    assert !l.errors.invalid?(:category_id)
  end

  should "return the fiscal payment type" do
    l = Ledger.new(:payment_method => Payment::CREDIT_CARD)
    assert_equal '02', l.fiscal_payment_type
  end

end

