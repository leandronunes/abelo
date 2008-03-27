require File.dirname(__FILE__) + '/../test_helper'

class TrackerTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
  end

  def test_specific_trackers
    t = Tracker.new
    assert_equal({}, t.specific_trackers)
  end

  def test_user
    t = Tracker.new
    assert_equal 0, t.user

    user_point = 50
    t.user = user_point
    assert_equal user_point, t.user
  end

  def test_user=
    t = Tracker.new
    t.user = 50
    t.save
    assert_equal 50, Tracker.find(t.id).user
  end

  def test_web_site
    t = Tracker.new
    assert_equal 0, t.web_site

    web_site_point = 50
    t.web_site = web_site_point
    assert_equal web_site_point, t.web_site
  end

  def test_web_site=
    t = Tracker.new
    t.web_site = 50
    t.save
    assert_equal 50, Tracker.find(t.id).web_site
  end

  def test_describe
    ['user', 'web_site'].each do |field|
      assert_not_equal field, Tracker.describe(field)
    end
  end

  def test_not_numerical_available_points
    t = Tracker.new(:available_points => 'x')
    !t.valid?
    assert t.errors.invalid?(:available_points)
  end

  def test_numericality_of_available_points
    t = Tracker.new(:available_points => 50)
    t.valid?
    assert !t.errors.invalid?(:available_points)
  end

  def test_not_numerical_specific_trackers_user
    t = Tracker.new
    t.specific_trackers[:user] = 'x'
    !t.valid?
    assert t.errors.invalid?(:user)
  end

  def test_numerical_specific_trackers_user
    t = Tracker.new
    t.specific_trackers[:user] = 50
    t.valid?
    assert !t.errors.invalid?(:user)
  end

  def test_not_numerical_specific_trackers_web_site
    t = Tracker.new
    t.specific_trackers[:web_site] = 'x'
    !t.valid?
    assert t.errors.invalid?(:web_site)
  end

  def test_numerical_specific_trackers_web_site
    t = Tracker.new
    t.specific_trackers[:web_site] = 50
    t.valid?
    assert !t.errors.invalid?(:web_site)
  end

  def test_product_points
    organization = mock
    organization.expects(:products).times(2).returns([mock, mock])
    Tracker.any_instance.stubs(:organization).returns(organization)
    t = Tracker.new
    assert_equal 2, t.product_points
  end

  def test_product_points_when_products_are_nil
    organization = mock
    organization.expects(:products).returns(nil)
    Tracker.any_instance.stubs(:organization).returns(organization)
    t = Tracker.new
    assert_equal 0, t.product_points
  end

  def test_customer_points
    organization = mock
    organization.expects(:customers).times(2).returns([mock, mock])
    Tracker.any_instance.stubs(:organization).returns(organization)
    t = Tracker.new
    assert_equal 2, t.customer_points
  end

  def test_customer_points_when_customers_are_nil
    organization = mock
    organization.expects(:customers).returns(nil)
    Tracker.any_instance.stubs(:organization).returns(organization)
    t = Tracker.new
    assert_equal 0, t.customer_points
  end

  def test_supplier_points
    organization = mock
    organization.expects(:suppliers).times(2).returns([mock, mock])
    Tracker.any_instance.stubs(:organization).returns(organization)
    t = Tracker.new
    assert_equal 2, t.supplier_points
  end

  def test_supplier_points_when_suppliers_are_nil
    organization = mock
    organization.expects(:suppliers).returns(nil)
    Tracker.any_instance.stubs(:organization).returns(organization)
    t = Tracker.new
    assert_equal 0, t.supplier_points
  end

  def test_worker_points
    organization = mock
    organization.expects(:workers).times(2).returns([mock, mock])
    Tracker.any_instance.stubs(:organization).returns(organization)
    t = Tracker.new
    assert_equal 2, t.worker_points
  end

  def test_worker_points_when_workers_are_nil
    organization = mock
    organization.expects(:workers).returns(nil)
    Tracker.any_instance.stubs(:organization).returns(organization)
    t = Tracker.new
    assert_equal 0, t.worker_points
  end

  def test_ledger_points
    organization = mock
    organization.expects(:ledgers).times(2).returns([mock, mock])
    Tracker.any_instance.stubs(:organization).returns(organization)
    t = Tracker.new
    assert_equal 2, t.ledger_points
  end

  def test_ledger_points_when_ledgers_are_nil
    organization = mock
    organization.expects(:ledgers).returns(nil)
    Tracker.any_instance.stubs(:organization).returns(organization)
    t = Tracker.new
    assert_equal 0, t.ledger_points
  end

  def test_document_points
    organization = mock
    organization.expects(:documents).times(2).returns([mock, mock])
    Tracker.any_instance.stubs(:organization).returns(organization)
    t = Tracker.new
    assert_equal 2, t.document_points
  end

  def test_document_points_when_documents_are_nil
    organization = mock
    organization.expects(:documents).returns(nil)
    Tracker.any_instance.stubs(:organization).returns(organization)
    t = Tracker.new
    assert_equal 0, t.document_points
  end

  def test_user_points
    organization = mock
    organization.expects(:users).returns([mock, mock, mock])
    Tracker.any_instance.stubs(:organization).returns(organization)
    h = mock
    Tracker.any_instance.stubs(:specific_trackers).returns(h)
    h.stubs(:[]).with(:user).returns(2)
    t = Tracker.new
    assert_equal 6, t.user_points
  end

  def test_user_points_when_users_are_blank
    h = mock
    Tracker.any_instance.stubs(:specific_trackers).returns(h)
    h.stubs(:[]).with(:user).returns(nil)
    t = Tracker.new
    assert_equal 0, t.user_points
  end
  
  def test_web_site_points
    h = mock
    Tracker.any_instance.stubs(:specific_trackers).returns(h)
    h.stubs(:[]).with(:web_site).returns(2)
    t = Tracker.new
    assert_equal 2, t.web_site_points
  end
  
  def test_web_site_points_when_web_sites_are_nil
    h = mock
    Tracker.any_instance.stubs(:specific_trackers).returns(h)
    h.stubs(:[]).with(:web_site).returns(nil)
    t = Tracker.new
    assert_equal 0, t.web_site_points
  end

end
