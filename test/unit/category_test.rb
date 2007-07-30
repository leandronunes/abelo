require File.dirname(__FILE__) + '/../test_helper'

class CategoryTest < Test::Unit::TestCase
  fixtures :categories, :organizations

  def test_mandatory_fields
    c = ProductCategory.new
    assert !c.save
    
    c.name = 'Category for testing'
    assert !c.save

    c.organization = Organization.find(1)
    assert c.save
    assert_equal ProductCategory, c.class
  end

  def test_full_name
    c = Category.find(1)
    assert_equal 'product_category A', c.full_name

    c = Category.find(3)
    assert_equal 'product_category A/product_category AA', c.full_name
  end

  def test_level
    c = Category.find(1)
    assert_equal 0, c.level
    
    c = Category.find(3)
    assert_equal 1, c.level
  end

  def test_top_level 
    c = Category.find(1)
    assert c.top_level?
    
    c = Category.find(3)
    assert !c.top_level?
  end

  def test_leaf
    c = Category.find(1)
    assert !c.leaf?
    
    c = Category.find(3)
    assert c.leaf?
  end

  def test_top_level_for
    roots = Category.top_level_for(Organization.find(1))
    assert_equal 4, roots.size

    product_roots = ProductCategory.top_level_for(Organization.find(1))
    assert_equal 2, product_roots.size

    customer_roots = CustomerCategory.top_level_for(Organization.find(1))
    assert_equal 2, customer_roots.size
  end

end
