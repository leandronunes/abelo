require File.dirname(__FILE__) + '/../test_helper'

class StockOutTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :identifier => 'org')
    @cat_prod = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    @product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id) 
    cat_supp = SupplierCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    @supplier = Supplier.create!(:name => 'Hering', :cnpj => '58178734000145', :organization_id => @org.id, :email => 'contato@hering.com', :category_id => cat_supp.id)
  end

  def test_amount_not_negative
    entry = StockOut.create(:amount => 5, :purpose => 'sell', :date => '2007-07-01', :payment_status => true, :product_id => @product.id, :price => 10.00)
    assert entry.errors.invalid?(:amount) 
  end
 
  def test_validate
    entry = StockOut.create(:amount => -5, :purpose => 'sell', :date => '2007-07-01', :payment_status => true, :product_id => @product.id, :price => 10.00)
    assert entry.errors.invalid?(:amount)
  end

end
