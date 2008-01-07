require File.dirname(__FILE__) + '/../test_helper'

class SaleItemTest < Test::Unit::TestCase

  def setup
    @organization = Organization.find_by_identifier('one') 
    @category = ProductCategory.create(:name => 'Category for testing', :organization_id => @organization.id)
    @user = User.create!("salt"=>"7e3041ebc2fc05a40c60028e2c4901a81035d3cd", "updated_at"=>nil, "crypted_password"=>"00742970dc9e6319f8019fd54864d3ea740f04b1", "type"=>"User", "remember_token_expires_at"=>nil, "id"=>"1", "administrator"=>false, "remember_token"=>nil, "login"=>"new_user", "email"=>"new_user@example.com", "created_at"=>"2007-07-14 18:03:29")
  end

  def test_setup
    assert @organization.valid?
    assert @category.valid?
  end

  def create_till
    till = Till.new(@organization, @user, nil)
    till.save
    till
  end
  
  def new_sale(params={})
    till = create_till
    sale = Sale.new(till, params)
    sale
  end

  def create_sale(params= {})
    sale = new_sale(params)
    sale.save
    sale
  end

  def create_item(sale, params = {})
    item =   SaleItem.new(sale,params)
    item.save!
    item
  end

  def create_product(params = {})
    Product.create({:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization => @organization, :category => @category}.merge(params))
  end

  def test_relation_with_sale
    sale = create_sale()
    item = create_item(sale, :product => create_product(), :amount => 2)
    assert_equal sale, item.sale
  end

  def test_relation_with_product
    product = create_product()
    sale = create_sale()
    item = create_item(sale, :product => product, :amount => 2)
    assert_equal product, item.product
  end

  def test_sale_id
    sale = create_sale
    item = create_item(sale, :product => create_product(), :amount => 2)
    item.sale = nil
    item.valid?
    assert item.errors.invalid?(:sale_id)
  end


  def test_presence_of_unitary_price
    sale = create_sale
    item = create_item(sale, :product => create_product(), :amount => 2)
    item.product =  create_product(:sell_price => 0)
    item.valid?
    assert item.errors.invalid?(:unitary_price)
  end

  def test_presence_of_product_id
    sale = create_sale
    item = create_item(sale, :product => create_product(), :amount => 2)
    item.product = nil
    item.valid?
    assert item.errors.invalid?(:product_id)
  end

  def test_unitary_price_with_product
    product = create_product()
    sale = create_sale
    item = create_item(sale, :product => product, :amount => 2)
    assert_equal(product.sell_price, item.unitary_price)
  end

  def test_item_name
    product = create_product()
    sale = create_sale
    item = create_item(sale, :product => product, :amount => 2)
    assert_equal product.name, item.name
  end

  def test_sale_item_price
    product = create_product()
    sale = create_sale
    amount = 2
    item = create_item(sale, :product => product, :amount => amount)
    assert_equal product.sell_price * amount, item.price
  end

end
