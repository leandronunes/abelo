require File.dirname(__FILE__) + '/../test_helper'

class LedgerCategoryTest < Test::Unit::TestCase
  fixtures :ledger_categories, :bank_accounts

  def setup
    @organization = Organization.find(:first)
    @ledger_category = LedgerCategory.find(:first)
    @bank_account = BankAccount.find(:first)
  end

  def test_setup
    assert @organization.valid?
    assert @ledger_category.valid?
  end

  def test_presence_of_name
    l = LedgerCategory.new
    l.valid?
    assert l.errors.invalid?(:name)
    l.name = 'some name'
    l.valid?
    assert !l.errors.invalid?(:name)
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

  def test_type_of_is_I_or_O
    l = LedgerCategory.new
    l.type_of = 'I'
    l.valid?
    assert !l.errors.invalid?(:type_of)
    l.type_of = 'O'
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
    assert l.income?
  end

  def test_expense?
    l = LedgerCategory.new
    l.type_of= 'O'
    assert l.expense?
  end

  def test_foreseen_value_by_date
    Ledger.delete_all
    l = Ledger.new(:date => Date.today, :value => 10, :category => @ledger_category, :bank_account => @bank_account, :operational => false)
    assert l.save
    
    l = Ledger.new(:date => Date.today, :value => 240.43, :category => @ledger_category, :bank_account => @bank_account, :operational => false)
    assert l.save

    l = Ledger.new(:date => Date.today, :value => 20, :category => @ledger_category, :bank_account => @bank_account, :operational => false, :is_foreseen => true )
    assert l.save

    assert_equal 270.43, @ledger_category.foreseen_value_by_date

  end

end
