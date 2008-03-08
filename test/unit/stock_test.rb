require File.dirname(__FILE__) + '/../test_helper'

class StockTest < Test::Unit::TestCase

  def setup
    @org = Organization.find_by_identifier('six') 
    @cat_prod = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    @product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id) 
    cat_supp = SupplierCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    @supplier = Supplier.create!(:name => 'Hering', :cnpj => '58178734000145', :organization_id => @org.id, :email => 'contato@hering.com', :category_id => cat_supp.id)
  end

  def test_relation_with_product
    entry = Stock.new
    entry.product = @product
    assert_equal @product, entry.product
  end

  def test_relation_with_organization
    entry = StockIn.create(:supplier_id => @supplier.id, :amount => 5,  :date => '2007-07-01', :product_id => @product.id)
    entry.organization = @org
    assert_equal @org, entry.organization
  end

  def test_mandatory_field_product_id
    entry = StockIn.create(:supplier_id => @supplier.id, :amount => 5,  :date => '2007-07-01')
    assert entry.errors.invalid?(:product_id)    
  end

  def test_mandatory_field_date
    entry = StockIn.create(:supplier_id => @supplier.id, :amount => 5,  :product_id => @product.id)
    assert entry.errors.invalid?(:date)    
  end

  def test_mandatory_field_amount
    entry = StockIn.create(:supplier_id => @supplier.id,  :date => '2007-07-01', :product_id => @product.id)
    assert entry.errors.invalid?(:amount)
  end
  
  def test_invalid_field_amount
    entry = StockIn.create(:supplier_id => @supplier.id,  :date => '2007-07-01', :product_id => @product.id, :amount => 'not_numerical')
    assert entry.errors.invalid?(:amount)
  end

  def test_describe
    
    ['StockIn', 'StockOut', 'StockDevolution', 'StockDown'].each do |class_name|
      assert_not_equal class_name, Stock.describe(class_name)
    end
  end

  def test_decimal_amount
    s = StockDown.new
    s.amount = '15'
    assert_equal 15, s.amount
    s.amount = '15.45'
    assert_equal 1545, s.amount
    s.amount = '15,23'
    assert_equal 15.23, s.amount
    s.amount = '1.345,23'
    assert_equal 1345.23, s.amount
  end

end
