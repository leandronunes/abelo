require File.dirname(__FILE__) + '/../test_helper'

class StockEntryTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
    @cat_prod = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    @product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id) 
    cat_supp = SupplierCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    @supplier = Supplier.create!(:name => 'Hering', :cnpj => '58178734000145', :organization_id => @org.id, :email => 'contato@hering.com', :category_id => cat_supp.id)
  end

  def test_relation_with_product
    entry = StockEntry.new
    entry.product = @product
    assert_equal @product, entry.product
  end

  def test_relation_with_organization
    entry = StockIn.create(:supplier_id => @supplier.id, :ammount => 5, :price => '1.00', :purpose => 'sell', :date => '2007-07-01', :payment_status => true, :product_id => @product.id)
    entry.organization = @org
    assert_equal @org, entry.organization
  end

  def test_mandatory_field_product_id
    entry = StockIn.create(:supplier_id => @supplier.id, :ammount => 5, :price => '1.00', :purpose => 'sell', :date => '2007-07-01', :payment_status => true)
    assert entry.errors.invalid?(:product_id)    
  end

  def test_mandatory_field_purpose
    entry = StockIn.create(:supplier_id => @supplier.id, :ammount => 5, :price => '1.00', :date => '2007-07-01', :payment_status => true, :product_id => @product.id)
    assert entry.errors.invalid?(:purpose)    
  end

  def test_mandatory_field_date
    entry = StockIn.create(:supplier_id => @supplier.id, :ammount => 5, :price => '1.00', :purpose => 'sell', :payment_status => true, :product_id => @product.id)
    assert entry.errors.invalid?(:date)    
  end

  def test_mandatory_field_ammount
    entry = StockIn.create(:supplier_id => @supplier.id, :price => '1.00', :purpose => 'sell', :date => '2007-07-01', :payment_status => true, :product_id => @product.id)
    assert entry.errors.invalid?(:ammount)
  end
  
  def test_invalid_field_ammount
    entry = StockIn.create(:supplier_id => @supplier.id, :price => '1.00', :purpose => 'sell', :date => '2007-07-01', :payment_status => true, :product_id => @product.id, :ammount => 'not_numerical')
    assert entry.errors.invalid?(:ammount)
  end

  def test_valid_purpose
    count = StockIn.count
    entry = StockIn.create({
      :product_id => 1,
      :supplier_id => 1,
      :ammount => 1,
      :price => 1.99,
      :purpose => 'sell',
      :date =>  '2007-01-01',
      :payment_status => true,
    })
    assert count+1, StockIn.count
  end

  def test_invalid_purpose
    entry = StockIn.create({
      :product_id => 1,
      :supplier_id => 1,
      :ammount => 1,
      :price => 1.99,
      :purpose => 'blabalble', # invalid purpose
      :date =>  '2007-01-01',
      :payment_status => true,
    })
    assert entry.errors.invalid?(:purpose)
  end

  # One cannot add a invalid item to the stock. The validity date must always
  # be after the date in which the entry gets into the stock.
  def test_validate_less_than_actual_date
    entry = StockIn.create({
      :product_id => 1,
      :supplier_id => 1,
      :ammount => 1,
      :price => 1.99,
      :purpose => 'blabalble', # invalid purpose
      :date =>  '2007-01-01',
      :payment_status => true,
      :validity => '2006-12-01'
    })
    
    assert entry.errors.invalid?(:validity)
  end
  

end
