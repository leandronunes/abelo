require File.dirname(__FILE__) + '/../test_helper'

class DepartmentTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
  end

  def test_mandatory_field_name
    dept = Department.create(:organization_id => @org.id)
    assert dept.errors.invalid?(:name)
  end

  def test_mandatory_field_organization
    dept = Department.create(:name => 'Department for testing')
    assert dept.errors.invalid?(:organization_id)
  end

  def test_uniqueness_field_name
    dept_1 = Department.create(:name => 'Department for testing', :organization_id => @org.id)
    dept_2 = Department.create(:name => 'Department for testing', :organization_id => @org.id)
    assert dept_2.errors.invalid?(:name)
  end

  def test_create
    dept = Department.create(:name => 'Department for testing', :organization_id => @org.id)
    assert_equal 1, Department.count
  end

  def test_destroy
    dept = Department.create(:name => 'Department for testing', :organization_id => @org.id)
    dept.destroy
    assert_equal 0, Department.count
    assert_raise(ActiveRecord::RecordNotFound) {
      Department.find(1)
    }
  end

  def test_invalid_organization
    invalid_organization_id = 1000
    d = Department.new
    d.name = 'Department'
    d.organization_id = invalid_organization_id
    assert_equal 0, Department.count
  end

end
