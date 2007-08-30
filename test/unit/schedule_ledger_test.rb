require File.dirname(__FILE__) + '/../test_helper'

class ScheduleLedgerTest < Test::Unit::TestCase
  fixtures :schedule_ledgers, :periodicities

  def test_presence_of_periodicity_id
    sl = ScheduleLedger.new
    sl.valid?
    assert sl.errors.invalid?(:periodicity_id)
    sl.periodicity = Periodicity.find(:first)
    sl.valid?
    assert !sl.errors.invalid?(:periodicity_id)    
  end

  def test_presence_of_start_date
    sl = ScheduleLedger.new
    sl.valid?
    assert sl.errors.invalid?(:start_date)
    sl.start_date =  Date.today
    sl.valid?
    assert !sl.errors.invalid?(:start_date)    
  end

  def test_start_date_on_past_date
    sl = ScheduleLedger.new
    sl.start_date =  Date.today - 1
    sl.valid?
    assert sl.errors.invalid?(:start_date)    
  end

  def test_start_date_in_current_date
    sl = ScheduleLedger.new
    sl.start_date =  Date.today
    sl.valid?
    assert !sl.errors.invalid?(:start_date)    
  end

  def test_start_date_on_future_date
    sl = ScheduleLedger.new
    sl.start_date =  Date.today + 1
    sl.valid?
    assert !sl.errors.invalid?(:start_date)    
  end


  def test_presence_of_interval
    sl = ScheduleLedger.new
    sl.valid?
    assert sl.errors.invalid?(:interval)
    sl.interval = 2
    sl.valid?
    assert !sl.errors.invalid?(:interval)    
  end

  def test_numericality_of_interval
    sl = ScheduleLedger.new
    sl.valid?
    assert sl.errors.invalid?(:interval)
    sl.interval = 'leo'
    sl.valid?
    assert sl.errors.invalid?(:interval)
    sl.interval = 3
    sl.valid?
    assert !sl.errors.invalid?(:interval)    
  end


end
