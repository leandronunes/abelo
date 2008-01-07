require File.dirname(__FILE__) + '/../test_helper'

class LedgerCategoryTest < Test::Unit::TestCase
  fixtures :ledger_categories, :bank_accounts

  include Status

  def setup
    @organization = Organization.find(:first)
    @ledger_category = LedgerCategory.find(:first)
    @bank_account = BankAccount.find(:first)
  end

  def create_money(params = {})
    m = Money.new({:date => Date.today, :value => 10, :category => @ledger_category, 
        :bank_account => @bank_account, :operational => false, :owner => @organization, 
        :payment_method => 'money'}.merge(params))
    m.save
    m
  end

  def test_setup
    assert @organization.valid?
    assert @ledger_category.valid?
    assert @bank_account.valid?
  end

  def test_presence_of_name
    l = LedgerCategory.new
    l.valid?
    assert l.errors.invalid?(:name)
    l.name = 'some name'
    l.valid?
    assert !l.errors.invalid?(:name)
  end

  def test_presence_of_payment_method
    l = LedgerCategory.new
    l.valid?
    assert l.errors.invalid?(:payment_methods)
    l.payment_methods = ['money']
    l.valid?
    assert !l.errors.invalid?(:payment_methods)
  end

  def test_inclusion_of_payment_method_on_defined_payment_methods
    l = LedgerCategory.new
    l.valid?
    assert l.errors.invalid?(:payment_methods)
    l.payment_methods = ['wrong']
    l.valid?
    assert l.errors.invalid?(:payment_methods)
  end


  def test_presence_uniqueness_of_name
    l = LedgerCategory.new
    l.name = @ledger_category.name
    l.valid?
    assert l.errors.invalid?(:name)
    l.name = 'Another name'
    l.valid?
    assert !l.errors.invalid?(:name)
  end

  def test_presence_of_type_of
    l = LedgerCategory.new
    l.valid?
    assert l.errors.invalid?(:type_of)
    l.type_of = 'I'
    l.valid?
    assert !l.errors.invalid?(:type_of)
  end

  def test_type_of_is_I_or_E
    l = LedgerCategory.new
    l.type_of = 'I'
    l.valid?
    assert !l.errors.invalid?(:type_of)
    l.type_of = 'E'
    l.valid?
    assert !l.errors.invalid?(:type_of)
    l.type_of = 'P'
    l.valid?
    assert l.errors.invalid?(:type_of)
  end

  def test_presence_of_organization_id
    l = LedgerCategory.new
    l.valid?
    assert l.errors.invalid?(:organization_id)
    l.organization = @organization
    l.valid?
    assert !l.errors.invalid?(:organization_id)
  end

  def test_income?
    l = LedgerCategory.new
    l.type_of= 'I'
    assert Payment.income?(l.type_of)
  end

  def test_expense?
    l = LedgerCategory.new
    l.type_of= 'E'
    assert Payment.expense?(l.type_of)
  end

  def test_foreseen_value_by_date
    Ledger.delete_all
    l = Money.new(:date => Date.today, :value => 10, :category => @ledger_category, 
        :bank_account => @bank_account, :operational => false, :owner => @organization, :payment_method => 'money')
    l.save!
    
    l = Money.new(:date => Date.today, :value => 240.43, :category => @ledger_category, 
        :bank_account => @bank_account, :operational => false, :owner => @organization, :payment_method => 'money')
    l.save!

    l = Money.new(:date => Date.today, :value => 20, :category => @ledger_category, 
        :bank_account => @bank_account, :operational => false, :owner => @organization, :payment_method => 'money')
    l.save!

    assert_equal 270.43, @ledger_category.foreseen_value_by_date

  end


  def test_effective_value_by_date
    Ledger.delete_all
    v1 = 10
    l = create_money(:value => v1, :status => STATUS_DONE)
    v2 = 240.43
    l = create_money(:value => v2, :status => STATUS_DONE)
    v3 = 34
    l = create_money(:value => v3, :status => STATUS_DONE)
    assert_equal v1+v2+v3, @ledger_category.effective_value_by_date

  end

  def test_name_with_sign_plus
    l = LedgerCategory.new(:type_of => 'I')
    assert l.name_with_sign.match('.*\+.*')
  end

  def test_name_with_sign_minus
    l = LedgerCategory.new(:type_of => 'O')
    assert l.name_with_sign.match('.*\-.*')
  end

  def test_count_ledgers
    Ledger.delete_all
    l = Money.new(:date => Date.today, :value => 10, :category => @ledger_category, 
        :bank_account => @bank_account, :operational => false, :owner => @organization, :payment_method => 'money')
    l.save!
    
    l = Money.new(:date => Date.today, :value => 240.43, :category => @ledger_category, 
        :bank_account => @bank_account, :operational => false, :owner => @organization, :payment_method => 'money')
    l.save!

    assert_equal 2, @ledger_category.count_ledgers

  end

end
