require File.dirname(__FILE__) + '/../test_helper'

class SupplierTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
  end

  def test_relation_with_products
    cat_prod = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => cat_prod.id)
    supplier = Supplier.new
    supplier.products.concat(product)
    assert supplier.products.include?(product)
  end

  def test_relation_with_category
    cat_supp = SupplierCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    supplier = Supplier.new
    supplier.category = cat_supp
    assert_equal cat_supp, supplier.category
  end

end
