require File.dirname(__FILE__) + '/../test_helper'

class TrackerTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
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

  def test_not_numerical_product_points
    t = Tracker.new(:product_points => 'x')
    !t.valid?
    assert t.errors.invalid?(:product_points)
  end

  def test_numericality_of_product_points
    t = Tracker.new(:product_points => 50)
    t.valid?
    assert !t.errors.invalid?(:product_points)
  end

  def test_not_numerical_customer_points
    t = Tracker.new(:customer_points => 50)
    t.valid?
    assert !t.errors.invalid?(:customer_points)
  end

  def test_numericality_of_customer_points
    t = Tracker.new(:customer_points => 50)
    t.valid?
    assert !t.errors.invalid?(:customer_points)
  end

  def test_not_numerical_supplier_points
    t = Tracker.new(:supplier_points => 50)
    t.valid?
    assert !t.errors.invalid?(:supplier_points)
  end

  def test_numericality_of_supplier_points
    t = Tracker.new(:supplier_points => 50)
    t.valid?
    assert !t.errors.invalid?(:supplier_points)
  end

  def test_not_numerical_ledger_points
    t = Tracker.new(:ledger_points => 50)
    t.valid?
    assert !t.errors.invalid?(:ledger_points)
  end

  def test_numericality_of_ledger_points
    t = Tracker.new(:ledger_points => 50)
    t.valid?
    assert !t.errors.invalid?(:ledger_points)
  end

  def test_not_numerical_document_points
    t = Tracker.new(:document_points => 50)
    t.valid?
    assert !t.errors.invalid?(:document_points)
  end

  def test_numericality_of_document_points
    t = Tracker.new(:document_points => 50)
    t.valid?
    assert !t.errors.invalid?(:document_points)
  end

  def test_not_numerical_points_per_user
    t = Tracker.new(:points_per_user => 50)
    t.valid?
    assert !t.errors.invalid?(:points_per_user)
  end

  def test_numericality_of_points_per_user
    t = Tracker.new(:points_per_user => 50)
    t.valid?
    assert !t.errors.invalid?(:points_per_user)
  end

  def test_not_numerical_points_per_web_site
    t = Tracker.new(:points_per_web_site => 50)
    t.valid?
    assert !t.errors.invalid?(:points_per_web_site)
  end

  def test_numericality_of_points_per_web_site
    t = Tracker.new(:points_per_web_site => 50)
    t.valid?
    assert !t.errors.invalid?(:points_per_web_site)
  end

end
