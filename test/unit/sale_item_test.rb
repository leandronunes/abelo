require File.dirname(__FILE__) + '/../test_helper'

class SaleItemTest < Test::Unit::TestCase

  fixtures :system_actors

  def setup
    @organization = Organization.find_by_identifier('one') 
    @category = ProductCategory.create(:name => 'Category for testing', :organization_id => @organization.id)
    @user = User.create!("salt"=>"7e3041ebc2fc05a40c60028e2c4901a81035d3cd", "updated_at"=>nil, "crypted_password"=>"00742970dc9e6319f8019fd54864d3ea740f04b1", "type"=>"User", "remember_token_expires_at"=>nil, "id"=>"1", "administrator"=>false, "remember_token"=>nil, "login"=>"new_user", "email"=>"new_user@example.com", "created_at"=>"2007-07-14 18:03:29")
    @supplier = Supplier.find(:first)
    @invoice = create_invoice
  end

  def test_setup
    assert @organization.valid?
    assert @category.valid?
    assert @supplier.valid?
    assert @invoice.valid?
  end

  def create_invoice
    i =  Invoice.new(:number => 3434, :serie => 343, :organization => @organization,
         :supplier => @supplier, :issue_date => Date.today)
    i.save 
    i
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
    p = Product.create({:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization => @organization, :category => @category}.merge(params))
    StockIn.create!(:product => p, :status => Status::STATUS_DONE, :price => 45, :amount => 10, :date => Date.today, :supplier => @supplier, :invoice => @invoice)
    p
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


  def test_stock_down_when_sale_item_is_created
    count = StockOut.count
    sale = create_sale()
    p = create_product()
    amount = 2
    stock = p.amount_in_stock
    assert_not_equal 0,  stock
    item = create_item(sale, :product => p, :amount => amount)
    assert_equal stock - amount, p.amount_in_stock
    assert_equal count + 1, StockOut.count
  end


  def test_destroy_sale_items_when_sale_is_destroyed
    Sale.destroy_all
    SaleItem.destroy_all
    sale = create_sale()
    p = create_product()
    create_item(sale, :product => p, :amount => 1)
    create_item(sale, :product => p, :amount => 2)
    create_item(sale, :product => p, :amount => 3)
    assert 3, SaleItem.count
    assert sale.destroy
    assert 0, SaleItem.count
  end

end
