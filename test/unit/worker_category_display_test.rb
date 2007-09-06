require File.dirname(__FILE__) + '/../test_helper'

class WorkerCategoryDisplayTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
  end

  def test_available_fields_are_valids
    parent = WorkerCategory.new(:name => 'Category for testing', :organization_id => @org)
    cat_worker = WorkerCategory.new(:name => 'Category for testing', :organization_id => @org.id, :parent => parent)
    assert_kind_of Array, WorkerCategoryDisplay.available_fields
    WorkerCategoryDisplay.available_fields.each do |field|
      assert_nothing_raised { cat_worker.send("#{field}")}
    end
  end

  AVAILABLE_FIELDS_TEST = %w[
      name 
      parent
  ]
  def test_available_fields
    assert_equal AVAILABLE_FIELDS_TEST, WorkerCategoryDisplay.available_fields
  end

  def test_describe
    AVAILABLE_FIELDS_TEST.each do |field|
      assert_not_equal field, WorkerCategoryDisplay.describe(field)
    end
  end


end
