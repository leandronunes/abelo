require File.dirname(__FILE__) + '/../test_helper'

class SupplierCategoryDisplayTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
  end

  def test_available_fields_are_valids
    parent = SupplierCategory.new(:name => 'Category for testing', :organization_id => @organization)
    cat_supp = SupplierCategory.new(:name => 'Category for testing', :organization_id => @organization.id, :parent => parent)
    assert_kind_of Array, SupplierCategoryDisplay.available_fields
    SupplierCategoryDisplay.available_fields.each do |field|
      assert_nothing_raised { cat_supp.send("#{field}")}
    end
  end

  AVAILABLE_FIELDS_TEST = %w[
      name 
      parent
  ]
  def test_available_fields
    assert_equal AVAILABLE_FIELDS_TEST, SupplierCategoryDisplay.available_fields
  end

  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, SupplierCategoryDisplay.describe(field)
    end
  end

end
