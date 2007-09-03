require File.dirname(__FILE__) + '/../test_helper'

class ProductTest < Test::Unit::TestCase
  
  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
    @cat_prod = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    @cat_supp = SupplierCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    @supplier = Supplier.create!(:name => 'Hering', :cnpj => '58178734000145', :organization_id => @org.id, :email => 'contato@hering.com', :category_id => @cat_supp.id)
  end

  def test_relation_with_organization
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    assert_equal @org, product.organization
  end

  def test_relation_with_category
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    assert_equal @cat_prod, product.category
  end

  def test_relation_with_images
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    img = Image.new 
    stream = StringIO.new(File.read("#{RAILS_ROOT}/public/images/rails.png"))
    def stream.original_filename
      'rails.png'
    end
    def stream.content_type
      'image/png'
    end
    img.description = ('Image for testing')
    img.picture = stream
    img.product = product
    img.save
    
    assert product.images.include?(img)
  end

  def test_relation_with_suppliers
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    product.suppliers.concat(@supplier)
    assert product.suppliers.include?(@supplier)
  end

  def test_relation_with_stock
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    entry = StockIn.create!(:supplier_id => @supplier.id, :ammount => 50, :price => '15.00', :purpose => 'sell', :date => '2007-07-01', :payment_status => true, :product_id => product.id)
    assert product.stock_entries.include?(entry)
  end

  def test_mandatory_field_name
    product = Product.create(:sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    assert product.errors.invalid?(:name)
  end

  def test_mandatory_field_sell_price
    product = Product.create(:name => 'Image of product', :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    assert product.errors.invalid?(:sell_price)
  end

  def test_mandatory_field_unit
    product = Product.create(:name => 'Image of product', :sell_price => 2.0, :organization_id => @org.id, :category_id => @cat_prod.id)
    assert product.errors.invalid?(:unit)
  end

  def test_mandatory_field_organization_id
    product = Product.create(:name => 'Image of product', :sell_price => 2.0, :unit => 'kg', :category_id => @cat_prod.id)
    assert product.errors.invalid?(:organization_id)
  end

  def test_mandatory_field_category_id
    product = Product.create(:name => 'Image of product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id)
    assert product.errors.invalid?(:category_id)
  end

  def test_full_text_search
    Product.delete_all
    product1 = Product.create!(:name => 'test product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    product2 = Product.create!(:name => 'te_product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    products = Product.full_text_search('test*')
    assert_equal 1, products.length
    assert products.include?(product1)
  end

  def test_amount_in_stock
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)

    # generate 10 stock ins
    total_ammount = 0.0
    total_cost = 0.0
    (1..10).each { |n|
      entry = StockIn.create!(:supplier_id => @supplier.id, :ammount => 5, :price => '1.00', :purpose => 'sell', :date => '2007-07-01', :payment_status => true, :product_id => product.id)
      total_ammount += entry.ammount
      total_cost += entry.price * entry.ammount
    }

    assert_equal total_ammount, product.ammount_in_stock
    assert_in_delta total_cost, product.total_cost, 0.01
  end
  
end
