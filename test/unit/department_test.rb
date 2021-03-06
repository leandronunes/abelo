require File.dirname(__FILE__) + '/../test_helper'

class DepartmentTest < Test::Unit::TestCase
 
  def setup
    @organization = create_organization
  end

  def test_full_test_search
    Department.delete_all
    Department.create!(:name => 'Department for testing', :organization => @organization)
    Department.create!(:name => 'Department for testing again', :organization => @organization)
    Department.create!(:name => 'Another Department for testing', :organization => @organization)
    assert_equal 1, Department.full_text_search('Another*').length
  end

  def test_mandatory_field_name
    dept = Department.create(:organization_id => @organization.id)
    assert dept.errors.invalid?(:name)
  end

  def test_mandatory_field_organization
    dept = Department.create(:name => 'Department for testing')
    assert dept.errors.invalid?(:organization_id)
  end

  def test_uniqueness_field_name
    dept_1 = Department.create(:name => 'Department for testing', :organization_id => @organization.id)
    dept_2 = Department.create(:name => 'Department for testing', :organization_id => @organization.id)
    assert dept_2.errors.invalid?(:name)
  end

  def test_create
    Department.delete_all
    dept = Department.create(:name => 'Department for testing', :organization_id => @organization.id)
    assert_equal 1, Department.count
  end

  def test_destroy
    Department.delete_all
    dept = Department.create(:name => 'Department for testing', :organization_id => @organization.id)
    id = dept.id
    dept.destroy
    assert_equal 0, Department.count
    assert_raise(ActiveRecord::RecordNotFound) {
      Department.find(id)
    }
  end

end
