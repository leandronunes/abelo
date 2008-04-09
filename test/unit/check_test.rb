require File.dirname(__FILE__) + '/../test_helper'

require 'payment_strategy/payment_strategy'
include PaymentStrategy

class CheckTest < Test::Unit::TestCase
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
    m = Check.new
    assert !m.is_money?
  end

  def test_display_class
    m = Check.new
    assert_equal CheckDisplay, m.display_class
  end

  def test_is_check?
    m = Check.new
    assert m.is_check?
  end

  def test_is_debit_card?
    m = Check.new
    assert !m.is_debit_card?
  end

  def test_is_credit_card?
    m = Check.new
    assert !m.is_credit_card?
  end

  def test_is_add_cash?
    m = Check.new
    assert !m.is_add_cash?
  end

  def test_is_remove_cash?
    m = Check.new
    assert !m.is_remove_cash?
  end

  def test_require_category?
    m = Check.new
    assert m.require_category?
  end

  def test_set_as_done_when_save?
    m = Check.new
    assert !m.set_as_done_on_save?
  end

  def test_create_printer_cmd_whithout_fiscal_printer
    l = Ledger.new(:payment_method => Payment::CHECK, :organization => @organization)
    m  = Check.new
    m.create_printer_cmd!(l)
    assert_nil l.printer_command
  end

  def test_create_printer_cmd_whith_fiscal_printer
    Ledger.any_instance.expects(:is_fiscal_operation?).returns(true)
    l = Ledger.new(:payment_method => Payment::CHECK, :owner => @till, :organization => @organization)
    m  = Check.new
    m.create_printer_cmd!(l)
    assert_not_nil l.printer_command
    assert_equal PrinterCommand::ADD_PAYMENT, l.printer_command.cmd
  end

  def test_presence_check_owner_name
    c = Ledger.new(:payment_method => Payment::CHECK)
    c.valid?
    assert c.errors.invalid?(:check_owner_name)
    c.check_owner_name = "Some Name"
    c.valid?
    assert !c.errors.invalid?(:check_owner_name)
  end

  def test_presence_check_bank_id
    c = Ledger.new(:payment_method => Payment::CHECK)
    c.valid?
    assert c.errors.invalid?(:check_bank_id)
    c.check_bank_id = 1
    c.valid?
    assert !c.errors.invalid?(:check_bank_id)
  end

  def test_presence_of_check_account_agency
    c = Ledger.new(:payment_method => Payment::CHECK)
    c.valid?
    assert c.errors.invalid?(:check_account_agency)
    c.check_account_agency = 1232
    c.valid?
    assert !c.errors.invalid?(:check_account_agency)
  end

  def test_presence_of_check_account_number
    c = Ledger.new(:payment_method => Payment::CHECK)
    c.valid?
    assert c.errors.invalid?(:check_account_number)
    c.check_account_number = 3434
    c.valid?
    assert !c.errors.invalid?(:check_account_number)
  end

  def test_presence_of_check_number
    c = Ledger.new(:payment_method => Payment::CHECK)
    c.valid?
    assert c.errors.invalid?(:check_number)
    c.check_number = 3434
    c.valid?
    assert !c.errors.invalid?(:check_number)
  end

#  def test_presence_of_check_cpf
#    c = Ledger.new(:payment_method => Payment::CHECK)
#    c.valid?
#    assert c.errors.invalid?(:check_cpf)
#    c.check_cpf = '051.332.374-05'
#    c.valid?
#    assert !c.errors.invalid?(:check_cpf)
#  end
#
#  def test_presence_of_check_cpf_when_if_not_natural
#    c = Ledger.new(:payment_method => Payment::CHECK)
#    c.person_type = 'juristic'
#    c.valid?
#    assert !c.errors.invalid?(:check_cpf)
#  end
#
#
#  def test_presence_of_check_cnpj_if_not_juristic
#    c = Ledger.new(:payment_method => Payment::CHECK)
#    c.check_cnpj = '26.246.128/0001-23'
#    c.valid?
#    assert !c.errors.invalid?(:check_cnpj)
#  end
#
#  def test_presence_of_check_cnpj_if_juristic
#    c = Ledger.new(:payment_method => Payment::CHECK)
#    c.person_type = PersonType::JURISTIC
#    c.valid?
#    assert c.errors.invalid?(:check_cnpj)
#    c.check_cnpj = '26.246.128/0001-23'
#    c.valid?
#    assert !c.errors.invalid?(:check_cnpj)
#  end
#
#  def test_check_person_type_is_only_natural_or_juristic
#    c = Ledger.new(:payment_method => Payment::CHECK)
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
#  def test_cannot_access_type_person_protected_variable
#    c = Ledger.new(:payment_method => Payment::CHECK)
#    assert_raise(NoMethodError){c.type_person = 'something'}
#  end
#
  def test_precense_of_category
    c = LedgerCategory.new(:name => 'Some category', :organization_id => 1, :type_of => 'I', :payment_methods => ['money'])
    c.save!
    l = Ledger.new(:payment_method => Payment::CHECK)
    l.valid?
    assert l.errors.invalid?(:category_id)
    l.category = c
    l.valid?
    assert !l.errors.invalid?(:category_id)
  end

  should "return the fiscal payment type" do
    l = Ledger.new(:payment_method => Payment::CHECK)
    assert_equal '01', l.fiscal_payment_type
  end


end

