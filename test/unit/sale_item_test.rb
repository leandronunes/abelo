require File.dirname(__FILE__) + '/../test_helper'

class SaleItemTest < Test::Unit::TestCase

  fixtures :organizations

  def setup
    @org = Organization.find_by_identifier('six') 
    @cat_prod = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    @user = User.create!("salt"=>"7e3041ebc2fc05a40c60028e2c4901a81035d3cd", "updated_at"=>nil, "crypted_password"=>"00742970dc9e6319f8019fd54864d3ea740f04b1", "type"=>"User", "remember_token_expires_at"=>nil, "id"=>"1", "administrator"=>false, "remember_token"=>nil, "login"=>"new_user", "email"=>"new_user@example.com", "created_at"=>"2007-07-14 18:03:29")
  end

  def test_relation_with_sale
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    sale = Sale.create(:date => '2007-08-04', :organization_id => @org.id, :user_id => @user.id)
    item = SaleItem.create(:sale_id => sale.id, :product_id => product.id, :amount => 2)
    assert_equal sale, item.sale
  end

  def test_relation_with_product
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    sale = Sale.create(:date => '2007-08-04', :organization_id => @org.id, :user_id => @user.id)
    item = SaleItem.create(:sale_id => sale.id, :product_id => product.id, :amount => 2)
    assert_equal product, item.product
  end

  def test_sale_id
    product = Product.create!(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    item = SaleItem.new(:product_id => product.id, :amount => 2)
    item.valid?
    assert item.errors.invalid?(:sale_id)
  end


  def test_presence_of_unitary_price
    product = Product.create!(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    sale = Sale.create(:date => '2007-08-04', :organization => @org, :user_id => @user)
    item = SaleItem.new(:product => product, :amount => 2, :sale => sale)
    item.unitary_price = nil
    item.valid?
    assert item.errors.invalid?(:unitary_price)
  end

  def test_product_id
    sale = Sale.create(:date => '2007-08-04', :organization_id => @org.id, :user_id => @user.id)
    item = SaleItem.create(:sale_id => sale.id, :amount => 2)
    assert item.errors.invalid?(:product_id)
  end

  def test_unitary_price_with_product
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    item = SaleItem.new(:amount => 2)
    item.product = product
    assert_equal(product.sell_price, item.unitary_price)
  end

  def test_unitary_price_with_product=
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    item = SaleItem.new(:product_id => product.id, :amount => 2)
    assert_equal(product.sell_price, item.unitary_price)
  end

  def test_name
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    item = SaleItem.new(:product_id => product.id, :amount => 2)
    assert_equal product.name, item.name
  end

  def test_price
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    item = SaleItem.new(:product_id => product.id, :amount => 2)
    assert_equal 4, item.price
  end

end
