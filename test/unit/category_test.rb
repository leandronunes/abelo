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
    assert_equal ProductCategory, c.type
  end

  def test_acts_as_tree
    
  end

  def test_full_name
  end

  def test_level

  end

  def test_top_level

  end

  def test_leaf
  end

end
