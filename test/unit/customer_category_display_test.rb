require File.dirname(__FILE__) + '/../test_helper'

class CustomerCategoryDisplayTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
  end

  def test_available_fields_are_valids
    parent = CustomerCategory.new(:name => 'Category for testing', :organization_id => @org)
    cat_cust = CustomerCategory.new(:name => 'Category for testing', :organization_id => @org.id, :parent => parent)
    assert_kind_of Array, CustomerCategoryDisplay.available_fields
    CustomerCategoryDisplay.available_fields.each do |field|
      assert_nothing_raised { cat_cust.send("#{field}")}
    end
  end

  def test_available_fields_have_title_method
    parent = CustomerCategory.new(:name => 'Category for testing', :organization_id => @org)
    cat_cust = CustomerCategory.new(:name => 'Category for testing', :organization_id => @org.id, :parent => parent)
    CustomerCategoryDisplay.available_fields.each do |field|
      assert CustomerCategoryDisplay.methods.include?("title_#{field}")
    end 
  end

  def test_available_fields_are_invalids
    cat_cust = CustomerCategory.new(:name => 'Category for testing', :organization_id => @org.id)
    CustomerCategoryDisplay.stubs(:available_fields).returns(['unknow_field'])
    CustomerCategoryDisplay.available_fields.each do |field|
      assert_raise(NoMethodError){ cat_cust.send("#{field}")}
    end
  end

  def test_title_name
    assert_kind_of String, CustomerCategoryDisplay.title_name
  end

  def test_title_parent
    assert_kind_of String, CustomerCategoryDisplay.title_parent
  end

end
