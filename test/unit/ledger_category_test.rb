require File.dirname(__FILE__) + '/../test_helper'

class LedgerCategoryTest < Test::Unit::TestCase

  include Status

  def setup
    @organization = create_organization
    @ledger_category = create_ledger_category(:organization => @organization)
    @bank = create_bank
    @bank_account = create_bank_account(:organization => @organization)
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

  def test__uniqueness_of_name
    l = LedgerCategory.new(:organization => @organization)
    l.name = @ledger_category.name
    l.valid?
    assert l.errors.invalid?(:name)
    l.name = 'Another name'
    l.valid?
    assert !l.errors.invalid?(:name)
  end

  def test__uniqueness_of_name_and_organization_scope
    organization = create_organization(:identifier => 'some_org', :cnpj => '67.186.636/0001-40', :name => 'Some Org')
    l = LedgerCategory.new(:organization => organization )
    l.name = @ledger_category.name
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
    create_money(:date => Date.today, :value => 10)
    create_money(:date => Date.today, :value => 240.43)
     create_money(:date => Date.today, :value => 20)
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
    create_money
    create_money

    assert_equal 2, @ledger_category.count_ledgers

  end

  def test_sale_operations_are_type_of_income
    l = LedgerCategory.new
    l.type_of = Payment::TYPE_OF_EXPENSE
    l.is_sale = true
    l.valid?
    assert l.errors.invalid?(:is_sale), "You cannot have sale payment category with type of expense"

    l.type_of = Payment::TYPE_OF_INCOME
    l.is_sale
    l.valid?
    assert !l.errors.invalid?(:is_sale)
  end

  def test_stock_operations_are_type_of_expense
    l = LedgerCategory.new
    l.type_of = Payment::TYPE_OF_INCOME
    l.is_stock = true
    l.valid?
    assert l.errors.invalid?(:is_stock), "You cannot have stock payment category with type of income"

    l.type_of = Payment::TYPE_OF_EXPENSE
    l.is_sale
    l.valid?
    assert !l.errors.invalid?(:is_stock)
  end

  def test_when_is_stock_is_not_sale
    l = LedgerCategory.new
    l.type_of = Payment::TYPE_OF_EXPENSE
    l.is_stock = true
    l.is_sale = true
    l.valid?
    assert l.errors.invalid?(:is_stock), "You cannot have stock and sale payment category at the same time"
  end

  def test_type_of_income
    l = LedgerCategory.new
    l.type_of = Payment::TYPE_OF_INCOME
    assert l.income?
  end

  def test_type_of_expense
    l = LedgerCategory.new
    l.type_of = Payment::TYPE_OF_EXPENSE
    assert l.expense?
  end


end
