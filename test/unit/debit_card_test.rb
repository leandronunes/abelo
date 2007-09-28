require File.dirname(__FILE__) + '/../test_helper'

class DebitCardTest < Test::Unit::TestCase

  fixtures :banks, :ledgers, :ledger_categories

  def setup
    @automatic_debit = DebitCard.find(:first)
  end

  def test_setup
    assert @automatic_debit.valid?
  end

  def test_presence_automatic_debit_owner_name
    c = DebitCard.new
    c.valid?
    assert c.errors.invalid?(:automatic_debit_owner_name)
    c.automatic_debit_owner_name = "Some Name"
    c.valid?
    assert !c.errors.invalid?(:automatic_debit_owner_name)
  end

  def test_presence_automatic_debit_bank_id
    c = DebitCard.new
    c.valid?
    assert c.errors.invalid?(:automatic_debit_bank_id)
    c.automatic_debit_bank_id = 1
    c.valid?
    assert !c.errors.invalid?(:automatic_debit_bank_id)
  end

  def test_relation_with_bank
    bank = Bank.create(:name => 'some', :code => '454')
    assert bank.save
    automatic_debit_id = @automatic_debit.id

    @automatic_debit.bank = bank
    assert @automatic_debit.save
    assert_equal bank, DebitCard.find(automatic_debit_id).bank
  end

  def test_presence_of_automatic_debit_account_agency
    c = DebitCard.new
    c.valid?
    assert c.errors.invalid?(:automatic_debit_account_agency)
    c.automatic_debit_account_agency = 1232
    c.valid?
    assert !c.errors.invalid?(:automatic_debit_account_agency)
  end

  def test_presence_of_automatic_debit_account_number
    c = DebitCard.new
    c.valid?
    assert c.errors.invalid?(:automatic_debit_account_number)
    c.automatic_debit_account_number = 3434
    c.valid?
    assert !c.errors.invalid?(:automatic_debit_account_number)
  end

end
