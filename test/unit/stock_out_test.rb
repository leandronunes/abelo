require File.dirname(__FILE__) + '/../test_helper'

class StockOutTest < Test::Unit::TestCase

  fixtures :organizations
  
  def setup
    @org = Organization.find_by_identifier('six') 
    @cat_prod = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    @product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id) 
    cat_supp = SupplierCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    @supplier = Supplier.create!(:name => 'Hering', :cnpj => '58178734000145', :organization_id => @org.id, :email => 'contato@hering.com', :category_id => cat_supp.id)
  end

  def test_amount_not_negative
    entry = StockOut.create(:amount => 5, :date => '2007-07-01', :product_id => @product.id)
    assert entry.errors.invalid?(:amount) 
  end
 
  def test_validate
    entry = StockOut.create(:amount => -5, :date => '2007-07-01', :product_id => @product.id)
    assert entry.errors.invalid?(:amount)
  end

end
