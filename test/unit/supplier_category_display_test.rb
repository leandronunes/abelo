require File.dirname(__FILE__) + '/../test_helper'

class SupplierCategoryDisplayTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
  end

  def test_available_fields_are_valids
    parent = SupplierCategory.new(:name => 'Category for testing', :organization_id => @org)
    cat_supp = SupplierCategory.new(:name => 'Category for testing', :organization_id => @org.id, :parent => parent)
    assert_kind_of Array, SupplierCategoryDisplay.available_fields
    SupplierCategoryDisplay.available_fields.each do |field|
      assert_nothing_raised { cat_supp.send("#{field}")}
    end
  end

  def test_available_fields_have_title_method
    parent = SupplierCategory.new(:name => 'Category for testing', :organization_id => @org)
    cat_supp = SupplierCategory.new(:name => 'Category for testing', :organization_id => @org.id, :parent => parent)
    SupplierCategoryDisplay.available_fields.each do |field|
      assert SupplierCategoryDisplay.methods.include?("title_#{field}")
    end 
  end

  def test_available_fields_are_invalids
    cat_supp = SupplierCategory.new(:name => 'Category for testing', :organization_id => @org.id)
    SupplierCategoryDisplay.stubs(:available_fields).returns(['unknow_field'])
    SupplierCategoryDisplay.available_fields.each do |field|
      assert_raise(NoMethodError){ cat_supp.send("#{field}")}
    end
  end

  def test_title_name
    assert_kind_of String, SupplierCategoryDisplay.title_name
  end

  def test_title_parent
    assert_kind_of String, SupplierCategoryDisplay.title_parent
  end

end
