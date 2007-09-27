require File.dirname(__FILE__) + '/../test_helper'

class CheckTest < Test::Unit::TestCase
  fixtures :banks, :ledgers

  def setup
    @check = Check.find(:first)
  end

  def test_setup
    assert @check.valid?
  end

  def test_presence_check_owner_name
    c = Check.new
    c.valid?
    assert c.errors.invalid?(:check_owner_name)
    c.check_owner_name = "Some Name"
    c.valid?
    assert !c.errors.invalid?(:check_owner_name)
  end

  def test_presence_check_bank_id
    c = Check.new
    c.valid?
    assert c.errors.invalid?(:check_bank_id)
    c.check_bank_id = 1
    c.valid?
    assert !c.errors.invalid?(:check_bank_id)
  end

  def test_relation_with_bank
    bank = Bank.create(:name => 'some', :code => '454')
    assert bank.save
    check_id = @check.id

    @check.bank = bank
    assert @check.save
    assert_equal bank, Check.find(check_id).bank
  end

  def test_presence_of_check_account_agency
    c = Check.new
    c.valid?
    assert c.errors.invalid?(:check_account_agency)
    c.check_account_agency = 1232
    c.valid?
    assert !c.errors.invalid?(:check_account_agency)
  end

  def test_presence_of_check_account_number
    c = Check.new
    c.valid?
    assert c.errors.invalid?(:check_account_number)
    c.check_account_number = 3434
    c.valid?
    assert !c.errors.invalid?(:check_account_number)
  end

  def test_presence_of_check_number
    c = Check.new
    c.valid?
    assert c.errors.invalid?(:check_number)
    c.check_number = 3434
    c.valid?
    assert !c.errors.invalid?(:check_number)
  end

  def test_presence_of_check_cpf
    c = Check.new
    c.valid?
    assert c.errors.invalid?(:check_cpf)
    c.check_cpf = '051.332.374-05'
    c.valid?
    assert !c.errors.invalid?(:check_cpf)
  end

  def test_presence_of_check_cpf_when_if_not_natural
    c = Check.new
    c.person_type = 'juristic'
    c.valid?
    assert !c.errors.invalid?(:check_cpf)
  end


  def test_presence_of_check_cnpj_if_not_juristic
    c = Check.new
    c.check_cnpj = '26.246.128/0001-23'
    c.valid?
    assert !c.errors.invalid?(:check_cnpj)
  end

  def test_presence_of_check_cnpj_if_juristic
    c = Check.new
    c.person_type = PersonType::JURISTIC
    c.valid?
    assert c.errors.invalid?(:check_cnpj)
    c.check_cnpj = '26.246.128/0001-23'
    c.valid?
    assert !c.errors.invalid?(:check_cnpj)
  end

  def test_check_person_type_is_only_natural_or_juristic
    c = Check.new
    assert_equal PersonType::NATURAL, c.person_type

    c.person_type= 'natural'
    assert_equal PersonType::NATURAL, c.person_type

    c.person_type= 'juristic'
    assert_equal PersonType::JURISTIC, c.person_type

    c.person_type= 'anything'
    assert_equal PersonType::NATURAL, c.person_type
  end

  def test_cannot_access_type_person_protected_variable
    c = Check.new
    assert_raise(NoMethodError){c.type_person = 'something'}
  end

end
