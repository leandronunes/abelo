require File.dirname(__FILE__) + '/../test_helper'

class AddCashTest < Test::Unit::TestCase

  fixtures :bank_accounts

  def setup
    @organization = Organization.find_by_identifier('one')
    @user = User.create!("salt"=>"7e3041ebc2fc05a40c60028e2c4901a81035d3cd", "updated_at"=>nil, "crypted_password"=>"00742970dc9e6319f8019fd54864d3ea740f04b1", "type"=>"User", "remember_token_expires_at"=>nil, "id"=>"1", "administrator"=>false, "remember_token"=>nil, "login"=>"new_user", "email"=>"new_user@example.com", "created_at"=>"2007-07-14 18:03:29")
  end

  def create_till
    till = Till.new(@organization, @user, nil)
    till.save
    till
  end

  def create_add_cash()
    ledger = AddCash.new(create_till)
    ledger.value = 367
    ledger.save
    ledger
  end

  def test_date_is_today
    cash = AddCash.new(create_till)
    cash.date = Date.today - 1
    cash.valid?
    assert cash.errors.invalid?(:date)
    cash.date = Date.today
    cash.valid?
    assert !cash.errors.invalid?(:date)
  end

  def test_type_of_is_income
    cash = AddCash.new(create_till)
    cash.type_of = Payment::TYPE_OF_EXPENSE
    cash.valid?
    assert cash.errors.invalid?(:type_of)
    cash.type_of = Payment::TYPE_OF_INCOME
    cash.valid?
    assert !cash.errors.invalid?(:type_of)
  end

  def test_cannot_destroy
    cash = create_add_cash()
    assert_raise(RuntimeError){ cash.destroy}
  end

end
