require File.dirname(__FILE__) + '/../test_helper'

class ProductCategoryTest < Test::Unit::TestCase
  fixtures :product_categories, :organizations

  # Replace this with your real tests.
  def test_mandatory_fields
    count = ProductCategory.count

    cat = ProductCategory.new
    assert !cat.save

    cat.name = 'A category for testing mandatory fields'
    assert !cat.save

    cat.organization = Organization.find(1)
    assert cat.save

    assert_equal count + 1, ProductCategory.count
  end

  def test_full_name
    c = ProductCategory.find(1)
    assert_equal 'Category A', c.full_name
    c = ProductCategory.find(3)
    assert_equal 'Category A/Category AA', c.full_name
    assert_equal 'Category A--Category AA', c.full_name('--')
  end


end
