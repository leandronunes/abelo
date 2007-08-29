require File.dirname(__FILE__) + '/../test_helper'

class ProductCategoryDisplayTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
  end

  def test_available_fields_are_valids
    parent = ProductCategory.new(:name => 'Category for testing', :organization_id => @org)
    cat_prod = ProductCategory.new(:name => 'Category for testing', :organization_id => @org.id, :parent => parent)
    assert_kind_of Array, ProductCategoryDisplay.available_fields
    ProductCategoryDisplay.available_fields.each do |field|
      assert_nothing_raised { cat_prod.send("#{field}")}
    end
  end

  def test_available_fields_have_title_method
    parent = ProductCategory.new(:name => 'Category for testing', :organization_id => @org)
    cat_prod = ProductCategory.new(:name => 'Category for testing', :organization_id => @org.id, :parent => parent)
    ProductCategoryDisplay.available_fields.each do |field|
      assert ProductCategoryDisplay.methods.include?("title_#{field}")
    end 
  end

  def test_available_fields_are_invalids
    cat_prod = ProductCategory.new(:name => 'Category for testing', :organization_id => @org.id)
    ProductCategoryDisplay.stubs(:available_fields).returns(['unknow_field'])
    ProductCategoryDisplay.available_fields.each do |field|
      assert_raise(NoMethodError){ cat_prod.send("#{field}")}
    end
  end

  def test_title_name
    assert_kind_of String, ProductCategoryDisplay.title_name
  end

  def test_title_parent
    assert_kind_of String, ProductCategoryDisplay.title_parent
  end

end
