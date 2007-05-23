require File.dirname(__FILE__) + '/../test_helper'

class OrganizationTest < Test::Unit::TestCase
  fixtures :organizations, :people, :user_profiles, :sales

  def test_mandatory_fields
    count = Organization.count

    org = Organization.new
    assert(!org.save)

    org.name = 'Organization for testing mandatory fields'
    assert(!org.save)

    org.cnpj = '77635813000182'
    assert(!org.save)

    org.nickname = 'testing_mandatory_fields'
    assert(org.save)

    assert_equal(count + 1, Organization.count)
  end

  def test_cnpj_format
    org = Organization.find(1)
    org.cnpj = 'bli'
    assert(!org.save)
    org.cnpj = '12121212121212'
    assert(!org.save)
    org.cnpj = '66145476000129'
    assert(org.save)
  end

  def test_nickname_format
    org = Organization.find(1)
    org.nickname = 'invalid nickname'
    assert(!org.save)
    org.nickname = 'valid_nickname'
    assert(org.save)
  end

  def test_should_have_users
    org = Organization.find(1)
    assert_not_nil org.users
    assert_kind_of Array, org.users
    assert !org.users.empty?
    org.users.each do |user|
      assert_kind_of User, user
    end
  end

  def test_should_have_sales
    org = Organization.find(1)
    assert_not_nil org.sales
    assert_kind_of Array, org.sales
    assert ! org.sales.empty?
    assert(org.sales.all? do |sale|
      sale.kind_of? Sale
    end)
  end

  def test_should_have_pending_sales
    org = Organization.find(1)
    user = org.users.find(7)
    sales = org.pending_sales(user)
    assert_not_nil sales
    assert_kind_of Array, org.pending_sales(user)
    assert ! sales.empty?
    assert (sales.all? { |sale| sale.kind_of?(Sale) })
  end

  def test_has_many_departaments
    o = Organization.find(1)
    assert o.valid?
    d = Department.new
    d.name = "Department New"
    o.add_departments(d)
    assert d.valid?
    assert o.departments.include? d
  end

end
