require File.dirname(__FILE__) + '/../test_helper'

class StockInTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :identifier => 'org')
    @cat_prod = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    @product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id) 
    cat_supp = SupplierCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    @supplier = Supplier.create!(:name => 'Hering', :cnpj => '58178734000145', :organization_id => @org.id, :email => 'contato@hering.com', :category_id => cat_supp.id)
  end

  def test_relation_with_supplier
    entry = StockIn.new
    entry.supplier = @supplier
    assert_equal @supplier, entry.supplier
  end

  def test_mandatory_field_supplier_id
    entry = StockIn.create(:amount => 5, :price => '1.00', :purpose => 'sell', :date => '2007-07-01', :payment_status => true, :product_id => @product.id)
    assert entry.errors.invalid?(:supplier_id)
  end

  def test_mandatory_field_price
    entry = StockIn.create(:amount => 5, :purpose => 'sell', :date => '2007-07-01', :payment_status => true, :product_id => @product.id)
    assert entry.errors.invalid?(:price) 
  end

  def test_price_not_numerical
    entry = StockIn.create(:amount => 5, :purpose => 'sell', :date => '2007-07-01', :payment_status => true, :product_id => @product.id, :price => 'not_numerical')
    assert entry.errors.invalid?(:price) 
  end

  def test_amount_not_positive
    entry = StockIn.create(:amount => -5, :purpose => 'sell', :date => '2007-07-01', :payment_status => true, :product_id => @product.id, :price => 10.00)
    assert entry.errors.invalid?(:amount) 
  end

  def test_total_cost
    entry = StockIn.create(:amount => 5, :purpose => 'sell', :date => '2007-07-01', :payment_status => true, :product_id => @product.id, :price => 10.00)
    assert_in_delta 50, entry.total_cost, 0.01
  end

end
