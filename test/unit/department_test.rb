require File.dirname(__FILE__) + '/../test_helper'

class DepartmentTest < Test::Unit::TestCase
  fixtures :departments, :organizations, :people

  def test_mandatory_fields
    d = Department.new
    assert !d.save

    d.name = "One Department"
    assert !d.save

    d.organization_id = 1
    assert d.organization.valid?
    assert d.save
  end

  def test_uniqueness
    d1 = Department.new
    d1.name = 'One Department'
    d1.organization_id = 1
    assert d1.save

    d2 = Department.new
    d2.name = 'One Department'
    d2.organization_id = 1
    assert !d2.save

    d3 = Department.new
    d3.name = 'One Department'
    d3.organization_id = 2
    assert d3.save
  end

  def test_create
    count = Department.count
    d = Department.new
    d.name = 'Department'
    d.organization = Organization.find(1)
    assert d.save
    assert_equal count + 1, Department.count
  end

  def test_destroy
    count = Department.count
    d = Department.find(1)
    assert_not_nil d
    d.destroy
    assert_equal count - 1, Department.count
    assert_raise(ActiveRecord::RecordNotFound) {
      Department.find(1)
    }

  end

  def test_invalid_organization
    count = Department.count
    invalid_organization_id = 1000
    assert !(Organization.find_all.collect{|o|o.id}.include? invalid_organization_id)
    d = Department.new
    d.name = 'Department'
    d.organization_id = invalid_organization_id
    assert !d.save
    assert_equal count, Department.count
  end

  def test_fixtures_if_valid
    Department.find_all.each do |d|
      assert d.valid?
    end
  end

end
