require File.dirname(__FILE__) + '/../test_helper'

class CategoryTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :identifier => 'org')
  end

  def test_mandatory_field_name
    c = ProductCategory.new
    c.organization = @org
    c.save
    assert c.errors.invalid?(:name)
  end

  def test_mandatory_field_name
    c = ProductCategory.new
    c.name = 'product category for testing'
    c.save
    assert c.errors.invalid?(:organization_id)
  end

  def test_relation_with_organization
    c = ProductCategory.create!(:name => 'product category for testing', :organization_id => @org.id)
    assert_equal @org, c.organization
  end

  def test_relation_with_parent
    parent_category = ProductCategory.create!(:name => 'parent category for testing', :organization_id => @org.id)
    c = ProductCategory.create!(:name => 'product category for testing', :organization_id => @org.id, :parent_id => parent_category.id)
    assert_equal parent_category, c.parent
  end

  def test_full_text_search
    c = ProductCategory.create!(:name => 'product category for testing', :organization_id => @org.id)
    assert @org.product_categories.full_text_search('product*').include?(c)
  end

  def test_category_full_name
    cat = Category.new(:name => 'category_name')
    assert_equal 'category_name', cat.full_name
  end

  def test_subcategory_full_name
    cat = Category.new(:name => 'category_name')
    sub_cat = Category.new(:name => 'subcategory_name')
    sub_cat.stubs(:parent).returns(cat)
    sub_cat.parent = cat
    assert_equal 'category_name/subcategory_name', sub_cat.full_name
  end

  def test_category_level
    cat = Category.new(:name => 'category_name')
    assert_equal 0, cat.level
  end

  def test_subegory_level
    cat = Category.new(:name => 'category_name')
    sub_cat = Category.new(:name => 'subcategory_name')
    sub_cat.stubs(:parent).returns(cat)
    sub_cat.parent = cat
    assert_equal 1, sub_cat.level
  end

  def test_top_level
    cat = Category.new(:name => 'category_name')
    assert cat.top_level?
  end

  def test_not_top_level
    cat = Category.new(:name => 'category_name')
    sub_cat = Category.new(:name => 'subcategory_name')
    sub_cat.stubs(:parent).returns(cat)
    sub_cat.parent = cat
    assert !sub_cat.top_level?
  end

  def test_leaf
    cat = Category.new(:name => 'category_name')
    sub_cat = Category.new(:name => 'subcategory_name')
    cat.stubs(:children).returns([sub_cat])
    assert !cat.leaf?
  end

  def test_not_leaf
    cat = Category.new(:name => 'category_name')
    sub_cat = Category.new(:name => 'subcategory_name')
    cat.stubs(:children).returns([])
    assert cat.leaf?
  end

  def test_top_level_for
    cat = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    sub_cat = ProductCategory.create(:name => 'SubCategory for testing', :organization_id => @org.id, :parent_id => cat.id)

    roots = ProductCategory.top_level_for(@org)
    
    assert_equal 1, roots.size
  end

end
