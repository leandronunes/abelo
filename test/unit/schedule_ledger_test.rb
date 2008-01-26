require File.dirname(__FILE__) + '/../test_helper'

class ScheduleLedgerTest < Test::Unit::TestCase
  fixtures :periodicities, :ledger_categories

  def setup
    @periodicity = Periodicity.find(:first)
    @organization = Organization.find(:first)
    @ledger_category = LedgerCategory.find(:first)
  end

  def create_schedule
    ScheduleLedger.create(:periodicity => @periodicity, :start_date => DateTime.now, :interval => 3)
  end

  def create_ledger()
    ledger = Ledger.new
    ledger.payment_method = Payment::MONEY
    ledger.value = 367
    ledger.date = Date.today
    ledger.owner = @organization
    ledger.bank_account = @organization.default_bank_account
    ledger.category = @ledger_category
    ledger.save!
    ledger
  end

  def test_presence_of_periodicity_id
    sl = ScheduleLedger.new
    sl.valid?
    assert sl.errors.invalid?(:periodicity_id)
    sl.periodicity = @periodicity
    sl.valid?
    assert !sl.errors.invalid?(:periodicity_id)    
  end

  def test_presence_of_start_date
    sl = ScheduleLedger.new
    sl.valid?
    assert sl.errors.invalid?(:start_date)
    sl.start_date =  DateTime.now
    sl.valid?
    assert !sl.errors.invalid?(:start_date)    
  end

  def test_start_date_on_past_date
    sl = ScheduleLedger.new
    sl.start_date =  DateTime.now - 1
    sl.valid?
    assert sl.errors.invalid?(:start_date)    
  end

  def test_start_date_in_current_date
    sl = ScheduleLedger.new
    sl.start_date =  DateTime.now
    sl.valid?
    assert !sl.errors.invalid?(:start_date)    
  end

  def test_start_date_on_future_date
    sl = ScheduleLedger.new
    sl.start_date =  DateTime.now + 1
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
    sl.interval = 'some'
    sl.valid?
    assert sl.errors.invalid?(:interval)
    sl.interval = 3
    sl.valid?
    assert !sl.errors.invalid?(:interval)    
  end

  def test_remove_when_there_is_no_ledger_scheduled
    s = create_schedule
    schedule_id = s.id
    assert s.valid?
    count =  Ledger.count
    for i in 1..10 do
      l = create_ledger
      s.ledgers << l
    end
    assert_equal count + 10, count + s.ledgers.length
    Ledger.destroy_all
    assert_equal 0, Ledger.count
    assert_raise(ActiveRecord::RecordNotFound){ ScheduleLedger.find(schedule_id)}
  end

  def test_remove_ledgers_when_unscheduled
    s = create_schedule
    assert s.valid?
    count =  Ledger.count
    for i in 1..10 do
      l = create_ledger
      s.ledgers << l
    end
    assert_equal count + 10, count + s.ledgers.length
    s.destroy
    assert_equal count, Ledger.count
  end

  def test_remove_only_pending_ledgers_when_unscheduled
    s = create_schedule
    assert s.valid?
    count =  Ledger.count
    for i in 1..10 do
      l = create_ledger
      s.ledgers << l
    end
    l.done!
    l.save
    assert_equal count + 10, count + s.ledgers.length
    s.destroy
    assert_equal count + 1, Ledger.count
  end

  def test_pending_legers
    s = create_schedule
    assert s.valid?
    count =  Ledger.count
    for i in 1..5 do
      l = create_ledger
      s.ledgers << l
    end
    for i in 1..5 do
      l = create_ledger
      l.done!
      l.save
      s.ledgers << l
    end
    assert_equal 5, s.pending_ledgers.length
  end

end
