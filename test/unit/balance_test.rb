require File.dirname(__FILE__) + '/../test_helper'

class BalanceTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
    @bank = create_bank
    @bank_account = create_bank_account
    @ledger_category = create_ledger_category
  end

  def test_setup
    assert @organization.valid?
    assert @ledger_category.valid?
  end

  def test_presence_of_bank_account_id
    b = Balance.new
    b.valid?
    assert b.errors.invalid?(:bank_account_id)
    b.bank_account = create_bank_account
    b.valid?
    assert !b.errors.invalid?(:bank_account_id)
  end

  def test_presence_of_date
    b = Balance.new
    b.valid?
    assert b.errors.invalid?(:date)
    b.date = Date.today
    b.valid?
    assert !b.errors.invalid?(:date)
  end

  def test_presence_of_value
    b = Balance.new
    b.value = nil
    b.valid?
    assert b.errors.invalid?(:value)
    b.value = 34
    b.valid?
    assert !b.errors.invalid?(:value)
  end

  def test_value_can_be_integer_or_float
    b = create_balance
    assert b.save

    b.value = 23
    assert b.save
    assert_equal 23, b.value

    b.value = 23.45
    assert b.save
    assert_equal 23.45, b.value
  end

  def test_exist_only_one_balance_per_month
    Balance.destroy_all
    account = create_bank_account
    create_balance(:date => Date.today, :bank_account => account)
    b = Balance.new(:date => Date.today, :bank_account => account)
    b.valid?
    assert b.errors.invalid?(:date)

    b = Balance.new(:date => Date.today+40, :bank_account => account)
    b.valid?
    assert !b.errors.invalid?(:date)
  end

  def test_refresh
    Ledger.destroy_all
    Balance.destroy_all
    account = create_bank_account
    create_ledger(:date => Date.today, :bank_account => account, :value => 23, :status => Status::STATUS_DONE)
    assert_equal 1, Balance.count
    b = Balance.find(:first) 
    assert_equal 23, b.value
    
    create_ledger(:date => Date.today, :bank_account => account, :value => 1.2, :status => Status::STATUS_DONE)
    assert_equal 2, Ledger.count
    assert_equal 1, Balance.count
    b = Balance.find(:first) 
    assert_equal 24.2, b.value
    
    create_ledger(:date => Date.today, :bank_account => account, :value => 1.2, :status => Status::STATUS_PENDING)
    assert_equal 3, Ledger.count
    assert_equal 1, Balance.count
    b = Balance.find(:first) 
    assert_equal 24.2, b.value
    
  end

  def test_display_class
    b = Balance.new
    assert_equal BalanceDisplay, b.display_class
  end

  def test_create_balance
    Balance.destroy_all
    account = create_bank_account
    Balance.create_balance(:bank_account => account)
    assert_equal 1, Balance.count
  end

  def test_last_balance_before_date
    Balance.destroy_all
    account = create_bank_account
    assert_equal nil, Balance.last_balance_before_date(@organization, account, Date.today), "Return nil if there is no Balance create for organization"

    b1 = Balance.create_balance(:bank_account => account, :date => Date.today<<2)
    b2 = Balance.create_balance(:bank_account => account, :date => Date.today<<1)

    assert_equal 2, Balance.count
    assert b2 == Balance.last_balance_before_date(@organization, account, Date.today), "Return b2 because it's the last balance before today"
  end

end
