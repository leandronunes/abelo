require File.dirname(__FILE__) + '/../test_helper'

class ProductCategoryTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
    @unit = create_unit
  end

  def test_relation_with_products
    cat_prod = create_product_category
    product = create_product(:category => cat_prod)
    cat_prod.products.concat(product)
    assert_equal 1, cat_prod.products.count
  end

  def test_relation_with_images
    cat_prod = create_product_category
    product = create_product(:category => cat_prod)
    img = create_image(:product => product)

    assert cat_prod.images.include?(img)
  end

  def test_uniqueness_name
    cat_prod_1 = ProductCategory.create(:name => 'Category for testing', :organization_id => @organization.id)
    cat_prod_2 = ProductCategory.create(:name => 'Category for testing', :organization_id => @organization.id)
    assert cat_prod_2.errors.invalid?(:name)
  end

  def test_category_images
    cat_prod_1 = ProductCategory.create(:name => 'Category for testing', :organization_id => @organization.id)
    cat_prod_2 = ProductCategory.create(:name => 'Category for testing 2', :organization_id => @organization.id, :parent_id => cat_prod_1.id)

    product = create_product(:category => cat_prod_2)
    img = create_image(:product => product)

    assert cat_prod_1.category_images.include?(img)
    assert cat_prod_2.category_images.include?(img)

  end

end
