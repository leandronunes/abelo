require File.dirname(__FILE__) + '/../test_helper'

class LedgerTest < Test::Unit::TestCase

  fixtures :bank_accounts, :categories, :ledger_categories, :sales, :sale_items

  include Status

  def setup
    create_place
    @organization = create_organization
    @periodicity = create_periodicity
    @ledger_category = LedgerCategory.find(:first)
    @ledger = create_ledger
    @sale = Sale.find(:first)
  end

  def test_setup
    assert @ledger.valid?
    assert @organization.valid?
    assert @periodicity.valid?
    assert @ledger_category.valid?
    assert @sale.valid?
  end

  def test_money_payment_is_associated_to_a_ledger_category_with_money
    LedgerCategory.destroy_all
    category = create_ledger_category(:payment_methods => [Payment::MONEY])
    l = create_ledger(:payment_method => Payment::MONEY, :category => category)
    l.valid?
    assert !l.errors.invalid?(:payment_method)

    category = create_ledger_category(:payment_methods => [Payment::CHECK], :name => 'Another')
    l = create_ledger(:payment_method => Payment::MONEY, :category => category)
    l.valid?
    assert l.errors.invalid?(:payment_method)
  end

  def test_check_payment_is_associated_to_a_ledger_category_with_check
    LedgerCategory.destroy_all
    category = create_ledger_category(:payment_methods => [Payment::CHECK])
    l = create_ledger(:payment_method => Payment::CHECK, :category => category)
    l.valid?
    assert !l.errors.invalid?(:payment_method)

    category = create_ledger_category(:payment_methods => [Payment::MONEY], :name => 'Another')
    l = create_ledger(:payment_method => Payment::CHECK, :category => category)
    l.valid?
    assert l.errors.invalid?(:payment_method)
  end


  def test_credit_card_payment_is_associated_to_a_ledger_category_with_credit_card
    LedgerCategory.destroy_all
    category = create_ledger_category(:payment_methods => [Payment::CREDIT_CARD])
    l = create_ledger(:payment_method => Payment::CREDIT_CARD, :category => category)
    l.valid?
    assert !l.errors.invalid?(:payment_method)

    category = create_ledger_category(:payment_methods => [Payment::CHECK], :name => 'Another')
    l = create_ledger(:payment_method => Payment::CREDIT_CARD, :category => category)
    l.valid?
    assert l.errors.invalid?(:payment_method)
  end


  def test_debit_card_money_payment_is_associated_to_a_ledger_category_with_debit_card
    LedgerCategory.destroy_all
    category = create_ledger_category(:payment_methods => [Payment::DEBIT_CARD])
    l = create_ledger(:payment_method => Payment::DEBIT_CARD, :category => category)
    l.valid?
    assert !l.errors.invalid?(:payment_method)

    category = create_ledger_category(:payment_methods => [Payment::CHECK], :name => 'Another')
    l = create_ledger(:payment_method => Payment::DEBIT_CARD, :category => category)
    l.valid?
    assert l.errors.invalid?(:payment_method)
  end



  def test_validates_presence_of_bank_account
    l = Ledger.new
    l.valid?
    assert l.errors.invalid?(:bank_account_id)
    l.bank_account = BankAccount.find(:first)
    l.valid?
    assert !l.errors.invalid?(:bank_account_id)
  end

  def test_validates_presence_of_owner
    l = Ledger.new
    l.valid?
    assert l.errors.invalid?(:owner_id)
    assert l.errors.invalid?(:owner_type)
    l.owner = @organization
    l.valid?
    assert !l.errors.invalid?(:owner_id)
    assert !l.errors.invalid?(:owner_type)
  end


  def test_creation_of_ledgers_when_a_schedule_ledgers_is_needed
    Ledger.delete_all

    l = Ledger.new
    l.owner = @organization
    l.category = @ledger_category
    l.value = 300
    l.description = 'some description'
    l.tag_list = 'tag_test'
    l.date = Date.today
    l.bank_account = BankAccount.find(:first)
    l.schedule_repeat = true
    l.schedule_periodicity = create_periodicity(:name => 'some name')
    l.schedule_interval = 2
    l.payment_method = 'money'
    
    assert l.save!
    assert_equal 3, Ledger.count
  end

  def test_creation_of_ledgers_when_a_schedule_ledgers_is_needed_but_the_ledger_was_not_created
    Ledger.delete_all

    l = Ledger.new
    l.category = LedgerCategory.find(:first)
    l.value = nil #value is missing 
    l.description = 'some description'
    l.tag_list = 'tag_test'
    l.date = Date.today
    l.bank_account = BankAccount.find(:first)
    l.schedule_repeat = true
    l.schedule_periodicity = create_periodicity(:name => 'some name')
    l.schedule_interval = 2
    
    assert !l.save
    assert_equal 0, Ledger.count
  end

  def test_date_creation_of_ledgers_when_ledger_is_schedule
    Ledger.delete_all

    l = Ledger.new
    l.owner = @organization
    l.category = @ledger_category
    l.value = 300
    l.description = 'some description'
    l.tag_list = 'tag_test'
    l.date = Date.today
    l.bank_account = BankAccount.find(:first)
    l.schedule_repeat = true
    periodicity = create_periodicity(:name => 'another name')
    l.schedule_periodicity = periodicity
    interval = 2
    l.schedule_interval = interval
    l.payment_method = 'money'
    assert l.save!
    assert_equal 3, Ledger.count
    
    ledgers = Ledger.find(:all, :order => "foreseen_date")
    for i in 0..interval do
      first = ledgers.first
      date = DateTime.now + periodicity.number_of_days * i
      assert first.date.to_datetime.between?(date - 1, date)
      assert ledgers.delete(first)
    end
  end


  def test_presence_of_schedule_interval_when_schedule_repeat_and_schedule_periodicity_are_present
    l = Ledger.new
    l.schedule_repeat = true
    l.schedule_periodicity= Periodicity.find(:first)
    l.valid?
    assert l.errors.invalid?(:schedule_interval)
  end

  def test_presence_of_schedule_interval_when_schedule_repeat_is_present
    l = Ledger.new
    l.schedule_repeat = true
    l.valid?
    assert l.errors.invalid?(:schedule_interval)
  end

  def test_presence_of_schedule_interval_when_schedule_periodicity_is_present
    l = Ledger.new
    l.schedule_periodicity= Periodicity.find(:first)
    l.valid?
    assert l.errors.invalid?(:schedule_interval)
  end

  def test_presence_of_schedule_periodicity_when_schedule_repeat_and_schedule_interval_are_present
    l = Ledger.new
    l.schedule_repeat = true
    l.schedule_interval= 1
    l.valid?
    assert l.errors.invalid?(:schedule_periodicity)
  end

  def test_presence_of_schedule_periodicity_when_schedule_repeat_is_present
    l = Ledger.new
    l.schedule_repeat = true
    l.valid?
    assert l.errors.invalid?(:schedule_periodicity)
  end

  def test_presence_of_schedule_periodicity_when_schedule_interval_is_present
    l = Ledger.new
    l.schedule_interval= 1
    l.valid?
    assert l.errors.invalid?(:schedule_periodicity)
  end

  def test_presence_of_schedule_repeat_when_schedule_periodicity_and_schedule_interval_are_not_present
    l = Ledger.new
    l.valid?
    assert !l.errors.invalid?(:schedule_repeat)
  end

  def test_presence_of_schedule_repeat_when_schedule_periodicity_is_present
    l = Ledger.new
    l.valid?
    assert !l.errors.invalid?(:schedule_repeat)
    l.schedule_periodicity = @periodicity
    l.valid?
    assert l.errors.invalid?(:schedule_repeat)
  end

  def test_presence_of_schedule_repeat_when_schedule_interval_is_present
    l = Ledger.new
    l.valid?
    assert !l.errors.invalid?(:schedule_repeat)
    l.schedule_interval = 1
    l.valid?
    assert l.errors.invalid?(:schedule_repeat)
  end

  def test_presence_of_schedule_repeat_when_schedule_interval_and_schedule_periodicity_are_present
    l = Ledger.new
    l.valid?
    assert !l.errors.invalid?(:schedule_repeat)
    l.schedule_interval = 1
    l.schedule_periodicity = Periodicity.find(:first)
    l.valid?
    assert l.errors.invalid?(:schedule_repeat)
  end

  def test_precense_of_foreseen_date
    l = Ledger.new
    l[:foreseen_date] = nil
    l.valid?
    assert l.errors.invalid?(:foreseen_date)
    assert_raise(RuntimeError){l.foreseen_date = 1}
    l.date = Date.today
    l.valid?
    assert !l.errors.invalid?(:foreseen_date)
  end

  def test_precense_of_effective_date
    l = Ledger.new
    l.status = STATUS_DONE
    # Set the foreseen_date and effective_date date to nil to test the presence of effective_date
    l[:foreseen_date] = nil
    l[:effective_date] = nil
    l.valid?
    assert l.errors.invalid?(:effective_date)
    assert_raise(RuntimeError){l.effective_date = 1}
    l.date = Date.today
    l.valid?
    assert !l.errors.invalid?(:effective_date)
  end

  def test_precense_of_effective_date_when_is_foreseen
    l = Ledger.new
    l.status = STATUS_PENDING
    l.date =  Date.today
    l.valid?
    assert !l.errors.invalid?(:effective_date)
  end


  def test_precense_of_foressen_value
    l = Ledger.new
    l.valid?
    assert l.errors.invalid?(:foreseen_value)
    assert_raise(RuntimeError){l.foreseen_value = 1}
    l.value = 1
    l.valid?
    assert !l.errors.invalid?(:foreseen_value)
  end

  def test_precense_of_effective_value
    l = Ledger.new
    l.status = STATUS_DONE
    l.valid?
    assert l.errors.invalid?(:effective_value)
    assert_raise(RuntimeError){l.effective_value = 1}
    l.value = 1
    l.valid?
    assert !l.errors.invalid?(:effective_value)
  end

  def test_precense_of_effective_value_when_is_foreseen
    l = Ledger.new
    l.status = STATUS_PENDING
    l.value = 1
    l.valid?
    assert !l.errors.invalid?(:effective_value)
  end

  def test_numericality_of_value
    l = Ledger.new
    l.value = 'a'
    l.valid?
    assert l.errors.invalid?(:value)
    l.value = ''
    l.valid?
    assert l.errors.invalid?(:value)
    l.value = 12
    l.valid?
    assert !l.errors.invalid?(:value)
  end

  def test_value_must_be_greater_then_zero
    l = Ledger.new
    l.value = 0.0
    l.valid?
    assert l.errors.invalid?(:value)
    l.value = -1
    l.valid?
    assert l.errors.invalid?(:value)
    l.value = 0.01
    l.valid?
    assert !l.errors.invalid?(:value)
  end


  def test_schedule_mandatory_fields_param_schedule_repeat_when_all_informations_correct
    ledger = @ledger
    ledger.schedule_repeat = true
    ledger.schedule_periodicity = @periodicity
    ledger.schedule_interval = 34
    ledger.valid?
    assert !ledger.errors.invalid?(:schedule_repeat)

  end

  def test_schedule_mandatory_fields_param_schedule_repeat_when_periodicity_is_nil
    ledger = @ledger
    ledger.schedule_repeat = true
    ledger.schedule_periodicity = nil
    ledger.schedule_interval = 34
    ledger.valid?
    assert !ledger.errors.invalid?(:schedule_repeat)
  end

  def test_schedule_mandatory_fields_param_schedule_repeat_when_interval_is_nil
    ledger = @ledger
    ledger.schedule_repeat = true
    ledger.schedule_periodicity = @periodicity
    ledger.schedule_interval = nil
    ledger.valid?
    assert !ledger.errors.invalid?(:schedule_repeat)
  end

  def test_schedule_mandatory_fields_param_schedule_repeat_when_interval_and_periodicity_is_nil
    ledger = @ledger
    ledger.schedule_repeat = true
    ledger.schedule_periodicity = nil
    ledger.schedule_interval = nil
    ledger.valid?
    assert !ledger.errors.invalid?(:schedule_repeat)

    ledger.schedule_repeat = false
    ledger.schedule_periodicity = nil
    ledger.schedule_interval = nil
    ledger.valid?
    assert !ledger.errors.invalid?(:schedule_repeat)
  end

  def test_schedule_mandatory_fields_param_schedule_repeat_true_and_interval_and_periodicity_exist
    ledger = @ledger
    ledger.schedule_periodicity = @periodicity
    ledger.schedule_interval = 34
    ledger.schedule_repeat = false
    ledger.valid?
    assert ledger.errors.invalid?(:schedule_repeat)
  end

  def test_schedule_mandatory_fields_param_schedule_repeat_false_and_periodicity_is_nil
    ledger = @ledger
    ledger.schedule_periodicity = nil
    ledger.schedule_interval = 34
    ledger.schedule_repeat = false
    ledger.valid?
    assert ledger.errors.invalid?(:schedule_repeat)
  end

  def test_schedule_mandatory_fields_param_schedule_repeat_false_and_interval_is_nil
    ledger = @ledger
    ledger.schedule_periodicity = @periodicity
    ledger.schedule_interval = nil
    ledger.schedule_repeat = false
    ledger.valid?
    assert ledger.errors.invalid?(:schedule_repeat)
  end

  def test_value_is_not_negative
    p = Ledger.new
    p.valid?
    assert p.errors.invalid?(:value)
    p.value = -1.0
    p.valid?
    assert p.errors.invalid?(:value)    
  end

  def test_value_did_not_return_nil
    p = Ledger.new
    p.value = nil
    assert_not_nil p.value
  end

  def test_effective_date_when_done
    ledger = create_ledger()
    assert ledger.pending?
    assert_nil ledger.effective_date
    ledger.done!
    assert_not_nil ledger.effective_date
  end

  def test_effective_value_when_done
    ledger = create_ledger()
    assert ledger.pending?
    assert_nil ledger.effective_value
    ledger.done!
    assert_not_nil ledger.effective_value
  end


end
