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

  def test_available_fields_have_title_method
    parent = WorkerCategory.new(:name => 'Category for testing', :organization_id => @org)
    cat_worker = WorkerCategory.new(:name => 'Category for testing', :organization_id => @org.id, :parent => parent)
    WorkerCategoryDisplay.available_fields.each do |field|
      assert WorkerCategoryDisplay.methods.include?("title_#{field}")
    end 
  end

  def test_title_name
    assert_kind_of String, WorkerCategoryDisplay.title_name
  end

  def test_title_parent
    assert_kind_of String, WorkerCategoryDisplay.title_parent
  end

end
