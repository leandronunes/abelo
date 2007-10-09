require File.dirname(__FILE__) + '/../test_helper'

class CreditCardTest < Test::Unit::TestCase

  fixtures :banks, :ledgers, :ledger_categories

  def setup
    @credit_card = CreditCard.find(:first)
  end

  def test_setup
    assert @credit_card.valid?
  end

  def test_presence_credit_card_owner_name
    c = CreditCard.new
    c.valid?
    assert c.errors.invalid?(:credit_card_owner_name)
    c.credit_card_owner_name = "Some Name"
    c.valid?
    assert !c.errors.invalid?(:credit_card_owner_name)
  end

  def test_presence_of_credit_card_secutiry_code
    c = CreditCard.new
    c.valid?
    assert c.errors.invalid?(:credit_card_secutiry_code)
    c.credit_card_secutiry_code = 1232
    c.valid?
    assert !c.errors.invalid?(:credit_card_secutiry_code)
  end

  def test_presence_of_credit_card_number
    c = CreditCard.new
    c.valid?
    assert c.errors.invalid?(:credit_card_number)
    c.credit_card_number = 3434
    c.valid?
    assert !c.errors.invalid?(:credit_card_number)
  end

  def test_presence_of_credit_card_validity
    c = CreditCard.new
    c.valid?
    assert c.errors.invalid?(:credit_card_validity)
    c.credit_card_validity = Date.today
    c.valid?
    assert !c.errors.invalid?(:credit_card_validity)
  end

  def test_presence_of_credit_card_cpf
    c = CreditCard.new
    c.valid?
    assert c.errors.invalid?(:credit_card_cpf)
    c.credit_card_cpf = '051.332.374-05'
    c.valid?
    assert !c.errors.invalid?(:credit_card_cpf)
  end

  def test_presence_of_credit_card_cpf_when_if_not_natural
    c = CreditCard.new
    c.person_type = 'juristic'
    c.valid?
    assert !c.errors.invalid?(:credit_card_cpf)
  end


  def test_presence_of_credit_card_cnpj_if_not_juristic
    c = CreditCard.new
    c.credit_card_cnpj = '26.246.128/0001-23'
    c.valid?
    assert !c.errors.invalid?(:credit_card_cnpj)
  end

  def test_presence_of_credit_card_cnpj_if_juristic
    c = CreditCard.new
    c.person_type = PersonType::JURISTIC
    c.valid?
    assert c.errors.invalid?(:credit_card_cnpj)
    c.credit_card_cnpj = '26.246.128/0001-23'
    c.valid?
    assert !c.errors.invalid?(:credit_card_cnpj)
  end

  def test_credit_card_person_type_is_only_natural_or_juristic
    c = CreditCard.new
    assert_equal PersonType::NATURAL, c.person_type

    c.person_type= 'natural'
    assert_equal PersonType::NATURAL, c.person_type

    c.person_type= 'juristic'
    assert_equal PersonType::JURISTIC, c.person_type

    c.person_type= 'anything'
    assert_equal PersonType::NATURAL, c.person_type
  end

  def test_cannot_access_type_person_protected_variable
    c = CreditCard.new
    assert_raise(NoMethodError){c.type_person = 'something'}
  end

  def test_presence_of_category
    c = LedgerCategory.new(:name => 'Some category', :organization_id => 1, :type_of => 'I', :payment_methods => ['money'])
    c.save!
    l = CreditCard.new
    l.valid?
    assert l.errors.invalid?(:category_id)
    l.category = c
    l.valid?
    assert !l.errors.invalid?(:category_id)
  end


end
