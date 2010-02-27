require File.dirname(__FILE__) + '/../test_helper'

class ProductCategoryDisplayTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
  end

  def test_available_fields_are_valids
    parent = ProductCategory.new(:name => 'Category for testing', :organization_id => @organization)
    cat_prod = ProductCategory.new(:name => 'Category for testing', :organization_id => @organization.id, :parent => parent)
    assert_kind_of Array, ProductCategoryDisplay.available_fields
    ProductCategoryDisplay.available_fields.each do |field|
      assert_nothing_raised { cat_prod.send("#{field}")}
    end
  end

  AVAILABLE_FIELDS_TEST = %w[
      name 
      parent
  ]
  def test_available_fields
    assert_equal AVAILABLE_FIELDS_TEST, ProductCategoryDisplay.available_fields
  end

  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, ProductCategoryDisplay.describe(field)
    end
  end


end
