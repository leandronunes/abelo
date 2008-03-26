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

end
