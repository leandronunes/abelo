require File.dirname(__FILE__) + '/../test_helper'

require 'extended_date'

class ExtendedDateTest < Test::Unit::TestCase

  def test_beginning_of_month
    d = Date.new(2007, 2, 23)
    assert_equal Date.new(2007,2,1), Date.beginning_of_month(d)
  end

  def test_end_of_month
    d = Date.new(2008, 1, 23)
    assert_equal Date.new(2008,1,31), Date.end_of_month(d)

    d = Date.new(2008, 4, 23)
    assert_equal Date.new(2008,4,30), Date.end_of_month(d)

    d = Date.new(2008, 2, 23)
    assert_equal Date.new(2008,2,29), Date.end_of_month(d)

    d = Date.new(2007, 2, 23)
    assert_equal Date.new(2007,2,28), Date.end_of_month(d)
  end

end
