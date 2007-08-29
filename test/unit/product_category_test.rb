require File.dirname(__FILE__) + '/../test_helper'

class ProductCategoryTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
  end

  def test_relation_with_products
    cat_prod = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    product = Product.new(:name => 'Image of product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id)
    cat_prod.products.concat(product)
    assert_equal 1, cat_prod.products.count
  end

  def test_relation_with_images
    cat_prod = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    product = Product.create(:name => 'Image of product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => cat_prod.id)
    img = Image.new 
    stream = StringIO.new(File.read('public/images/rails.png'))
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

    assert cat_prod.images.include?(img)
  end

  def test_uniqueness_name
    cat_prod_1 = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    cat_prod_2 = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    assert cat_prod_2.errors.invalid?(:name)
  end

  def test_category_images
    cat_prod_1 = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    cat_prod_2 = ProductCategory.create(:name => 'Category for testing 2', :organization_id => @org.id, :parent_id => cat_prod_1.id)
    product = Product.create(:name => 'Image of product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => cat_prod_2.id)

    img = Image.new 
    stream = StringIO.new(File.read('public/images/rails.png'))
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

    assert cat_prod_1.category_images.include?(img)
    assert cat_prod_2.category_images.include?(img)

  end

  def test_configuration_class
    assert_equal ProductCategoryDisplay, ProductCategory.configuration_class
  end

end
