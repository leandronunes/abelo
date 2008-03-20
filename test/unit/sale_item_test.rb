require File.dirname(__FILE__) + '/../test_helper'

class SaleItemTest < Test::Unit::TestCase

  fixtures :system_actors

  def setup
    @organization = create_organization
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

  def test_relation_with_sale
    Product.any_instance.stubs(:amount_in_stock).returns(342)
    sale = create_sale()
    item = create_item(:sale => sale, :product => create_product(), :amount => 2)
    assert_equal sale, item.sale
  end

  def test_relation_with_product
    Product.any_instance.stubs(:amount_in_stock).returns(342)
    product = create_product()
    sale = create_sale()
    item = create_item(:sale => sale, :product => product, :amount => 2)
    assert_equal product, item.product
  end

  def test_sale_id
    Product.any_instance.stubs(:amount_in_stock).returns(342)
    sale = create_sale
    item = create_item(:sale => sale, :product => create_product(), :amount => 2)
    item.sale = nil
    item.valid?
    assert item.errors.invalid?(:sale_id)
  end


  def test_presence_of_unitary_price
    Product.any_instance.stubs(:amount_in_stock).returns(342)
    sale = create_sale
    item = create_item(:sale => sale, :product => create_product(), :amount => 2)
    item.product =  create_product(:sell_price => 0)
    item.valid?
    assert item.errors.invalid?(:unitary_price)
  end

  def test_presence_of_product_id
    Product.any_instance.stubs(:amount_in_stock).returns(342)
    sale = create_sale
    item = create_item(:sale => sale, :product => create_product(), :amount => 2)
    item.product = nil
    item.valid?
    assert item.errors.invalid?(:product_id)
  end

  def test_unitary_price_with_product
    Product.any_instance.stubs(:amount_in_stock).returns(342)
    product = create_product()
    sale = create_sale
    item = create_item(:sale => sale, :product => product, :amount => 2)
    assert_equal(product.sell_price, item.unitary_price)
  end

  def test_item_name
    Product.any_instance.stubs(:amount_in_stock).returns(342)
    product = create_product()
    sale = create_sale
    item = create_item(:sale => sale, :product => product, :amount => 2)
    assert_equal product.name, item.name
  end

  def test_sale_item_price
    Product.any_instance.stubs(:amount_in_stock).returns(342)
    product = create_product()
    sale = create_sale
    amount = 2
    item = create_item(:sale => sale, :product => product, :amount => amount)
    assert_equal product.sell_price * amount, item.price
  end


  def test_stock_down_when_sale_item_is_created
    count = StockOut.count
    sale = create_sale()
    p = create_product()
    create_stock_in(:product => p, :status => Status::STATUS_DONE)
    amount = 2
    p = Product.find(p.id)
    stock = p.amount_in_stock
    assert_not_equal 0,  stock
    item = create_item(:sale => sale, :product => p, :amount => amount)
    sale.reload
    sale.done!
    assert_equal stock - amount, p.amount_in_stock
    assert_equal count + 1, StockOut.count
  end


  def test_destroy_sale_items_when_sale_is_destroyed
    Product.any_instance.stubs(:amount_in_stock).returns(342)
    Sale.destroy_all
    SaleItem.destroy_all
    sale = create_sale()
    p = create_product()
    create_item(:sale => sale, :product => p, :amount => 1)
    create_item(:sale => sale, :product => p, :amount => 2)
    create_item(:sale => sale, :product => p, :amount => 3)
    assert 3, SaleItem.count
    assert sale.destroy
    assert 0, SaleItem.count
  end

  def test_product_code= 
    sale = mock()
    organization = mock()
    sale.expects(:organization).returns(organization)
    product = create_product
    organization.expects(:products).returns([product])
    code = product.code
    Array.any_instance.expects(:find_by_code).with(code).returns(product)
    item = SaleItem.new
    SaleItem.any_instance.stubs(:sale).returns(sale)
    item.product_code= code
    assert_equal product, item.product
    assert_equal code, item.item_product_code
  end

  def test_product_code_when_product_is_nil
    s = SaleItem.new  
    code = 34
    s.item_product_code = code
    SaleItem.any_instance.expects(:product).returns(nil)
    assert_equal code, s.product_code
  end

  def test_product_code_whith_existing_product
    s = SaleItem.new  
    code = 45
    product = mock()
    product.expects(:code).returns(code)
    SaleItem.any_instance.stubs(:product).returns(product)
    assert_equal code, s.product_code
  end

  def test_surcharge
    s = SaleItem.new
    assert_equal 0, s.surcharge
  end

end
