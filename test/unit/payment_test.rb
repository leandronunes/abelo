require File.dirname(__FILE__) + '/../test_helper'

class PaymentTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
    @user = User.create!("salt"=>"7e3041ebc2fc05a40c60028e2c4901a81035d3cd", "updated_at"=>nil, "crypted_password"=>"00742970dc9e6319f8019fd54864d3ea740f04b1", "type"=>"User", "remember_token_expires_at"=>nil, "id"=>"1", "administrator"=>false, "remember_token"=>nil, "login"=>"new_user", "email"=>"new_user@example.com", "created_at"=>"2007-07-14 18:03:29")
    @sale = Sale.create(:date => '2007-08-04', :organization_id => @org.id, :user_id => @user.id)
  end

  #TODO make this tests
  def test_true
    assert true
  end
  
#  def test_relation_with_sale
#    pay = PaymentWithCash.create(:sale_id => @sale.id, :value => 50.00, :date => '2007-08-04', :received => true, :cash => 50.00)
#    assert_equal @sale, pay.sale
#  end
#
#  def test_mandatory_field_sale_id
#    pay = PaymentWithCash.create(:value => 50.00, :date => '2007-08-04', :received => true, :cash => 50.00)
#    assert pay.errors.invalid?(:sale_id)
#  end
#
#  def test_mandatory_field_value
#    pay = PaymentWithCash.create(:sale_id => @sale.id, :date => '2007-08-04', :received => true)
#    assert pay.errors.invalid?(:value)
#  end
#
#  def test_mandatory_field_date
#    pay = PaymentWithCash.create(:sale_id => @sale.id, :value => 50.00, :received => true, :cash => 50.00)
#    assert pay.errors.invalid?(:date)
#  end
#
#  def test_mandatory_field_received
#    pay = PaymentWithCash.create(:sale_id => @sale.id, :value => 50.00, :date => '2007-08-04', :cash => 50.00)
#    assert pay.errors.invalid?(:received)
#  end
#
#  def test_numericality_value
#    pay = PaymentWithCash.create(:sale_id => @sale.id, :value => 'bli', :date => '2007-08-04', :received => true, :cash => 50.00)
#    pay.errors.invalid?(:value)
#  end
#
#  def test_inclusion_value
#    pay = PaymentWithCash.create(:sale_id => @sale.id, :value => -50.00, :date => '2007-08-04', :received => true, :cash => 50.00)
#    pay.errors.invalid?(:value)
#  end

end
