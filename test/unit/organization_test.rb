require File.dirname(__FILE__) + '/../test_helper'

class OrganizationTest < Test::Unit::TestCase
  fixtures :organizations, :people, :user_profiles, :sales

  def setup
    @organization = Organization.new
    @organization.name = 'organization for testing'
    @organization.cnpj = '19900000002462'
    @organization.nickname = 'test_organization'
    @organization.save
  end

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
    assert o.departments.include?(d)
  end

  def test_has_many_cash_flows
    o = Organization.find(1)
    assert_valid o
    cf = CashFlow.new
    cf.date = Date.today
    cf.value = 10.0
    cf.historical_id = Historical.find(1)
    cf.specification_id = Specification.find(1)
    o.add_cash_flows(cf)
    assert_valid cf
    assert o.cash_flows.include?(cf)
  end

  def test_has_many_historicals
    o = Organization.find(1)
    assert_valid o
    h = Historical.new
    h.name = 'hisotrical for testing'
    h.type_of = 'C'
    h.operational = true
    o.add_historicals(h)
    assert_valid h
    assert o.historicals.include?(h)
  end

  def test_filter_historicals
    h = Historical.find(1)
    assert_valid h
    @organization.add_historicals(h)
    assert_equal true, h.operational
    assert_equal 'C', h.type_of
    historical_expected = @organization.filter_historicals('t', 'C')
    assert_equal historical_expected.first, h
    historical_expected = @organization.filter_historicals('t', 'Blih')
    assert historical_expected.empty?
  end

  def test_historical_total_value
    cf_1 = CashFlow.find(1)
    assert_valid cf_1
    @organization.add_cash_flows(cf_1)
    cf_2 = CashFlow.find(2)
    assert_valid cf_2
    @organization.add_cash_flows(cf_2)
    assert_equal 2, @organization.cash_flows.count
    assert_equal cf_1.historical_id, cf_2.historical_id
    total_value =  cf_1.value + cf_2.value
    assert_equal total_value, @organization.historical_total_value(cf_1.historical_id)
  end

end
