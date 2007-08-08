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
    entry = StockIn.create!(:supplier_id => @supplier.id, :ammount => 5, :price => '1.00', :purpose => 'sell', :date => '2007-07-01', :payment_status => true, :product_id => @product.id)
    entry.organization = @org
    assert_equal @org, entry.organization
  end

  def test_belongs_organization
    entry = StockEntry.find(1)
    assert_not_nil entry.product
    assert_not_nil entry.organization
  end

  def test_purpose
    count = StockEntry.count

    entry = StockIn.new({
      :product_id => 1,
      :supplier_id => 1,
      :ammount => 1,
      :price => 1.99,
      :purpose => 'blabalble', # invalid purpose
      :date =>  '2007-01-01',
      :payment_status => true,
    })

    assert !entry.save

    entry.purpose = 'sell'
    assert entry.save

    entry.purpose = 'production'
    assert entry.save

    entry.purpose = 'kkkkk' # other invalid purpose
    assert !entry.save

    assert_equal count + 1, StockEntry.count

  end

end
