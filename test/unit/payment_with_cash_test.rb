require File.dirname(__FILE__) + '/../test_helper'

class PaymentWithCashTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
    @user = User.create!("salt"=>"7e3041ebc2fc05a40c60028e2c4901a81035d3cd", "updated_at"=>nil, "crypted_password"=>"00742970dc9e6319f8019fd54864d3ea740f04b1", "type"=>"User", "remember_token_expires_at"=>nil, "id"=>"1", "administrator"=>nil, "remember_token"=>nil, "login"=>"new_user", "email"=>"new_user@example.com", "created_at"=>"2007-07-14 18:03:29")
    @sale = Sale.create(:date => '2007-08-04', :organization_id => @org.id, :user_id => @user.id)
  end
  
  def test_mandatory_field_cash
    pay = PaymentWithCash.create(:sale_id => @sale.id, :value => 50.00, :date => '2007-08-04', :received => true)
    assert pay.errors.invalid?(:cash)
  end

  def test_cash_and_change
    pay = PaymentWithCash.create(:sale_id => @sale.id, :value => 50.00, :date => '2007-08-04', :received => true, :cash => 60.00)
    assert_in_delta 10.00, pay.change, 0.01
  end

  def test_cash_and_change_none
    pay = PaymentWithCash.create(:sale_id => @sale.id, :value => 50.00, :date => '2007-08-04', :received => true, :cash => 50.00)
    assert_in_delta 0.00, pay.change, 0.01
  end

end
