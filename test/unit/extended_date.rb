require File.dirname(__FILE__) + '/../test_helper'

require 'extended_date'

class ExtendedDateTest < Test::Unit::TestCase

  def test_beginning_of_month
    d = Date.new(2007, 2, 23)
    assert_equal Date.new(2007,2,1), Date.beginning_of_month(d), "The date should be equal the first date of the month"
  end

  def test_beginning_of_month_when_nil_is_passed
    today = Date.today
    first_day_of_month = Date.new(today.year, today.month, 1)
    assert_equal first_day_of_month, Date.beginning_of_month(nil)
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

  def test_end_of_month_when_nil_is_passed
    date = Date.today

    if date.month == 2
      begin
        end_of_month = Date.new(date.year, date.month, 29)
      rescue
        end_of_month = Date.new(date.year, date.month, 28)
      end
    else
      begin
        end_of_month = Date.new(date.year, date.month, 31)
      rescue
        end_of_month = Date.new(date.year, date.month, 30)
      end
    end

    assert_equal end_of_month, Date.end_of_month(nil)
  end

end
