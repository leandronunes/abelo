require File.dirname(__FILE__) + '/../test_helper'

class ProductCategoryTest < Test::Unit::TestCase
  fixtures :product_categories

  # Replace this with your real tests.
  def test_mandatory_fields
    count = ProductCategory.count

    cat = ProductCategory.new
    assert !cat.save

    cat.name = 'A category for testing mandatory fields'
    assert cat.save

    assert_equal count + 1, ProductCategory.count
  end
end
