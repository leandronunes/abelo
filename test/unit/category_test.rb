require File.dirname(__FILE__) + '/../test_helper'

class CategoryTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
  end

  def test_mandatory_fields
    c = ProductCategory.new
    assert !c.save
    
    c.name = 'Category for testing'
    assert !c.save

    c.organization = @org
    assert c.save
    assert_equal ProductCategory, c.class
  end

  def test_full_name
    cat = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    assert_equal 'Category for testing', cat.full_name

    sub_cat = ProductCategory.new(:name => 'SubCategory for testing', :organization_id => @org.id, :parent_id => cat.id)
    assert_equal 'Category for testing/SubCategory for testing', sub_cat.full_name

#    cat1 = Category.new(:name => 'bli')
#    cat2 = Category.new(:name => 'bla')
#    cat2.stubs(:parent).returns(cat1)
#    cat2.parent = cat1
#    assert_equal 'bli/bla', cat2.name
  end

  def test_level
    cat = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    assert_equal 0, cat.level
    
    sub_cat = ProductCategory.new(:name => 'SubCategory for testing', :organization_id => @org.id, :parent_id => cat.id)
    assert_equal 1, sub_cat.level
  end

  def test_top_level 
    cat = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    assert cat.top_level?
    
    sub_cat = ProductCategory.new(:name => 'SubCategory for testing', :organization_id => @org.id, :parent_id => cat.id)
    assert !sub_cat.top_level?
  end

  def test_leaf
    cat = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    sub_cat = ProductCategory.create(:name => 'SubCategory for testing', :organization_id => @org.id, :parent_id => cat.id)

    assert !cat.leaf?
    assert sub_cat.leaf?
  end

  def test_top_level_for
    cat = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    sub_cat = ProductCategory.create(:name => 'SubCategory for testing', :organization_id => @org.id, :parent_id => cat.id)

    roots = ProductCategory.top_level_for(@org)
    
    assert_equal 1, roots.size
  end

end
