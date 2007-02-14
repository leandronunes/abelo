require File.dirname(__FILE__) + '/../test_helper'

class CustomerCategoryTest < Test::Unit::TestCase
  fixtures :customer_categories, :organizations

  # Replace this with your real tests.
  def test_mandatory_fields
    count = CustomerCategory.count

    cat = CustomerCategory.new
    assert !cat.save

    cat.name = 'A category for testing mandatory fields'
    assert !cat.save

    cat.organization = Organization.find(1)
    assert cat.save

    assert_equal count + 1, CustomerCategory.count
  end

  def test_full_name
    c = CustomerCategory.find(1)
    assert_equal 'Category a', c.full_name
    c = CustomerCategory.find(3)
    assert_equal 'Category a/Category aa', c.full_name
    assert_equal 'Category a--Category aa', c.full_name('--')
  end

  def test_leaf
    c1 = CustomerCategory.find(1)
    assert !c1.leaf?

    c2 = CustomerCategory.find(2)
    assert c2.leaf?
  end

end
